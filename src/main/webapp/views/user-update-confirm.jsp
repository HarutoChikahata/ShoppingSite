<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pageTitle" value="会員情報変更内容の確認" scope="request" />

<%@include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>変更内容の確認</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

	<div class="container">
		<h2>変更内容の確認</h2>
		<p>以下の内容で会員情報を更新します。よろしいですか？</p>

		<table class="table">
			<tr>
				<th>メールアドレス</th>
				<td><c:out value="${candidateUser.mailAddress}" /></td>
			</tr>
			<tr>
				<th>お名前（姓・名）</th>
				<td><c:out value="${candidateUser.lastName}" /> <c:out
						value="${candidateUser.firstName}" /></td>
			</tr>
			<tr>
				<th>ご住所</th>
				<td><c:out value="${candidateUser.address}" /></td>
			</tr>
		</table>

		<form
			action="${pageContext.request.contextPath}/jp/co/aforce/servlet/UserUpdate.action"
			method="post">

			<input type="hidden" name="mode" value="update"> <input
				type="hidden" name="action_type" value="commit"> <input
				type="hidden" name="password" value="${candidateUser.password}">
			<input type="hidden" name="lastName"
				value="${candidateUser.lastName}"> <input type="hidden"
				name="firstName" value="${candidateUser.firstName}"> <input
				type="hidden" name="address" value="${candidateUser.address}">
			<input type="hidden" name="mailAddress"
				value="${candidateUser.mailAddress}">

			<div class="management-buttons">
				<input type="submit" value="この内容で更新する">
				<input type="button" value="戻る" onclick="javascript:history.back();">
			</div>
		</form>
	</div>

	<%@include file="footer.html"%>