package jp.co.aforce.servlet;

import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.Users;
import jp.co.aforce.dao.UsersDAO;
import jp.co.aforce.tool.Action;

public class LoginAction extends Action {
	public String execute(
		HttpServletRequest request, HttpServletResponse response
	) throws Exception{
		
		HttpSession session=request.getSession();
		
		String loginId=request.getParameter("mailAddress");
		String password=request.getParameter("password");
		UsersDAO dao=new UsersDAO();
		Users users=dao.search(loginId, password);
		
		
		
		if(users!=null) {
			
			 // ---------------------------------------------------------
			ServletContext application = request.getServletContext();
            // アプリケーション全体から「ログイン中メンバー名簿」を取得（なければ作成）
			@SuppressWarnings("unchecked")
            Map<String, HttpSession> loginUsersMap = (Map<String, HttpSession>) application.getAttribute("loginUsersMap");
            if (loginUsersMap == null) {
                loginUsersMap = new HashMap<>();
                application.setAttribute("loginUsersMap", loginUsersMap);
            }
            
            String currentMemberId = users.getMemberId();
            
            // もし、すでに同じ会員IDが別のセッション（別ブラウザ）でログインしていたら
            if (loginUsersMap.containsKey(currentMemberId)) {
                HttpSession oldSession = loginUsersMap.get(currentMemberId);
                try {
                    // 古いセッションを強制終了（キックアウト）させる！
                    oldSession.invalidate();
                } catch (IllegalStateException e) {
                    // 既にセッションが切れている場合は無視してOK
                }
            }
            // 今回の新しいセッション情報を名簿に登録・更新する
            loginUsersMap.put(currentMemberId, session);
            // ---------------------------------------------------------
            
			session.setAttribute("users", users);
			return "/views/user-menu.jsp";
		}
		
		return "/views/login-error.jsp";
	}
}
