package jp.co.aforce.servlet;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jp.co.aforce.beans.Items;
import jp.co.aforce.dao.ItemsDAO;
import jp.co.aforce.tool.Action;

public class HomeAction extends Action {
    @Override
    public String execute(
        HttpServletRequest request, HttpServletResponse response
    ) throws Exception {
        
        // 商品DAOの呼び出し
        ItemsDAO dao = new ItemsDAO();
        
        // 新着順で格納された商品リストを回収
        List<Items> itemList = dao.getAllItems();
        
        // JSPにセット
        request.setAttribute("list", itemList);
        
        // ホーム画面にフォワード
        return "/views/home.jsp";
    }
}