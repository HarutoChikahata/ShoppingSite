<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
// 💡 認証ガード：未ログインならログイン画面へ即送還
jp.co.aforce.beans.Users userCheck = (jp.co.aforce.beans.Users) session.getAttribute("users");
if (userCheck == null) {
	response.sendRedirect("log-in.jsp");
	return;
}
%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="${pageContext.request.contextPath}/images/ball.png" type="image/png">
<meta charset="UTF-8">
<title>野球道具専門サイト - ホーム</title>
</head>
<body>

	<%@include file="menu.jsp"%>

	<div class="container main-layout">

		<main class="content-area">
			<div class="section-title-box">
				<h2>📢 出品中の野球道具一覧</h2>
				<p class="section-subtitle"></p>
			</div>

			<div class="item-grid">

				<c:forEach var="item" items="${itemList}">
					<div class="item-card">
						<div class="item-image-placeholder">⚾</div>
						<div class="item-info">
							<h4 class="item-name">
								<c:out value="${item.itemName}" />
							</h4>
							<p class="item-price">
								¥
								<c:out value="${item.price}" />
							</p>
							<a href="#" class="btn-view-detail">詳細を見る</a>
						</div>
					</div>
				</c:forEach>

				<div class="item-card">
					<div class="item-image-box">
						<img src="https://jpn.mizuno.com/static/mallDefault/images/goods/zoom1000/SH_1AJGH343030980_XL.jpg" alt="Iグラブ１"
							class="item-img">
					</div>
					<div class="item-info">
						<h4 class="item-name">硬式用 内野手グローブ</h4>
						<p class="item-price">¥58,500</p>
						<a href="#" class="btn-view-detail">詳細を見る</a>
					</div>
				</div>

				<div class="item-card">
					<div class="item-image-box">
						<img src="https://jpn.mizuno.com/static/mallDefault/images/goods/zoom1000/SH_1CJFY14076KK24_XL.jpg" alt="Sバット１"
							class="item-img">
					</div>
					<div class="item-info">
						<h4 class="item-name">軟式用 FRP製バット</h4>
						<p class="item-price">¥24,000</p>
						<a href="#" class="btn-view-detail">詳細を見る</a>
					</div>
				</div>

				<div class="item-card">
					<div class="item-image-box">
						<img src="https://jpn.mizuno.com/static/mallDefault/images/goods/zoom1000/SH_1FJCD02309_XL.jpg" alt="防具セット１"
							class="item-img">
					</div>
					<div class="item-info">
						<h4 class="item-name">キャッチャー防具 一式セット</h4>
						<p class="item-price">¥22,000</p>
						<a href="#" class="btn-view-detail">詳細を見る</a>
					</div>
				</div>
				
				<div class="item-card">
					<div class="item-image-box">
						<img src="https://jpn.mizuno.com/static/mallDefault/images/goods/zoom1000/SH_1AJGH343030980_XL.jpg" alt="Iグラブ１"
							class="item-img">
					</div>
					<div class="item-info">
						<h4 class="item-name">硬式用 内野手グローブ</h4>
						<p class="item-price">¥58,500</p>
						<a href="#" class="btn-view-detail">詳細を見る</a>
					</div>
				</div>

				<div class="item-card">
					<div class="item-image-box">
						<img src="https://jpn.mizuno.com/static/mallDefault/images/goods/zoom1000/SH_1CJFY14076KK24_XL.jpg" alt="Sバット１"
							class="item-img">
					</div>
					<div class="item-info">
						<h4 class="item-name">軟式用 FRP製バット</h4>
						<p class="item-price">¥24,000</p>
						<a href="#" class="btn-view-detail">詳細を見る</a>
					</div>
				</div>

				<div class="item-card">
					<div class="item-image-box">
						<img src="https://jpn.mizuno.com/static/mallDefault/images/goods/zoom1000/SH_1FJCD02309_XL.jpg" alt="防具セット１"
							class="item-img">
					</div>
					<div class="item-info">
						<h4 class="item-name">キャッチャー防具 一式セット</h4>
						<p class="item-price">¥22,000</p>
						<a href="#" class="btn-view-detail">詳細を見る</a>
					</div>
				</div>
				
				<div class="item-card">
					<div class="item-image-box">
						<img src="https://jpn.mizuno.com/static/mallDefault/images/goods/zoom1000/SH_1AJGH343030980_XL.jpg" alt="Iグラブ１"
							class="item-img">
					</div>
					<div class="item-info">
						<h4 class="item-name">硬式用 内野手グローブ</h4>
						<p class="item-price">¥58,500</p>
						<a href="#" class="btn-view-detail">詳細を見る</a>
					</div>
				</div>

				<div class="item-card">
					<div class="item-image-box">
						<img src="https://jpn.mizuno.com/static/mallDefault/images/goods/zoom1000/SH_1CJFY14076KK24_XL.jpg" alt="Sバット１"
							class="item-img">
					</div>
					<div class="item-info">
						<h4 class="item-name">軟式用 FRP製バット</h4>
						<p class="item-price">¥24,000</p>
						<a href="#" class="btn-view-detail">詳細を見る</a>
					</div>
				</div>

				<div class="item-card">
					<div class="item-image-box">
						<img src="https://jpn.mizuno.com/static/mallDefault/images/goods/zoom1000/SH_1FJCD02309_XL.jpg" alt="防具セット１"
							class="item-img">
					</div>
					<div class="item-info">
						<h4 class="item-name">キャッチャー防具 一式セット</h4>
						<p class="item-price">¥22,000</p>
						<a href="#" class="btn-view-detail">詳細を見る</a>
					</div>
				</div>
				
				<div class="item-card">
					<div class="item-image-box">
						<img src="https://jpn.mizuno.com/static/mallDefault/images/goods/zoom1000/SH_1AJGH343030980_XL.jpg" alt="Iグラブ１"
							class="item-img">
					</div>
					<div class="item-info">
						<h4 class="item-name">硬式用 内野手グローブ</h4>
						<p class="item-price">¥58,500</p>
						<a href="#" class="btn-view-detail">詳細を見る</a>
					</div>
				</div>

				<div class="item-card">
					<div class="item-image-box">
						<img src="https://jpn.mizuno.com/static/mallDefault/images/goods/zoom1000/SH_1CJFY14076KK24_XL.jpg" alt="Sバット１"
							class="item-img">
					</div>
					<div class="item-info">
						<h4 class="item-name">軟式用 FRP製バット</h4>
						<p class="item-price">¥24,000</p>
						<a href="#" class="btn-view-detail">詳細を見る</a>
					</div>
				</div>

				<div class="item-card">
					<div class="item-image-box">
						<img src="https://jpn.mizuno.com/static/mallDefault/images/goods/zoom1000/SH_1FJCD02309_XL.jpg" alt="防具セット１"
							class="item-img">
					</div>
					<div class="item-info">
						<h4 class="item-name">キャッチャー防具 一式セット</h4>
						<p class="item-price">¥22,000</p>
						<a href="#" class="btn-view-detail">詳細を見る</a>
					</div>
				</div>
				
				<div class="item-card">
					<div class="item-image-box">
						<img src="https://jpn.mizuno.com/static/mallDefault/images/goods/zoom1000/SH_1AJGH343030980_XL.jpg" alt="Iグラブ１"
							class="item-img">
					</div>
					<div class="item-info">
						<h4 class="item-name">硬式用 内野手グローブ</h4>
						<p class="item-price">¥58,500</p>
						<a href="#" class="btn-view-detail">詳細を見る</a>
					</div>
				</div>

				<div class="item-card">
					<div class="item-image-box">
						<img src="https://jpn.mizuno.com/static/mallDefault/images/goods/zoom1000/SH_1CJFY14076KK24_XL.jpg" alt="Sバット１"
							class="item-img">
					</div>
					<div class="item-info">
						<h4 class="item-name">軟式用 FRP製バット</h4>
						<p class="item-price">¥24,000</p>
						<a href="#" class="btn-view-detail">詳細を見る</a>
					</div>
				</div>

				<div class="item-card">
					<div class="item-image-box">
						<img src="https://jpn.mizuno.com/static/mallDefault/images/goods/zoom1000/SH_1FJCD02309_XL.jpg" alt="防具セット１"
							class="item-img">
					</div>
					<div class="item-info">
						<h4 class="item-name">キャッチャー防具 一式セット</h4>
						<p class="item-price">¥22,000</p>
						<a href="#" class="btn-view-detail">詳細を見る</a>
					</div>
				</div>
				
				

			</div>
		</main>

	</div>

	<%@include file="footer.html"%>