<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>削除完了</title>
</head>

<body>
	<div class="container text-center">
		<p>削除が完了しました。</p>
		<p>
			<input type="button" value="スタート画面に戻る"
				onclick="location.href='${pageContext.request.contextPath}/views/start.jsp'">
		</p>
	</div>
	<%@include file="footer.html"%>