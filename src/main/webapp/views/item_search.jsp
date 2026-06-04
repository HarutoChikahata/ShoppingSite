<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 💡 認証ガード：未ログインならログイン画面へ即送還
jp.co.aforce.beans.Users userCheck = (jp.co.aforce.beans.Users) session.getAttribute("users");
if (userCheck == null) {
	response.sendRedirect("log-in.jsp");
	return;
}
%>

<%@include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>道具を探す</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

	<%@include file="menu.jsp"%>

	<div class="container search-page-container">

		<div class="section-title-box">
			<h2>🔍 野球道具を探す</h2>
			<p class="section-subtitle">キーワードやカテゴリ、価格帯から欲しいギアを絞り込めます。</p>
		</div>

		<%-- 
          💡 検索処理を行うAction（例: ItemSearch.action）へデータを送信します。
          出品ページ（item_exhibit.jsp）のフォームと対になるように、クリーンな構造にしています。
        --%>
		<form
			action="${pageContext.request.contextPath}/jp/co/aforce/servlet/ItemSearch.action"
			method="post" class="standard-form">

			<div class="form-group">
				<label Kakushika="keyword">商品名・キーワード：</label> <input type="text"
					id="keyword" name="keyword" placeholder="例: ミズノプロ、軟式バットなど"
					class="form-control">
			</div>

			<div class="form-group">
				<label for="itemCategory">カテゴリ：</label> <select id="itemCategory"
					name="itemCategory" class="form-control">
					<option value="">-- 全てのカテゴリ --</option>
					<option value="glove">グローブ / ミット</option>
					<option value="bat">バット</option>
					<option value="spike">スパイク / シューズ</option>
					<option value="wear">ウェア / ユニフォーム</option>
					<option value="other">その他（防具、ボールなど）</option>
				</select>
			</div>

			<div class="form-group">
				<label for="itemStatus">商品の状態：</label> <select id="itemStatus"
					name="itemStatus" class="form-control">
					<option value="">-- 全ての状態 --</option>
					<option value="new">新品・未使用</option>
					<option value="excellent">未使用に近い・美品</option>
					<option value="good">目立った傷や汚れなし（即戦力）</option>
					<option value="used">やや傷や汚れあり（練習用など）</option>
				</select>
			</div>

			<div class="form-group price-range-group">
				<label>価格帯：</label>
				<div class="price-inputs">
					<input type="number" name="priceMin" placeholder="最低価格" min="0"
						class="form-control price-input"> <span
						class="range-separator">〜</span> <input type="number"
						name="priceMax" placeholder="最高価格" min="0"
						class="form-control price-input"> <span
						class="currency-unit">円</span>
				</div>
			</div>

			<div class="form-buttons">
				<input type="submit" value="🎯 この条件で検索する" class="btn btn-search">

				<input type="reset" value="リセット" class="btn btn-reset">
			</div>

		</form>

	</div>

	<%@include file="footer.html"%>