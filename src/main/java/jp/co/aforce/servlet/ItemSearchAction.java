package jp.co.aforce.servlet;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jp.co.aforce.beans.Items;
import jp.co.aforce.dao.ItemsDAO;
import jp.co.aforce.tool.Action;

public class ItemSearchAction extends Action {
    public String execute(
        HttpServletRequest request, HttpServletResponse response
    ) throws Exception {
        
        //入力されたキーワード(文字列)を回収
        String keyword = request.getParameter("keyword");
        
        ItemsDAO dao = new ItemsDAO();
        List<Items> list;
        
        // 2. もし検索窓が空っぽ、またはスペースだけなら全件取得。文字があれば検索を実行
        if (keyword == null || keyword.trim().isEmpty()) {
            list = dao.getAllItems();
        } else {
            list = dao.searchItems(keyword);
        }
        
        //絞り込んだ結果のリストを「list」という名前でリクエストにセット
        request.setAttribute("list", list);
        
        //一覧表示の見た目は home.jsp が完成しているので、そこへフォワードして使い回す
        return "/views/home.jsp";
    }
}