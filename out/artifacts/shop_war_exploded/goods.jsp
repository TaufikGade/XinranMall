<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品列表</title>
</head>
<body>
<h1>商品列表</h1>

<!-- 使用 JSTL 来遍历 goodsList -->
<c:forEach var="good" items="${goodsList}">
    <div class="product">
        <h2>${good.goods_name}</h2>
        <p>价格: ${good.unitprice}元</p>
        <img src="${good.photo}" alt="${good.goods_name}" width="350px">
    </div>
</c:forEach>
</body>
</html>
