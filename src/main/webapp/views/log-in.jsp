<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>ログイン</title>
</head>

<body>

	<div class="container">
		<h2>ログイン</h2>
		<form
			action="${pageContext.request.contextPath}/jp/co/aforce/servlet/Login.action"
			method="post">

			<!--1.メールアドレスの入力欄-->
			<p>
				<label for="mailAddress">会員IDまたはメールアドレス：</label> <input type="text"
					name="mailAddress" required>
			</p>

			<!--2.パスワードの入力欄-->
			<p>
				<label for="password">パスワード：</label> <input type="password"
					name="password" required>
			</p>

			<!--3．ログインと新規会員登録ボタン-->
			<p>
				<input type="submit" value="ログイン"> 
				<input type="button"
					value="新規会員登録" onclick="location.href='register-in.jsp'">
			</p>

		</form>
	</div>

	<%@include file="footer.html"%>