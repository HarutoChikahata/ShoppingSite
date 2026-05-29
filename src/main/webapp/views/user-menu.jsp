<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	Object user=session.getAttribute("users");
	
	if(user==null){
		response.sendRedirect("log-in.jsp");
		return;
	}
%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>会員メニュー</title>
</head>

<body>

	<div class="container">
		<h2>会員情報登録ホーム</h2>

		<p>ようこそ、${users.lastName}さん！</p>

		<div class="menu-buttons">
			<p>
				<input type="button" value="修正"
					onclick="location.href='${pageContext.request.contextPath}/views/user-update.jsp'">
			</p>
			<p>
				<input type="button" value="削除"
					onclick="location.href='user-delete.jsp'">
			</p>
			<p>
				<input type="button" value="ログアウト"
					onclick="location.href='${pageContext.request.contextPath}/views/logout-in.jsp'">
			</p>
		</div>

		<%@include file="footer.html"%>