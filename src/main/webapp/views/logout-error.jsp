<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログアウトエラー</title>
</head>
<body>
	<div class="container">
		<p>すでにログアウトしています。</p>
		<input type="button"
					value="ログイン画面に戻る" onclick="location.href='${pageContext.request.contextPath}/views/log-in.jsp'">
	</div>	
				
<%@include file="footer.html"%>