<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// ログインしているかどうかのチェック
	jp.co.aforce.beans.Users loginUser = (jp.co.aforce.beans.Users) session.getAttribute("users");
	String userName = (loginUser != null) ? loginUser.getLastName() : "ゲスト";
	// ログインユーザーの権限をチェック
	String userRole = (loginUser != null) ? loginUser.getUserRole() : "guest";
%>

<div class="nav-tabs-container">
	<div class="nav-user-info">
		<strong><%=userName%></strong> さん
		<% if ("admin".equals(userRole)) { %>
            <span class="admin-badge" style="background-color: #d9534f; color: white; padding: 2px 6px; font-size: 11px; border-radius: 4px; margin-left: 5px;">管理者</span>
        <% } %>
	</div>
	<ul class="nav-tabs">
		<li><a href="${pageContext.request.contextPath}/views/home.jsp"
			class="tab-item"> 🏟️ ホーム </a></li>
		<li><a
			href="${pageContext.request.contextPath}/views/user-menu.jsp"
			class="tab-item"> 👤 アカウント </a></li>
		<li><a
			href="${pageContext.request.contextPath}/views/item_exhibit.jsp"
			class="tab-item"> 📢 出品する </a></li>
		<li><a
			href="${pageContext.request.contextPath}/views/item_search.jsp"
			class="tab-item"> 🔍 道具を探す </a></li>
		<% if ("admin".equals(userRole)) { %>
            <li>
                <a href="${pageContext.request.contextPath}/views/admin-page.jsp" class="tab-item" style="color: #f7cd46;">
                    🛠️ 管理画面 </a></li>
        <% } %>
		<li><a
			href="${pageContext.request.contextPath}/views/logout-in.jsp"
			class="tab-item logout-tab"> 🚪 ログアウト </a></li>
	</ul>
</div>

