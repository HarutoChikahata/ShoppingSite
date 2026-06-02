<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>会員登録完了 - 野球道具専門サイト</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>
	会員登録が完了しました。
	<p>
		<a href="${pageContext.request.contextPath}/views/log-in.jsp" class="btn btn-primary"
			style="display: inline-block; padding: 10px 25px; background-color: #1a3c40; color: white; text-decoration: none; border-radius: 4px; font-weight: bold; transition: background 0.2s;">
			 ログイン画面へ </a>
	</p>
</body>
</html>