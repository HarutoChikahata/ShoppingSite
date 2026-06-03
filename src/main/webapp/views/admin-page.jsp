<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
jp.co.aforce.beans.Users userCheck = (jp.co.aforce.beans.Users) session.getAttribute("users");

// ログインしていても権限がadminじゃなければログイン画面へ
if (userCheck == null || !"admin".equals(userCheck.getUserRole())) {
	response.sendRedirect("log-in.jsp");
	return;
}
%>
<c:set var="pageTitle" value="管理者システム" scope="request" />
<%@include file="header.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会員メニュー</title>
</head>
<body>
	<%@include file="menu.jsp"%>

	<div class="container admin-container">
		<div class="welcome-box" style="border-left-color: #d9534f;">
			<h2>管理者専用画面</h2>
			<p>ユーザー管理、不適切な商品の削除、売上データの確認を行うための管理用ページです。</p>
		</div>

		<div class="admin-menu-grid"
			style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-top: 20px;">
			<div class="admin-card"
				style="background: #f8f9fa; padding: 20px; border-radius: 6px; border: 1px solid #dee2e6;">
				<h3>👥 ユーザー管理</h3>
				<p>登録されている全ての会員の情報の閲覧、利用停止等を行えます。</p>
				<a href="#" class="btn btn-primary"
					style="background-color: #1a3c40;">ユーザー一覧</a>
			</div>

			<div class="admin-card"
				style="background: #f8f9fa; padding: 20px; border-radius: 6px; border: 1px solid #dee2e6;">
				<h3>📦 出品データ管理</h3>
				<p>現在出品されている商品のチェック、違反商品の削除を行います。</p>
				<a href="#" class="btn btn-secondary">出品リスト</a>
			</div>
		</div>
	</div>

	<%@include file="footer.html"%>