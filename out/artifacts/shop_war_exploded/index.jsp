<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商城首页</title>
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/shouye.css"/>
    <script src="js/jquery-3.6.0.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/front_page.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

</head>

<body>
<div class="head" style="background-color: white; border-bottom: 1px solid #ccc;">
    <div class="head_zi" style="display: flex; justify-content: space-between; align-items: center;">
        <!-- 左侧固定欢迎语 -->
        <div class="left_top_icon" enterstyle="display: flex; align-items: c;">
            <svg data-slot="icon" fill="none" stroke-width="1.5" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" style="width:28px;height:28px;margin-right:6px;">
                <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 21v-7.5a.75.75 0 0 1 .75-.75h3a.75.75 0 0 1 .75.75V21m-4.5 0H2.36m11.14 0H18m0 0h3.64m-1.39 0V9.349M3.75 21V9.349m0 0a3.001 3.001 0 0 0 3.75-.615A2.993 2.993 0 0 0 9.75 9.75c.896 0 1.7-.393 2.25-1.016a2.993 2.993 0 0 0 2.25 1.016c.896 0 1.7-.393 2.25-1.015a3.001 3.001 0 0 0 3.75.614m-16.5 0a3.004 3.004 0 0 1-.621-4.72l1.189-1.19A1.5 1.5 0 0 1 5.378 3h13.243a1.5 1.5 0 0 1 1.06.44l1.19 1.189a3 3 0 0 1-.621 4.72M6.75 18h3.75a.75.75 0 0 0 .75-.75V13.5a.75.75 0 0 0-.75-.75H6.75a.75.75 0 0 0-.75.75v3.75c0 .414.336.75.75.75Z"></path>
            </svg>
            <span class="xinran">欣然</span>
        </div>
        <!--搜索框-->
        <div class="search_kuang">
            <div class="search">
                <input type="text" class="text">
                <button><img src="images/搜索图标.png" width="40px"></button>
            </div>
        </div>
        <!-- 右侧用户信息+购物车/登录注册，与欣然对称 -->
        <div class="right-user" style="display: flex; align-items: center;">
            <%
                String sessionUserId = (String) request.getSession().getAttribute("user_id");
                if (sessionUserId == null || sessionUserId.isEmpty()) {
            %>
                <div class="login" style="font-size:16px;">
                    <a href="auth.jsp" style="color:#333;text-decoration:none;">登录</a>
                    <span style="color:#ccc;margin:0 6px;">|</span>
                    <a href="auth.jsp" style="color:#333;text-decoration:none;">注册</a>
                </div>
            <%
                } else {
            %>
                <!-- 个人中心图标 -->
                <a href="manage.jsp" title="个人中心" style="display: inline-block; height: 28px; margin-right: 16px;">
                    <svg xmlns="http://www.w3.org/2000/svg" style="height:28px;width:28px;fill:black;" viewBox="0 0 24 24">
                        <path d="M12 12c2.7 0 5-2.3 5-5s-2.3-5-5-5-5 2.3-5 5 2.3 5 5 5zm0 2c-3.3 0-10 1.7-10 5v3h20v-3c0-3.3-6.7-5-10-5z"/>
                    </svg>
                </a>
                <!-- 购物车图标 -->
                <a href="car.jsp" title="购物车" style="display: inline-block; height: 28px;">
                    <svg version="1.1" xmlns="http://www.w3.org/2000/svg"
                         viewBox="0 0 456.029 456.029"
                         style="height: 28px; width: 28px; fill: black;">
                        <g>
                            <g>
                                <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248
                                 c0,29.184,23.552,53.248,53.248,53.248
                                 c29.184,0,53.248-23.552,53.248-53.248
                                 C398.336,362.926,374.784,338.862,345.6,338.862z"></path>
                            </g>
                        </g>
                        <g>
                            <g>
                                <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512
                                 H112.64l-5.12-34.304
                                 C104.448,27.566,84.992,10.67,61.952,10.67
                                 H20.48C9.216,10.67,0,19.886,0,31.15
                                 c0,11.264,9.216,20.48,20.48,20.48
                                 h41.472c2.56,0,4.608,2.048,5.12,4.608
                                 l31.744,216.064
                                 c4.096,27.136,27.648,47.616,55.296,47.616
                                 h212.992c26.624,0,49.664-18.944,55.296-45.056
                                 l33.28-166.4
                                 C457.728,97.71,450.56,86.958,439.296,84.91z"></path>
                            </g>
                        </g>
                        <g>
                            <g>
                                <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688
                                 c-29.696,1.536-52.224,26.112-51.2,55.296
                                 c1.024,28.16,24.064,50.688,52.224,50.688
                                 h1.024C193.536,443.31,216.576,418.734,215.04,389.55z"></path>
                            </g>
                        </g>
                    </svg>
                </a>
            <%
                }
            %>
        </div>
    </div>
</div>


<div class="shop">
    <!-- 轮播图开始 -->
    <div id="my_slider" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="images/mi11.png" class="d-block w-100" alt="Xiaomi 11">
            </div>
            <div class="carousel-item">
                <img src="images/pingban5.png" class="d-block w-100" alt="平板5">
            </div>
            <div class="carousel-item">
                <img src="images/450ebe4e2420eba7064b6ce08b2fc503.jpg" class="d-block w-100" alt="Image 3">
            </div>
            <div class="carousel-item">
                <img src="images/3e34ddd6b7bcbfb90ed09e871d291593.png" class="d-block w-100" alt="Image 4">
            </div>
            <div class="carousel-item">
                <img src="images/f89261d8655d76f2ab2340e4a3738678.jpg" class="d-block w-100" alt="Image 5">
            </div>
        </div>
        <a class="carousel-control-prev" href="#my_slider" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#my_slider" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <div class="nei">
        <div class="box_tit w">
            <h2 class="title">手机</h2>
            <div class="nei_pohot">
                <ul>
                    <li class="phone_tu">
                        <a href="./detail.do?id=10001">
                            <div class="ph">
                                <img src="images/phone/63e15f377e87212d460592b4a1369ccd.jpg" >
                            </div>
                            <div class="na">Xiaomi 12X</div>
                            <p>￥3199</p>
                        </a>
                    </li>

                    <li class="phone_tu">
                        <a href="./detail.do?id=phone02">
                            <div class="ph">
                                <img src="images/phone/a7382271e3a677bf188679ca38d68a42.jpg" >
                            </div>
                            <div class="na">Xiaomi 12 Pro</div>
                            <p>￥4699</p>
                        </a>
                    </li>

                    <li class="phone_tu">
                        <a href="./detail.do?id=phone03">
                            <div class="ph">
                                <img src="images/phone/0d4b362431de4bdda03315ffdbc7b32a.jpg" >
                            </div>
                            <div class="na">
                                Xiaomi 11 青春活力版
                            </div>
                            <p>￥1999</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=phone04">
                            <div class="ph">
                                <img src="images/phone/6d0a3e7acc3e91e2cfd83dbbe1d1c029.jpg" >
                            </div>
                            <div class="na">
                                Redmi Note 11 Pro系列
                            </div>
                            <p>￥1799</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=book01">
                            <div class="ph">
                                <img src="images/carts/f84ce8d17e55cf74.jpg" >
                            </div>
                            <div class="na">Vue.js全家桶零基础入门到进阶项目实战</div>
                            <p>￥99.20</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=book02">
                            <div class="ph">
                                <img src="images/carts/8e7d4ce45fdacb89.jpg" >
                            </div>
                            <div class="na">CSS新世界</div>
                            <p>￥108.80</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=book03">
                            <div class="ph">
                                <img src="images/188b8e81859a3051.jpg" >
                            </div>
                            <div class="na">
                                CSS世界(异步图书出品)
                            </div>
                            <p>￥57.80</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=phone04">
                            <div class="ph">
                                <img src="images/phone/6d0a3e7acc3e91e2cfd83dbbe1d1c029.jpg" >
                            </div>
                            <div class="na">
                                Redmi Note 11 Pro系列
                            </div>
                            <p>￥1799</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="box_tit w">
            <h2 class="title">电脑</h2>
            <div class="nei_pohot">
                <ul>
                    <li class="phone_tu">
                        <a href="./detail.do?id=com01">
                            <div class="ph">
                                <img src="images/computer/dbeee1b261367546.jpg" >
                            </div>
                            <div class="na">微星(MSI)PRO 电脑主板</div>
                            <p>￥3629</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=com02">
                            <div class="ph">
                                <img src="images/computer/8079c5b8a20b6eb7.jpg" >
                            </div>
                            <div class="na">新品英特尔酷睿12代</div>
                            <p>￥1999</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=com03">
                            <div class="ph">
                                <img src="images/computer/O1CN01XdmjpR1IOuqoGgg5r_!!2616970884.jpg" >
                            </div>
                            <div class="na">
                                笔记本电脑小新Air14 银
                            </div>
                            <p>￥4399</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=com04">
                            <div class="ph">
                                <img src="images/computer/f063016c41fa50de.jpg" >
                            </div>
                            <div class="na">
                                索尼（SONY）playstation5
                            </div>
                            <p>￥5099</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=com01">
                            <div class="ph">
                                <img src="images/computer/dbeee1b261367546.jpg" >
                            </div>
                            <div class="na">微星(MSI)PRO 电脑主板</div>
                            <p>￥3629</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=com02">
                            <div class="ph">
                                <img src="images/computer/8079c5b8a20b6eb7.jpg" >
                            </div>
                            <div class="na">新品英特尔酷睿12代</div>
                            <p>￥1999</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=com03">
                            <div class="ph">
                                <img src="images/computer/O1CN01XdmjpR1IOuqoGgg5r_!!2616970884.jpg" >
                            </div>
                            <div class="na">
                                笔记本电脑小新Air14 银
                            </div>
                            <p>￥4399</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=com04">
                            <div class="ph">
                                <img src="images/computer/f063016c41fa50de.jpg" >
                            </div>
                            <div class="na">
                                索尼（SONY）playstation5
                            </div>
                            <p>￥5099</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="box_tit w">
            <h2 class="title">家用电器</h2>
            <div class="nei_pohot">
                <ul>
                    <li class="phone_tu">
                        <a href="./detail.do?id=home01">
                            <div class="ph">
                                <img src="images/home/181a74dccd6f4a71.jpg" >
                            </div>
                            <div class="na">
                                西门子（SIEMENS）蒸烤箱一体机嵌入式
                            </div>
                            <p>￥7999</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=home02">
                            <div class="ph">
                                <img src="images/home/c7c15101f2c8a652a4a0d069501d1e53.jpg" >
                            </div>
                            <div class="na">小米电视6 至尊版 65英寸</div>
                            <p>￥7999</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=home03">
                            <div class="ph">
                                <img src="images/home/cf71655746411c0f.jpg!cc_320x320.webp" >
                            </div>
                            <div class="na">
                                亿田（entive）D2ZK 集成灶蒸烤一体
                            </div>
                            <p>￥13800</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=home04">
                            <div class="ph">
                                <img src="images/home/33508813f3a5059d.jpg" >
                            </div>
                            <div class="na">
                                卡萨帝（Casarte）635升四开门十字对开门冰箱
                            </div>
                            <p>￥12499</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=home01">
                            <div class="ph">
                                <img src="images/home/181a74dccd6f4a71.jpg" >
                            </div>
                            <div class="na">
                                西门子（SIEMENS）蒸烤箱一体机嵌入式
                            </div>
                            <p>￥7999</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=home02">
                            <div class="ph">
                                <img src="images/home/c7c15101f2c8a652a4a0d069501d1e53.jpg" >
                            </div>
                            <div class="na">小米电视6 至尊版 65英寸</div>
                            <p>￥7999</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=home03">
                            <div class="ph">
                                <img src="images/home/cf71655746411c0f.jpg!cc_320x320.webp" >
                            </div>
                            <div class="na">
                                亿田（entive）D2ZK 集成灶蒸烤一体
                            </div>
                            <p>￥13800</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=home04">
                            <div class="ph">
                                <img src="images/home/33508813f3a5059d.jpg" >
                            </div>
                            <div class="na">
                                卡萨帝（Casarte）635升四开门十字对开门冰箱
                            </div>
                            <p>￥12499</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="box_tit w">
            <h2 class="title">服饰</h2>
            <div class="nei_pohot">
                <ul>
                    <li class="phone_tu">
                        <a href="./detail.do?id=clothes01">
                            <div class="ph">
                                <img src="images/clothes/16fea7d7bb3f9144.jpg" >
                            </div>
                            <div class="na">梵希蔓垂感卡其色西装外套女</div>
                            <p>￥299</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=clothes02">
                            <div class="ph">
                                <img src="images/clothes/7ea39f5f4878b162.jpg" >
                            </div>
                            <div class="na">海青蓝时尚通勤小西服女</div>
                            <p>￥358</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=clothes03">
                            <div class="ph">
                                <img src="images/clothes/703d1f6c28d1c818.jpg" >
                            </div>
                            <div class="na">
                                森马卫衣男2021秋新款oversize创意图案
                            </div>
                            <p>￥139</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=clothes04">
                            <div class="ph">
                                <img src="images/clothes/4cc75617291b3b63.jpg" >
                            </div>
                            <div class="na">
                                Lilbetter情侣重磅卫衣男加绒
                            </div>
                            <p>￥215</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=clothes01">
                            <div class="ph">
                                <img src="images/clothes/16fea7d7bb3f9144.jpg" >
                            </div>
                            <div class="na">梵希蔓垂感卡其色西装外套女</div>
                            <p>￥299</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=clothes02">
                            <div class="ph">
                                <img src="images/clothes/7ea39f5f4878b162.jpg" >
                            </div>
                            <div class="na">海青蓝时尚通勤小西服女</div>
                            <p>￥358</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=clothes03">
                            <div class="ph">
                                <img src="images/clothes/703d1f6c28d1c818.jpg" >
                            </div>
                            <div class="na">
                                森马卫衣男2021秋新款oversize创意图案
                            </div>
                            <p>￥139</p>
                        </a>
                    </li>
                    <li class="phone_tu">
                        <a href="./detail.do?id=clothes04">
                            <div class="ph">
                                <img src="images/clothes/4cc75617291b3b63.jpg" >
                            </div>
                            <div class="na">
                                Lilbetter情侣重磅卫衣男加绒
                            </div>
                            <p>￥215</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="nav">
    <ul>
        <li class="current">手机</li>
        <li>电脑</li>
        <li>家居</li>
        <li>服饰</li>
        <div class="back">返回顶部</div>
    </ul>
</div>

<div class="footer">
    <div class="translate">
        <div class="footer-links">
            <h5>购物指南</h5>
            <ul>
                <li><a href="#">购物流程</a></li>
                <li><a href="#">会员介绍</a></li>
                <li><a href="#">生活旅行</a></li>
                <li><a href="#">常见问题</a></li>
                <li><a href="#">联系客服</a></li>
            </ul>
        </div>
        <div class="footer-links">
            <h5>支付方式</h5>
            <ul>
                <li><a href="#">信用卡</a></li>
                <li><a href="#">货到付款</a></li>
                <li><a href="#">在线付款</a></li>
                <li><a href="#">分期付款</a></li>
            </ul>
        </div>
        <div class="footer-links">
            <h5>售后服务</h5>
            <ul>
                <li><a href="#">售后政策</a></li>
                <li><a href="#">退款说明</a></li>
                <li><a href="#">返修/退换货</a></li>
            </ul>
        </div>
        <div class="footer-links">
            <h5>帮助中心</h5>
            <ul>
                <li><a href="#">账户管理</a></li>
                <li><a href="#">自助服务</a></li>
                <li><a href="#">订单操作</a></li>
                <li><a href="#">服务网点</a></li>
                <li><a href="#">授权体验店/专区</a></li>
            </ul>
        </div>
        <div class="footer-links">
            <h5>关于我们</h5>
            <ul>
                <li><a href="#">新浪微博</a></li>
                <li><a href="#">官方微信</a></li>
                <li><a href="#">联系我们</a></li>
                <li><a href="#">加入我们</a></li>
                <li><a href="#">公益基金会</a></li>
            </ul>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>