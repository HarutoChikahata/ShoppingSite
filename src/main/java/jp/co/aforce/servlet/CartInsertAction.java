package jp.co.aforce.servlet;

import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.Items;
import jp.co.aforce.dao.ItemsDAO;
import jp.co.aforce.tool.Action;

public class CartInsertAction extends Action {
	@SuppressWarnings("unchecked")
	public String execute(
	    HttpServletRequest request, HttpServletResponse response
    ) throws Exception {
		
		//詳細画面から送られてきた商品IDを回収
		int itemId = Integer.parseInt(request.getParameter("itemId"));
		
		//DAOを使って、その商品の完璧なデータをDBから1件取得
		ItemsDAO dao = new ItemsDAO();
		Items targetItem = dao.getItemDetail(itemId);
		
		//セッションから現在のカートを呼び出す
		HttpSession session = request.getSession();
		List<Items> cart = (List<Items>) session.getAttribute("cart");
		
		//まだセッションにカートが存在しなければ新たに生成
		if(cart == null) {
			cart = new ArrayList<>();
		}
		
		//カートに商品を追加
		if(targetItem != null) {
			cart.add(targetItem);
		}
		
		//更新したカートをセッションに上書き保存
		session.setAttribute("cart", cart);
		
		//買い物かご画面（JSP）にフォワード
		return "/views/cart.jsp";
	}
}
