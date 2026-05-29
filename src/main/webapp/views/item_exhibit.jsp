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

	<script src="${pageContext.request.contextPath}/js/script.js" defer></script>

	<div class="container">
		<form
			action="${pageContext.request.contextPath}/jp/co/aforce/servlet/Exhibit.action"
			method="post">
			<h2>出品する🥎</h2>

			<p>
				<label for="item_name">商品名</label> <input type="text" id="item_name"
					name="item_name" placeholder="例：ミズノプロ 軟式内野手用グラブ" required>
			</p>

			<p>
				<label for="category">カテゴリ</label> <select id="category"
					name="category" required
					style="width: 100%; padding: 10px; font-size: 16px;">
					<option value="">選択してください</option>
					<option value="グラブ">グラブ</option>
					<option value="ミット">ミット</option>
					<option value="バット">バット</option>
					<option value="スパイク">スパイク/トレシュ</option>
					<option value="ウェア">ウェア/ユニフォーム</option>
				</select>
			</p>

			<p id="position-area" style="display: none;">
				<label for="position">ポジション</label> <select id="position"
					name="position"
					style="width: 100%; padding: 10px; font-size: 16px;">
					<option value="指定なし">指定なし（オールラウンドなど）</option>
					<option value="投手用">投手用</option>
					<option value="内野手用">内野手用</option>
					<option value="外野手用">外野手用</option>
					<option value="捕手用">捕手用</option>
					<option value="ファーストミット">ファーストミット</option>
				</select>
			</p>

			<p>
				<label>区分</label> <label
					style="display: inline; margin-right: 15px;"><input
					type="radio" name="baseball_type" value="硬式" checked> 硬式</label> <label
					style="display: inline; margin-right: 15px;"><input
					type="radio" name="baseball_type" value="軟式"> 軟式</label> <label
					style="display: inline;"><input type="radio"
					name="baseball_type" value="ソフトボール"> ソフトボール</label>
			</p>

			<p>
				<label for="maker">メーカー</label> <input type="text" id="maker"
					name="maker" placeholder="例：ミズノ、ゼット、ローリングス" required>
			</p>

			<p>
				<label for="item_condition">商品の状態</label> <select
					id="item_condition" name="item_condition" required
					style="width: 100%; padding: 10px; font-size: 16px;">
					<option value="新品・未使用">新品・未使用（お店の型落ち在庫など）</option>
					<option value="未使用に近い">未使用に近い</option>
					<option value="目立った傷や汚れなし">目立った傷や汚れなし（実戦で即戦力）</option>
					<option value="やや傷や汚れあり">やや傷や汚れあり（練習用に最適）</option>
					<option value="全体的に状態が悪い">全体的に状態が悪い（ジャンク・型付けの練習用など）</option>
				</select>
			</p>

			<p>
				<label for="price">販売価格 (￥)</label> <input type="text" id="price"
					name="price" placeholder="例：15000" required>
			</p>

			<p>
				<label for="description">商品の詳細説明</label>
				<textarea id="description" name="description" rows="5"
					style="width: 100%; padding: 10px; font-size: 16px; border: 2px solid #cbd5e1; border-radius: 4px;"
					placeholder="使用頻度、ポジション、型付けの具合（即戦力か硬めか）など"></textarea>
			</p>

			<p style="text-align: center; margin-top: 30px;">
				<input type="submit" value="🥎 出品する"> <input
					type="button" value="キャンセル" onclick="location.href='user-menu.jsp'">
			</p>
		</form>
	</div>

	<%@include file="footer.html"%>