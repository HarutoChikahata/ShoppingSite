package jp.co.aforce.servlet;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.Users;
import jp.co.aforce.dao.UsersDAO;
import jp.co.aforce.tool.Action;

public class UserDeleteAction extends Action {
    public String execute(
    	HttpServletRequest request, HttpServletResponse respons
    ) throws Exception {
        
        String actionType = request.getParameter("action_type");
        UsersDAO dao = new UsersDAO();
        HttpSession session = request.getSession();
        
        // ログインチェック
        Users loginUser = (Users) session.getAttribute("users");
        if (loginUser == null) return "/views/log-in.jsp";

        // 削除確認画面へ進む前
        if ("check".equals(actionType)) {
            return "/views/user-delete-confirm.jsp";
            
        // 本当に削除する時
        } else if ("commit".equals(actionType)) {
            dao.delete(loginUser.getMemberId()); 
            
            // セッションを壊してログアウト
            session.invalidate();
            return "/views/user-delete-success.jsp";
        }

        return "/views/home.jsp";
    }
}