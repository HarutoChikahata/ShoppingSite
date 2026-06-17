<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
// 未ログインならログイン画面へ
jp.co.aforce.beans.Users userCheck = (jp.co.aforce.beans.Users) session.getAttribute("users");
if (userCheck == null) {
	response.sendRedirect(request.getContextPath() + "/views/log-in.jsp");
	return;
}
%>

<%@include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品詳細 - <c:out value="${item.itemName}" /></title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

	<%@include file="menu.jsp"%>

	<div class="container">
		<div class="detail-wrapper">

			<div class="detail-left">
				<img
					src="${pageContext.request.contextPath}/images/${item.imageUrl}"
					alt="${item.itemName}" class="detail-img">
			</div>

			<div class="detail-right">
				<h2 class="detail-title">
					<c:out value="${item.itemName}" />
				</h2>
				<p class="detail-price">
					<c:out value="${item.price}" />
				</p>

				<p style="font-size: 14px; color: #4a5568; margin: 0;">
					📦 現在の在庫数: <strong style="color: #2d7a4d; font-size: 16px;"><c:out
							value="${item.stockQuantity}" /></strong> 個
				</p>

				<div style="margin-top: 24px;">
					<form
						action="${pageContext.request.contextPath}/jp/co/aforce/servlet/CartInsert.action"
						method="post" class="cart-form">
						<input type="hidden" name="itemId" value="${item.itemId}">

						<label for="quantity"
							style="font-weight: bold; margin-right: 8px;">数量:</label> <select
							name="quantity" id="quantity"
							style="padding: 6px; border-radius: 4px; border: 1px solid #cbd5e1; margin-right: 15px;">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>

						<button type="submit" class="btn-cart"
							style="cursor: pointer; border: none;">🛒 買い物かごに入れる</button>
					</form>
				</div>

				<div class="detail-desc-box">
					<h3
						style="font-size: 16px; margin-bottom: 10px; color: #1a2a3a; font-weight: bold;">📋
						商品の詳しい説明</h3>
					<p style="color: #4a5568; line-height: 1.7; margin: 0;">
						<c:out value="${item.description}" />
					</p>
				</div>

				<div style="margin-top: 40px; text-align: right;">
					<a
						href="${pageContext.request.contextPath}/jp/co/aforce/servlet/Home.action"
						style="color: #64748b; text-decoration: none; font-size: 14px; font-weight: bold;">📂
						野球道具一覧に戻る</a>
				</div>
			</div>

		</div>
	</div>

	<%@include file="footer.html"%>