<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="${pageContext.request.contextPath}/images/ball.png" type="image/png">
<meta charset="UTF-8">
<title>野球道具専門サイト - スタート</title>
</head>
<body>


    <div class="container start-page-container">
        <div class="hero-section">
            <h1>野球道具専門サイトへようこそ！</h1>
            <p class="lead-text">もう使っていないグローブやバット、眠っている大切な道具を次のプレーヤーへ。</p>
        </div>
        
        <div class="action-box">
            <p>まずはログインするか、新規会員登録を行ってください。</p>
            <div class="start-buttons">
                <input type="button" value="ログイン画面へ" class="btn btn-primary"
                       onclick="location.href='${pageContext.request.contextPath}/views/log-in.jsp'">
                       
                <input type="button" value="新規会員登録画面へ" class="btn btn-secondary"
                       onclick="location.href='${pageContext.request.contextPath}/views/user-register.jsp'">
            </div>
        </div>
    </div>

<%@include file="footer.html" %>

