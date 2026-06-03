<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Baseball Reference</title>
</head>
<body>


	<div class="container start-page-container">
		<div class="hero-section">
			<h1>🥎Baseball Reference</h1>
			<p class="lead-text">使っていないグローブやバット、眠っている大切な道具を次のプレーヤーへ。</p>
		</div>

		<div class="action-box">
			<p>ログインするか、新規会員登録を行ってください。</p>
			<div class="start-buttons">
				<input type="button" value="ログイン画面へ" class="btn btn-primary"
					onclick="location.href='${pageContext.request.contextPath}/views/log-in.jsp'">

				<input type="button" value="新規会員登録画面へ" class="btn btn-secondary"
					onclick="location.href='${pageContext.request.contextPath}/views/user-register.jsp'">
			</div>
		</div>
	</div>

	<%@include file="footer.html"%>