package service;
import utils.JDBCUtils;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Register {
    public Integer register(String username, String user_id, String password, String email, String birth, String phone, String address) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = JDBCUtils.getConnection();
            String date = getCurDatetiment();
            String sql = "INSERT INTO user(user_id,username, password, email, birth, phone, address, creationTime) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, user_id);
            ps.setString(3, password);
            ps.setString(4, email);
            ps.setString(5, birth);
            ps.setString(6, phone);
            ps.setString(7, address);
            ps.setString(8, date);

            int rtn = ps.executeUpdate();
            System.out.println(conn);
            return rtn;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                JDBCUtils.closeQuietly(ps, conn);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return 0;
    }

    private String getCurDatetiment() {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return format.format(new Date());
    }

    public boolean login(String user_id, String password) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = JDBCUtils.getConnection();
            String sql = "SELECT * FROM user WHERE user_id = ? AND password = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, user_id);
            ps.setString(2, password);
            rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    JDBCUtils.closeQuietly(rs);
                }
                JDBCUtils.closeQuietly(ps, conn);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }
}