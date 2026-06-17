<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// 未ログイン、または管理者(admin)じゃなければホームへ強制送還
jp.co.aforce.beans.Users userCheck = (jp.co.aforce.beans.Users) session.getAttribute("users");
if (userCheck == null || !"admin".equals(userCheck.getUserRole())) {
	response.sendRedirect(request.getContextPath() + "/jp/co/aforce/servlet/Home.action");
	return;
}
%>

<%@include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品出品 - 管理者専用</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

	<%@include file="menu.jsp"%>

	<div class="container">
		<form action="${pageContext.request.contextPath}/jp/co/aforce/servlet/ItemExhibit.action" method="post" 
						enctype="multipart/form-data">
			<h2>📢 新しい野球道具を出品する</h2>
			
			<p>
				<label for="itemName">⚾ 商品名</label>
				<input type="text" id="itemName" name="itemName" placeholder="例：硬式用 内野手グローブ" required>
			</p>
			
			<p>
				<label for="description">📋 商品の説明</label>
				<input type="text" id="description" name="description" placeholder="例：ミズノプロの硬式用グローブです。" required>
			</p>
			
			<p>
				<label for="price">💰 価格 (円)</label>
				<input type="text" id="price" name="price" placeholder="例：58500" required>
			</p>
			
			<p>
				<label for="imageUrl">🖼️ 商品画像アップロード</label>
				<input type="file" id="imageUrl" name="imageUrl" required>
			</p>
			
			<p>
				<label for="stockQuantity">📦 初期在庫数 (個)</label>
				<input type="text" id="stockQuantity" name="stockQuantity" placeholder="例：5" required>
			</p>
			
			<div style="text-align: center; margin-top: 32px;">
				<input type="submit" value="✨ この道具を出品する">
			</div>
		</form>
	</div>

	<%@include file="footer.html"%>