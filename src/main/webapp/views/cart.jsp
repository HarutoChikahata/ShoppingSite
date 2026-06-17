<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>🛒 買い物かご</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

    <%@include file="menu.jsp"%>

    <div class="container cart-container">
        <h2>🛒 あなたの買い物かご</h2>
        
        <c:if test="${empty sessionScope.cart}">
            <div class="cart-empty-box">
                <p>買い物かごは空っぽです。自慢の野球道具を探しに行きましょう！</p>
                <a href="${pageContext.request.contextPath}/jp/co/aforce/servlet/Home.action" class="btn">ホームに戻る</a>
            </div>
        </c:if>

        <c:if test="${not empty sessionScope.cart}">
            <table class="cart-table">
                <thead>
                    <tr>
                        <th>商品画像</th>
                        <th>道具名</th>
                        <th class="text-right">価格</th>
                        <th class="text-center">操作</th>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="totalPrice" value="0" />
                    <c:forEach var="item" items="${sessionScope.cart}" varStatus="status">
                        <tr>
                            <td>
                                <img src="${pageContext.request.contextPath}/images/${item.imageUrl}" class="cart-item-img">
                            </td>
                            <td class="cart-item-name">
                                <c:out value="${item.itemName}" />
                            </td>
                            <td class="cart-item-price">
                                ¥<c:out value="${item.price}" />
                            </td>
                            <td class="text-center">
                                <a href="${pageContext.request.contextPath}/jp/co/aforce/servlet/CartRemove.action?index=${status.index}" class="btn-delete">❌ 削除</a>
                            </td>
                        </tr>
                        <c:set var="totalPrice" value="${totalPrice + item.price}" />
                    </c:forEach>
                </tbody>
            </table>

            <div class="cart-summary-box">
                <h3 class="total-price-text">
                    合計金額: <span>¥<c:out value="${totalPrice}" /></span>
                </h3>
                <div class="cart-action-group">
                    <a href="${pageContext.request.contextPath}/jp/co/aforce/servlet/Home.action" class="btn-continue">買い物を続ける</a>
                    <a href="${pageContext.request.contextPath}/jp/co/aforce/servlet/OrderConfirmAction.action" class="btn-checkout">次へ（購入確認へ）👉</a>
                </div>
            </div>
        </c:if>
    </div>

    <%@include file="footer.html"%>