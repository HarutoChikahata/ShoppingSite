package jp.co.aforce.servlet;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jp.co.aforce.beans.Items;
import jp.co.aforce.dao.ItemsDAO;
import jp.co.aforce.tool.Action;

public class ItemDetailAction extends Action {
	public String execute( 
		HttpServletRequest request, HttpServletResponse response
    ) throws Exception {
		
		//ホーム画面の「詳細を見る」リンクから送られてきた itemId を回収
		int itemId = Integer.parseInt(request.getParameter("itemId"));
		
		//DAOを呼び出して、そのIDの商品情報をピンポイントで取得
		ItemsDAO dao = new ItemsDAO();
		Items item = dao.getItemDetail(itemId);
		
		//商品データが存在すれば、リクエストにセットして詳細JSPへフォワード
		if(item != null) {
			request.setAttribute("item", item);
			return "/views/item_detail.jsp";
		} else {
			// 万が一データがなければホームに戻す
			return "/jp/co/aforce/servlet/Home.action";
		}
	}
}
