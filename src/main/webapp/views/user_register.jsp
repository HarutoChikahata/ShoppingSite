<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会員登録</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

	<div class="container">
		<h2>新規会員登録</h2>

		<% 
		String errorMsg = (String) request.getAttribute("errorMsg");
		if (errorMsg != null) { 
		%>
		<div class="error-message-box"
			style="color: #d9534f; background-color: #fdf7f7; border: 1px solid #d9534f; padding: 10px; border-radius: 4px; margin-bottom: 20px; font-weight: bold;">
			<%=errorMsg%>
		</div>
		<% 
		} 

		jp.co.aforce.beans.Users backup = (jp.co.aforce.beans.Users) request.getAttribute("backupInput");
		%>

		<form
			action="${pageContext.request.contextPath}/jp/co/aforce/servlet/UserRegister.action"
			method="post" 
			onsubmit="return validatePassword()">

			<input type="hidden" name="mode" value="insert"> 
			<input type="hidden" name="action_type" value="check">

			<%-- 1. 会員ID（MEMBER_ID：10文字） --%>
			<p>
				<label for="memberId">会員ID(半角英数字)</label> 
					<input type="text" 
					   id="memberId"
					   name="memberId" 
					   maxlength="10" 
					   placeholder="例: M000000001" 
					   value="<%= backup != null ? backup.getMemberId() : "" %>"
					   required>
			</p>

			<%-- 2. メールアドレス（MAIL_ADDRESS：128文字） --%>
			<p>
				<label for="mailAddress">メールアドレス</label> 
					<input type="email"
					   id="mailAddress" 
				       name="mailAddress" 
				       maxlength="128" 
					   size="30"
					   placeholder="例: example@aforce.co.jp" 
					   value="<%= backup != null ? backup.getMailAddress() : "" %>"
					   required>
			</p>

			<%-- 3. パスワード（PASSWORD：32文字） --%>
			<p>
				<label for="password">パスワード(6文字以上)</label> 
					<input type="password"
					   id="password" 
					   name="password" 
					   maxlength="32" 
					   value="<%= backup != null ? backup.getPassword() : "" %>"
					   required>
			</p>
			<%-- 💡 追加：確認用パスワード入力欄 --%>
			<p>
				<label for="passwordConfirm">もう一度パスワードを入力してください</label> 
					<input type="password" 
				      	id="passwordConfirm" 
				      	name="passwordConfirm"
					   	maxlength="32" required>
			</p>	
			<%-- 4. 姓名（LAST_NAME/FIRST_NAME：32文字） --%>
			<p>
				<label for="lastName">氏名（姓）</label> 
					<input type="text"
						id="lastName" 
						name="lastName" 
						maxlength="32" 
						placeholder="例: 山田" 
						value="<%= backup != null ? backup.getLastName() : "" %>"
						required>
						
				<label for="firstName">氏名（名）</label> 
					<input type="text" 
						id="firstName"
						name="firstName"
 						maxlength="32"
						placeholder="例: 太郎" 
						value="<%= backup != null ? backup.getFirstName() : "" %>" 
						required>
			</p>

			<%-- 5. 住所（ADDRESS：128文字） --%>
			<p>
				<label for="address">住所</label> 
					<input type="text" 
						id="address"
						name="address" maxlength="128" size="50"
						placeholder="例: 東京都千代田区..." 
						value="<%= backup != null ? backup.getAddress() : "" %>"
						required>
			</p>

			<p>
				<input type="submit" value="確認画面へ進む"> 
				<input type="button" value="キャンセル" 
				onclick="history.back();">
			</p>

		</form>

	</div>

<script src="${pageContext.request.contextPath}/js/validation.js"></script>

	<%@include file="footer.html"%>