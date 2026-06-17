<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
// セッションからログインユーザー情報を取得
jp.co.aforce.beans.Users loginUser = (jp.co.aforce.beans.Users) session.getAttribute("users");
if (loginUser == null) {
	response.sendRedirect("log_in.jsp");
	return;
}
%>

<%@include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>退会手続き</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

	<div class="container text-center"
		style="max-width: 500px; margin-top: 50px;">
		<div class="warning-box">
			<h2>退会手続き（アカウント削除）</h2>

			<p>
				現在ログイン中の会員アカウント（ID: <strong><%=loginUser.getMemberId()%></strong>）をシステムから完全に削除します。<br>
				退会すると、元に戻すことはできません。
			</p>

			<hr>

			<form
				action="${pageContext.request.contextPath}/jp/co/aforce/servlet/UserDelete.action"
				method="post">
				<input type="hidden" name="mode" value="delete"> 
				<input type="hidden" name="action_type" value="check">

				<p>
					<input type="submit" value="退会確認画面へ進む"> 
					<input type="button" value="メニューに戻る"
						onclick="history.back();">
				</p>
			</form>
		</div>
	</div>

	<%@include file="footer.html"%>