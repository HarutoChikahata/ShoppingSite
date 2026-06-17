<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注文内容確認</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

    <header>
        <h1>野球道具専門店 - 注文内容確認</h1>
    </header>

    <div class="container">
        <h2>以下の内容で注文を確定しますか？</h2>
        
        <div class="user-info-box">
            <h3>■ お届け先情報</h3>
            <p><strong>お名前：</strong> ${users.lastName} ${users.firstName} 様</p>
            <p><strong>ご住所：</strong> ${users.address}</p>
            <p><strong>電話番号：</strong> ${users.phoneNumber}</p>
        </div>

        <h3>■ 注文商品明細</h3>
        <table border="1">
            <tr>
                <th>商品名</th>
                <th>価格</th>
                <th>数量</th>
                <th>小計</th>
            </tr>
            <c:forEach var="cart" items="${cart}">
                <tr>
                    <td>${cart.itemName}</td>
                    <td>${cart.price} 円</td>
                    <td>${cart.getQuantity()} 個</td>
                    <td>${cart.price * cart.getQuantity()} 円</td>
                </tr>
            </c:forEach>
        </table>

        <div class="total-box">
            <h3>ご請求金額： <span class="price-text">${totalAmount} 円</span></h3>
        </div>

        <form action="${pageContext.request.contextPath}/jp/co/aforce/servlet/OrderComplete.action" method="post">
            <div class="payment-box">
                <h3>■ お支払い方法</h3>
                <label><input type="radio" name="paymentMethod" value="クレジットカード" checked> クレジットカード</label><br>
                <label><input type="radio" name="paymentMethod" value="代金引換"> 代金引換</label><br>
                <label><input type="radio" name="paymentMethod" value="コンビニ払い"> コンビニ払い</label>
            </div>

            <div class="btn-area">
                <a href="${pageContext.request.contextPath}/views/cart.jsp" class="btn-back">カートに戻る</a>
                <input type="submit" value="注文を確定する" class="btn-submit">
            </div>
        </form>
    </div>

 <%@include file="footer.html"%>