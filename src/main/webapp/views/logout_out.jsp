<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログアウト完了</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
	<div class="container">
		<p>ログアウトしました。</p>
		<input type="button" value="ログイン画面に戻る"
			onclick="location.href='${pageContext.request.contextPath}/views/log_in.jsp'">
	</div>

	<%@include file="footer.html"%>