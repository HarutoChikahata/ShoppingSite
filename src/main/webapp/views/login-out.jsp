<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>ログイン成功</title>
</head>

<body>

	<div class="container">こんにちは、${users.lastName}さん。</div>

<%@include file="footer.html"%>