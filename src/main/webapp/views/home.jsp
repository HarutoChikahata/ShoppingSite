<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
// 未ログインならログイン画面へ即送還
jp.co.aforce.beans.Users userCheck = (jp.co.aforce.beans.Users) session.getAttribute("users");
if (userCheck == null) {
	response.sendRedirect(request.getContextPath() + "/views/log_in.jsp");
	return;
}
%>

<%@include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ホーム</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

	<%@include file="menu.jsp"%>

	<div class="container main-layout">

		<main class="content-area">
			<div class="section-title-box"
				style="text-align: left; margin-bottom: 20px;">
				<h2>📢 出品中の野球道具一覧</h2>
			</div>

			<div class="item-grid">
				<c:forEach var="item" items="${list}">
					<div class="item-card">
						<img src="${pageContext.request.contextPath}/images/${item.imageUrl}" 
    						 alt="${item.itemName}" 
     						 style="width: 100%; height: 200px; object-fit: cover; border-radius: 6px 6px 0 0;">
						<h3>
							<c:out value="${item.itemName}" />
						</h3>
						<p class="price">
							¥
							<c:out value="${item.price}" />
						</p>
						<p class="stock">
							在庫:
							<c:out value="${item.stockQuantity}" />
							個
						</p>
						<a
							href="${pageContext.request.contextPath}/jp/co/aforce/servlet/ItemDetail.action?itemId=${item.itemId}"
							class="btn">詳細を見る</a>
					</div>
				</c:forEach>
			</div>
		</main>

	</div>

	<%@include file="footer.html"%>