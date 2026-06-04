<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会員登録完了</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>
	<div class="container text-center">
		<p>会員登録が完了しました。</p>
		<p>
			<input type="button" value="ホームへ"
				onclick="location.href='${pageContext.request.contextPath}/views/user-menu.jsp'">
		</p>
	</div>
	<%@include file="footer.html"%>