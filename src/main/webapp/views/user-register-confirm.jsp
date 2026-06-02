<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" value="新規登録内容の確認" scope="request" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>会員登録情報確認 - 野球道具専門サイト</title>
</head>

<body>
<div class="container">
    <h2>📋 ご登録内容の確認</h2>
    <p>以下の内容で会員登録を確定します。よろしいですか？</p>

    <table class="table">
        <tr><th>会員ID</th><td><c:out value="${candidateUser.memberId}"/></td></tr>
        <tr><th>お名前</th><td><c:out value="${candidateUser.lastName}"/> <c:out value="${candidateUser.firstName}"/></td></tr>
        <tr><th>ご住所</th><td><c:out value="${candidateUser.address}"/></td></tr>
    </table>

    <form action="${pageContext.request.contextPath}/jp/co/aforce/servlet/Register.action" method="post">
        <input type="hidden" name="mode" value="insert">
        <input type="hidden" name="action_type" value="commit">
        
        <input type="hidden" name="memberId" value="${candidateUser.memberId}">
        <input type="hidden" name="password" value="${candidateUser.password}">
        <input type="hidden" name="lastName" value="${candidateUser.lastName}">
        <input type="hidden" name="firstName" value="${candidateUser.firstName}">
        <input type="hidden" name="address" value="${candidateUser.address}">
        <input type="hidden" name="mailAddress" value="${candidateUser.mailAdress}">

        <button type="submit" class="btn btn-success">🏟️ この内容で登録する</button>
        <a href="javascript:history.back();" class="btn btn-secondary">修正する（戻る）</a>
    </form>
</div>
<%@include file="footer.html" %>