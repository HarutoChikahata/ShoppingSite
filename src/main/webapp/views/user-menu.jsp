<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Object user = session.getAttribute("users");

if (user == null) {
	response.sendRedirect("log-in.jsp");
	return;
}
%>

<%@include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会員メニュー</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

	<%@include file="menu.jsp"%>

	<div class="container dashboard-container">
		<div class="welcome-box">
			<h2>会員情報登録ホーム</h2>
			<p class="welcome-message">
				ようこそ、<strong>${users.lastName} </strong> さん！
			</p>
			<p class="status-badge">現在のステータス: ログイン中 (会員ID: ${users.memberId})</p>
		</div>

		<div class="management-section">
			<h3>アカウント管理</h3>
			<div class="management-buttons">
				<p>
					<input type="button" value="会員情報の修正" class="btn btn-edit"
						onclick="location.href='${pageContext.request.contextPath}/views/user-update.jsp'">
				</p>
				<p>
					<input type="button" value="アカウントの削除" class="btn btn-delete"
						onclick="location.href='${pageContext.request.contextPath}/views/user-delete.jsp'">
				</p>
			</div>
		</div>
	</div>

	<%@include file="footer.html"%>