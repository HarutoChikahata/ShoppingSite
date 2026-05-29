<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Object user=session.getAttribute("users");
	
	if(user==null){
		response.sendRedirect("log-in.jsp");
		return;
	}
%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会員情報更新</title>
</head>
<body>
	<div class="container">
		<p>会員情報の更新ができます。</p>
		<input type="button"
					value="会員メニューに戻る" onclick="location.href='${pageContext.request.contextPath}/views/user-menu.jsp'">
	</div>				
<%@include file="footer.html"%>