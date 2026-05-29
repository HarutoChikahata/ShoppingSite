<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>会員登録</title>
</head>

<body>



	<div class="container">
		<h2>新規会員登録</h2>

		<form
			action="${pageContext.request.contextPath}/jp/co/afforce/servlet/Register.action"
			method="post">

			<%-- 1. 会員番号（MEMBER_ID：10文字） --%>
			<p>
				<label for="memberId">会員番号：</label> <input type="text" id="memberId"
					name="memberId" maxlength="10" placeholder="例: M000000001" required>
			</p>

			<%-- 2. メールアドレス（MAIL_ADDRESS：128文字） --%>
			<p>
				<label for="mailAddress">メールアドレス：</label> <input type="email"
					id="mailAddress" name="mailAddress" maxlength="128" size="30"
					placeholder="例: example@afforce.co.jp" required>
			</p>

			<%-- 3. パスワード（PASSWORD：32文字） --%>
			<p>
				<label for="password">パスワード：</label> <input type="password"
					id="password" name="password" maxlength="32" required>
			</p>

			<%-- 4. 姓名（LAST_NAME/FIRST_NAME：32文字） --%>
			<p>
				<label for="lastName">お名前（姓）：</label> <input type="text"
					id="lastName" name="lastName" maxlength="32" placeholder="例: 山田"
					required> <label for="firstName">（名）：</label> <input
					type="text" id="firstName" name="firstName" maxlength="32"
					placeholder="例: 太郎" required>
			</p>

			<%-- 5. 住所（ADDRESS：128文字） --%>
			<p>
				<label for="address">住所：</label> <input type="text" id="address"
					name="address" maxlength="128" size="50"
					placeholder="例: 東京都千代田区..." required>
			</p>


			<p>
				<input type="submit" value="登録する"> <input type="button"
					value="キャンセル" onclick="location.href='log-in.jsp'">
			</p>

		</form>

	</div>

<%@include file="footer.html"%>