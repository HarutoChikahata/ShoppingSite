<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログインエラー</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>

	<div class="container">
		<p>
			会員ID、メールアドレスまたはパスワードが違います。<br> <input type="button"
				value="ログイン画面に戻る"
				onclick="javascript:history.back();">
		</p>
	</div>

	<%@include file="footer.html"%>