<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会員情報変更完了</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

	<div class="container text-center">
		<h2>会員情報の変更が完了しました</h2>

		<div class="welcome-box";>
			<p>
				<strong>
				<c:out value="${users.lastName}" /> 
				<c:out value="${users.firstName}" />
				</strong> さんの情報を更新しました。
			</p>
			<p class="status-badge">
				現在の登録メールアドレス:
				<c:out value="${users.mailAddress}" />
			</p>
		</div>


		<input type="button" value="マイページに戻る"
			onclick="location.href='${pageContext.request.contextPath}/views/user-menu.jsp'">
		</p>
	</div>

	<%@include file="footer.html"%>