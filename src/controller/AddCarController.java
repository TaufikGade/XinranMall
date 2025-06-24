package controller;

import beans.Car;
import beans.Good;
import utils.JDBCUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/addcar.do")
public class AddCarController extends HttpServlet {

    private static final long serialVersionUID = 7804524886360637172L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");

            HttpSession session = request.getSession();
            String id = request.getParameter("id");
            Object user_id = session.getAttribute("user_id");

            connection = JDBCUtils.getConnection();

            // 1. 查询商品信息
            String sql = "SELECT * FROM goods WHERE goods_id=?";
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, id);
            rs = stmt.executeQuery();

            Good good = new Good();
            if (rs.next()) {
                good.setGoods_id(rs.getString("goods_id"));
                good.setGoods_name(rs.getString("goods_name"));
                good.setUnitprice(rs.getString("unitprice"));
                good.setDetails(rs.getString("details"));
                good.setPhoto(rs.getString("photo"));
            }
            rs.close();
            stmt.close();

            // 2. 检查购物车中是否已存在该商品
            String checkSql = "SELECT quantity FROM cart WHERE user_id=? AND goods_id=?";
            stmt = connection.prepareStatement(checkSql);
            stmt.setString(1, user_id.toString());
            stmt.setString(2, good.getGoods_id());
            rs = stmt.executeQuery();

            if (rs.next()) {
                // 商品已存在，更新数量
                int currentQuantity = rs.getInt("quantity");
                rs.close();
                stmt.close();

                String updateSql = "UPDATE cart SET quantity=?, update_time=CURRENT_TIMESTAMP WHERE user_id=? AND goods_id=?";
                stmt = connection.prepareStatement(updateSql);
                stmt.setInt(1, currentQuantity + 1);
                stmt.setString(2, user_id.toString());
                stmt.setString(3, good.getGoods_id());

                int updateResult = stmt.executeUpdate();
                if (updateResult > 0) {
                    System.out.println("商品数量更新成功");
                }
            } else {
                // 商品不存在，插入新记录
                rs.close();
                stmt.close();

                String insertSql = "INSERT INTO cart (user_id, goods_id, goods_name, unitprice, quantity, pic) VALUES (?,?,?,?,?,?)";
                stmt = connection.prepareStatement(insertSql);
                stmt.setString(1, user_id.toString());
                stmt.setString(2, good.getGoods_id());
                stmt.setString(3, good.getGoods_name());
                stmt.setString(4, good.getUnitprice());
                stmt.setInt(5, 1);
                stmt.setString(6, good.getPhoto());

                int insertResult = stmt.executeUpdate();
                if (insertResult > 0) {
                    System.out.println("商品添加成功");
                }
            }
            stmt.close();

            // 3. 查询用户购物车
            String cartSql = "SELECT * FROM cart WHERE user_id=?";
            stmt = connection.prepareStatement(cartSql);
            stmt.setString(1, user_id.toString());
            rs = stmt.executeQuery();

            List<Car> carList = new ArrayList<>();
            while (rs.next()) {
                Car car = new Car();
                car.setGoods_id(rs.getString("goods_id"));
                car.setGoods_name(rs.getString("goods_name"));
                car.setUnitprice(rs.getString("unitprice"));
                car.setQuantity(rs.getString("quantity"));
                car.setPic(rs.getString("pic"));
                carList.add(car);
            }

            request.getSession().setAttribute("carList", carList);
            response.sendRedirect("cart.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            try {
                response.sendRedirect("error.jsp");
            } catch (IOException ioException) {
                ioException.printStackTrace();
            }
        } finally {
            // 确保资源被正确关闭
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}