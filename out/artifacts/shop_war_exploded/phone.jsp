<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@page import="java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="good" value="${sessionScope.good}" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>商品详情</title>
        <link rel="stylesheet" type="text/css" href="css/public.css"/>
        <link rel="stylesheet" type="text/css" href="css/book.css"/>
    </head>
    <body>
        <div class="head">
            <div class="shouye_head">
                <div class="shou_head">
                    <a href="index.jsp">商城首页</a>
                </div>
                <div class="car">
                    <a href="car.jsp"><img src="images/购物车.png" height="28px">
                        <span>购物车</span>
                    </a>
                </div>
                <div class="login">
                    <div><a href="auth.jsp">登录</a></div>
                    <div><a href="auth.jsp">注册</a></div>
                </div>
            </div>
        </div>
        <div class="search_kuang">
            <div class="search">
                <input type="text" class="text">
                <button><img src="images/搜索图标.png" width="40px"></button>
            </div>
        </div>
        <div class="xi_nav">
            <div class="wrap">
                <ul class="menu-list">
                    <li class="menu"><a href="index.jsp">首页</a></li>
                    <li class="menu"><a href="#">全部分类</a></li>
                    <li class="menu"><a href="#">新品上市</a></li>
                    <li class="menu"><a href="#">热卖推荐</a></li>
                </ul>
            </div>
        </div>
        <div class="w">
            <div class="preview" id="preview">
                <div class="photo_xi">
    <p>图片路径：${good.photo}</p> <!-- 调试用，显示图片路径 -->
                    <img src="${good.photo}" width="350px">
                    
                </div>
            </div>
            <div class="itemInfo-wrap">
                <div class="x-goodsname">
                    <h3>${good.goods_name}</h3>
                </div>
                <div class="news">
                    <div class="" >
                        ${good.details}
                    </div>
                </div>
                <div class="x-price">
                    <span>￥</span>
                    <div class="x-price_num">${good.unitprice}</div>
                </div>
                <div class="x-action">
                    <div class="liji">
                        <a href="#">立即购买</a>
                    </div>
                    <div class="add_cart">
                        <a href="./addcar.do?id=${good.goods_id}">加入购物车</a>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>
