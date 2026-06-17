<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログアウト</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
	<%@include file="menu.jsp"%>

	<div class="container">
		<p>ログアウトしますか？</p>
		<input type="button" value="ログアウト"
			onclick="location.href='${pageContext.request.contextPath}/jp/co/aforce/servlet/Logout.action'">
		<input type="button" value="キャンセル" onclick="history.back();">
	</div>

	<%@include file="footer.html"%>