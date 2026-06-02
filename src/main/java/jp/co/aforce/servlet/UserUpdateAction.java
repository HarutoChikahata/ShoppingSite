package jp.co.aforce.servlet;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.Users;
import jp.co.aforce.dao.UsersDAO;
import jp.co.aforce.tool.Action;

public class UserUpdateAction extends Action {
    public String execute(
    	HttpServletRequest request, HttpServletResponse response
    ) throws Exception {
    	
    	String actionType = request.getParameter("action_type");
    	UsersDAO dao = new UsersDAO();
    	HttpSession session = request.getSession();
    	
    	//loginUserにセッションを持たせてログインチェック
    	Users loginUser = (Users) session.getAttribute("users");
    	if(loginUser == null) return "/views/log-in.jsp";
    	
    	//編集確認画面へ進む前
    	if("check".equals(actionType)) {
    		Users updatedCandidate = new Users( 
    			loginUser.getMemberId(),
    			request.getParameter("password"),
    			request.getParameter("lastName"),
    			request.getParameter("firstName"),
    			request.getParameter("address"),
    			request.getParameter("mailAddress"),
    			loginUser.getUserRole()
    		);
    		request.setAttribute("candidateUser", updatedCandidate);
    		return "/views/user-update-confirm.jsp";
    	
    	//編集確定時
    	} else if("commit".equals(actionType)) {
    		Users updateUser = new Users( 
    			loginUser.getMemberId(),
    			request.getParameter("password"),
    			request.getParameter("lastName"),
    			request.getParameter("firstName"),
    			request.getParameter("address"),
    			request.getParameter("mailAddress"),
    			loginUser.getUserRole()
    		);
    		dao.update(updateUser);
    		
    		//セッションも上書き
    		session.setAttribute("users", updateUser);
    		return "/views/user-update-success.jsp";
    	}
    	
    	return "/views/home.jsp";
    }
}