<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログアウト</title>
</head>
<body>
	<div class="container">
		<p>ログアウトしますか？</p>
		<input type="button" value="ログアウト"
			onclick="location.href='${pageContext.request.contextPath}/jp/co/aforce/servlet/Logout.action'">
		<input type="button" value="キャンセル"
			onclick="location.href='user-menu.jsp'">
	</div>
	
<%@include file="footer.html"%>