<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // セッションからログインユーザー情報を取得
    jp.co.aforce.beans.Users loginUser = (jp.co.aforce.beans.Users) session.getAttribute("users");
    if (loginUser == null) {
        response.sendRedirect("log-in.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会員情報編集 - 野球道具専門サイト</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

    <div class="container">
        <h2>👤 会員情報編集</h2>
        <p>変更したい項目を入力し、「変更内容の確認へ」ボタンを押してください。</p>

        <form action="${pageContext.request.contextPath}/jp/co/aforce/servlet/Register.action" method="post">

            <input type="hidden" name="mode" value="update">
            <input type="hidden" name="action_type" value="check">

            <%-- 会員番号（MEMBER_ID：変更不可として表示するだけ） --%>
            <p>
                <label>会員番号：</label>
                <strong><%= loginUser.getMemberId() %></strong>
            </p>

            <%-- 1. メールアドレス --%>
            <p>
                <label for="mailAddress">メールアドレス：</label>
                <input type="email" id="mailAddress" name="mailAddress" maxlength="128" size="30" 
                    value="<%= loginUser.getMailAdress() %>" required>
            </p>

            <%-- 2. パスワード --%>
            <p>
                <label for="password">パスワード：</label>
                <input type="password" id="password" name="password" maxlength="32" 
                    value="<%= loginUser.getPassword() %>" required>
            </p>

            <%-- 3. 姓名 --%>
            <p>
                <label for="lastName">お名前（姓）：</label>
                <input type="text" id="lastName" name="lastName" maxlength="32" 
                    value="<%= loginUser.getLastName() %>" required>
                
                <label for="firstName">（名）：</label>
                <input type="text" id="firstName" name="firstName" maxlength="32" 
                    value="<%= loginUser.getFirstName() %>" required>
            </p>

            <%-- 4. 住所 --%>
            <p>
                <label for="address">住所：</label>
                <input type="text" id="address" name="address" maxlength="128" size="50" 
                    value="<%= loginUser.getAddress() %>" required>
            </p>

            <p>
                <input type="submit" value="変更内容の確認へ">
                <input type="button" value="キャンセル" onclick="location.href='user-menu.jsp'">
            </p>

        </form>
    </div>

<%@include file="footer.html"%>
</body>
</html>