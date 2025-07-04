-- 创建数据库
CREATE DATABASE IF NOT EXISTS shop CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE shop;

-- 用户表
CREATE TABLE IF NOT EXISTS user (
    user_id VARCHAR(64) PRIMARY KEY NOT NULL UNIQUE,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL,
    sex INT(11),
    email VARCHAR(100),
    birth DATE,
    phone VARCHAR(20),
    address VARCHAR(255),
    creationTime DATE NOT NULL,
    power INT(11) DEFAULT 0 NOT NULL
);

-- 商品表
CREATE TABLE IF NOT EXISTS goods (
    goods_id VARCHAR(10) PRIMARY KEY NOT NULL,
    goods_name VARCHAR(100) NOT NULL,-- 商品名称
    category VARCHAR(50) NOT NULL,-- 商品类别分类
    stock INT(11) NOT NULL,-- 商品库存数量
    factory VARCHAR(11) NOT NULL,-- 生产厂家
    photo VARCHAR(255) NOT NULL, -- 商品封面图片
    unitprice DECIMAL(10,2) NOT NULL,-- 商品单价
    details TEXT,#商品详细介绍
    add_time INT(11) NOT NULL,-- 商品上架时间
    change_time INT(11) NOT NULL,-- 商品信息最近更新时间
    good_state INT(11) DEFAULT 0 NOT NULL -- 商品状态，0:正常, 1:下架
);

-- 购物车表
# CREATE TABLE IF NOT EXISTS cart (
#     goods_id VARCHAR(10) PRIMARY KEY NOT NULL,
#     user_id VARCHAR(10) PRIMARY KEY NOT NULL ,
#     goods_name VARCHAR(100) NOT NULL,
#     unitprice DECIMAL(10,2) NOT NULL,
#     quantity INT(11) NOT NULL,
#     FOREIGN KEY (goods_id) REFERENCES goods(goods_id)
# );
CREATE TABLE IF NOT EXISTS cart (
    cart_id INT(11) AUTO_INCREMENT PRIMARY KEY,  -- 自增主键
    user_id VARCHAR(10) NOT NULL,
    goods_id VARCHAR(10) NOT NULL,
    goods_name VARCHAR(100) NOT NULL,
    unitprice DECIMAL(10,2) NOT NULL,
    quantity INT(11) NOT NULL DEFAULT 1,
    pic VARCHAR(255),
    create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY unique_user_goods (user_id, goods_id),  -- 唯一索引防重复
    FOREIGN KEY (goods_id) REFERENCES goods(goods_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    INDEX idx_user_id (user_id)  -- 用户ID索引，提高查询效率
);

-- 订单表
CREATE TABLE IF NOT EXISTS orders (
    order_id VARCHAR(64) PRIMARY KEY NOT NULL,-- 创建的订单编号
    user_id VARCHAR(64) NOT NULL,-- 创建订单的用户账号
    name VARCHAR(64) NOT NULL ,-- 商品名称
    order_state INT(11) DEFAULT 0 NOT NULL, -- 订单状态，0:待支付, 1:已支付, 2:已发货, 3:订单取消
    quantity INT(11) NOT NULL,-- 商品数量
    totalPrice DECIMAL(10,2) NOT NULL,-- 订单中商品总价
    creationTime DATETIME NOT NULL ,-- 订单生产创建时间
    address VARCHAR(64) NOT NULL ,-- 收货地址
    pay_time DATETIME ,-- 支付时间
    ship_time DATETIME  ,-- 商品发货时间
    receipt_time DATETIME  ,-- 确认收货时间
    receipt_name VARCHAR(64) NOT NULL ,-- 订单上收件人的名字
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE TABLE IF NOT EXISTS order_detail (
    order_id VARCHAR(64) PRIMARY KEY NOT NULL,
    goods_id VARCHAR(10) NOT NULL,
    goods_name VARCHAR(100) NOT NULL,
    unitprice DECIMAL(10,2) NOT NULL,-- 价格
    order_num INT(11) NOT NULL#该商品下单数量

);


INSERT INTO goods (
    goods_id,
    goods_name,
    category,
    stock,
    factory,
    photo,
    unitprice,
    details,
    add_time,
    change_time,
    good_state
) VALUES (
             '10001',
             'xiaomi 12x',
             '手机',
             100,
             '小米',
             'images/phone/63e15f377e87212d460592b4a1369ccd.jpg',
             3199.00,
             ' 小米12X，骁龙870，120Hz AMOLED屏幕，67W快充。',
             UNIX_TIMESTAMP(),
             UNIX_TIMESTAMP(),
             0
         );
