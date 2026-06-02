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
<title>退会内容確認 - 野球道具専門サイト</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

    <div class="container" style="max-width: 550px; margin-top: 50px;">
        <h2 style="color: #d9534f; border-bottom: 2px solid #d9534f; padding-bottom: 10px;">🛑 退会内容の最終確認</h2>
        
        <p style="margin: 20px 0; line-height: 1.6;">
            以下の会員アカウントを完全に削除します。<br>
            <span style="color: #d9534f; font-weight: bold;">この操作は取り消せません。</span>本当によろしいですか？
        </p>


        <form action="${pageContext.request.contextPath}/jp/co/aforce/servlet/Register.action" method="post">
            
            <input type="hidden" name="mode" value="delete">
            <input type="hidden" name="action_type" value="commit">

            <div style="text-align: center; margin-top: 20px;">
                <input type="submit" value="承諾して、完全に退会する" 
                   
                
                <input type="button" value="戻る" onclick="location.href='user-delete.jsp'" 
                    style="padding: 12px 25px; margin-left: 15px; font-size: 15px;">
            </div>
        </form>
    </div>

<%@include file="footer.html"%>
</body>
</html>