package jp.co.aforce.servlet;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.Items;
import jp.co.aforce.tool.Action;

public class CartRemoveAction extends Action {
	@SuppressWarnings("unchecked")
	public String execute(
		HttpServletRequest request, HttpServletResponse response
	) throws Exception{
		
		//カートの何番目の商品（インデックス）を消すか回収
		int index = Integer.parseInt(request.getParameter("index"));	
		
		//セッションからカート呼び出し
		HttpSession session = request.getSession();
		List<Items> cart = (List<Items>) session.getAttribute("cart");
		
		//指定された番号の商品をリストから消去
		if(cart != null && index >= 0 && index < cart.size()) {
			cart.remove(index);
		}
		
		//最新のカート状態をセッションへ戻す
		session.setAttribute("cart", cart);
		
		return "/views/cart.jsp";
	}
}
