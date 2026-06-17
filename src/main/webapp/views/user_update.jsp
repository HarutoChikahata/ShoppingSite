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
<title>会員情報編集</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

	<div class="container">
		<h2>会員情報編集</h2>
		<p>変更したい項目を入力し、「変更内容の確認へ」ボタンを押してください。</p>
		
		<%
        String errorMsg = (String) request.getAttribute("errorMsg");
        if (errorMsg != null) {
        %>
        <div class="error-message-box"
            style="color: #d9534f; background-color: #fdf7f7; border: 1px solid #d9534f; padding: 10px; border-radius: 4px; margin-bottom: 20px; font-weight: bold;">
            <%= errorMsg %>
        </div>
        <%
        }
        %>
        
		<form
			action="${pageContext.request.contextPath}/jp/co/aforce/servlet/UserUpdate.action"
			method="post"
			onsubmit="return validatePassword()">

			<input type="hidden" name="mode" value="update"> 
			<input type="hidden" name="action_type" value="check">

			<%-- 会員ID（MEMBER_ID：変更不可として表示するだけ） --%>
			<p>
				<label>会員ID</label> <strong><%= loginUser.getMemberId() %></strong>
			</p>

			<%-- 1. メールアドレス --%>
			<p>
				<label for="mailAddress">メールアドレス</label> <input type="email"
					id="mailAddress" name="mailAddress" maxlength="128" size="30"
					value="<%= loginUser.getMailAddress() %>" required>
			</p>

			<%-- 2. パスワード --%>
			<p>
                <label for="currentPassword">現在のパスワード(6文字以上)</label>
                <input type="password" id="currentPassword" name="currentPassword" maxlength="32" required>
			<p>
				<label for="password">新しいパスワード(6文字以上)</label> 
				<input type="password"
					id="updatePassword" name="password" maxlength="32" required>
			</p>
			<p>
    			<label for="passwordConfirm">もう一度パスワードを入力してください</label> 
   			 	<input type="password" id="passwordConfirm" name="passwordConfirm" maxlength="32" required>
   			</p>
   			
			<%-- 3. 姓名 --%>
			<p>
				<label for="lastName">氏名（姓）</label> <input type="text"
					id="lastName" name="lastName" maxlength="32"
					value="<%= loginUser.getLastName() %>" required> <label
					for="firstName">氏名（名）</label> <input type="text" id="firstName"
					name="firstName" maxlength="32"
					value="<%= loginUser.getFirstName() %>" required>
			</p>

			<%-- 4. 住所 --%>
			<p>
				<label for="address">住所</label> <input type="text" id="address"
					name="address" maxlength="128" size="50"
					value="<%= loginUser.getAddress() %>" required>
			</p>

			<p>
				<input type="submit" value="変更内容の確認へ"> <input type="button"
					value="キャンセル" onclick="history.back();">
			</p>

		</form>
	</div>

<script src="${pageContext.request.contextPath}/js/validation.js"></script>

	<%@include file="footer.html"%>
