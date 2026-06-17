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
<title>退会内容確認</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

	<div class="container">
		<h2>退会内容の最終確認</h2>

		<p>
			アカウントを完全に削除します。<br> <span>この操作は取り消せません。</span>本当によろしいですか？
		</p>


		<form
			action="${pageContext.request.contextPath}/jp/co/aforce/servlet/UserDelete.action"
			method="post">

			<input type="hidden" name="mode" value="delete"> <input
				type="hidden" name="action_type" value="commit">

			<div>
				<input type="submit" value="承諾して、完全に退会する"> <input
					type="button" value="戻る" onclick="history.back()">
			</div>
		</form>
	</div>

	<%@include file="footer.html"%>