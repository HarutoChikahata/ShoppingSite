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
<title>退会手続き - 野球道具専門サイト</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

    <div class="container text-center" style="max-width: 500px; margin-top: 50px;">
        <div class="warning-box" style="border: 2px solid #d9534f; padding: 25px; border-radius: 6px; background-color: #fffdfd;">
            <h2 style="color: #d9534f; margin-top: 0;">⚠️ 退会手続き（アカウント削除）</h2>
            
            <p style="text-align: left; line-height: 1.6; color: #333;">
                現在ログイン中の会員アカウント（ID: <strong><%= loginUser.getMemberId() %></strong>）をシステムから完全に削除します。<br>
                退会すると、これまでの出品履歴や登録情報がすべて失われ、元に戻すことはできません。
            </p>
            
            <hr style="border: 0; border-top: 1px solid #dee2e6; margin: 20px 0;">

            <form action="${pageContext.request.contextPath}/jp/co/aforce/servlet/Register.action" method="post">
                <input type="hidden" name="mode" value="delete">
                <input type="hidden" name="action_type" value="check">

                <p>
                    <input type="submit" value="退会確認画面へ進む" style="background-color: #d9534f; color: white; font-weight: bold; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer;">
                    <input type="button" value="アカウントメニューに戻る" onclick="location.href='user-menu.jsp'" style="padding: 10px 20px; margin-left: 10px;">
                </p>
            </form>
        </div>
    </div>

<%@include file="footer.html"%>
</body>
</html>