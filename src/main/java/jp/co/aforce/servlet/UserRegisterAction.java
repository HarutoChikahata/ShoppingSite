package jp.co.aforce.servlet;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.Users;
import jp.co.aforce.dao.UsersDAO;
import jp.co.aforce.tool.Action;

public class UserRegisterAction extends Action {
    public String execute(
    	HttpServletRequest request, HttpServletResponse response
    ) throws Exception {
    	
    	//actionTypeはcheckかcommitを行う
    	String actionType = request.getParameter("action_type");
    	UsersDAO dao = new UsersDAO();
    	
    	//確認画面に進む前
    	if("check".equals(actionType)) {
    		String memberId = request.getParameter("memberId");
    		String password = request.getParameter("password");
		    String passwordConfirm = request.getParameter("passwordConfirm"); // 💡 画面から回収
		    
		      //入力されたデータをBeanにまとめておく
             Users candidate = new Users(
            	 memberId, 
    			 request.getParameter("password"), 
    			 request.getParameter("lastName"), 
    			 request.getParameter("firstName"), 
    			 request.getParameter("address"), 
    			 request.getParameter("mailAddress"), 
    			 "user"
        );
    		
    		 //ID重複チェック
    		 if(dao.checkIdExists(memberId)) {
    			 request.setAttribute("errorMsg", "その会員IDは既に使われています。");
    			 
    			 request.setAttribute("backupInput", candidate);
    			 return "/views/user-register.jsp"; //入力画面へ
    		 }
    		
    		 //パスワードチェック
    		 if(password == null || !password.equals(passwordConfirm)) {
    			 request.setAttribute("errorMsg", "入力されたパスワードが一致しません。");
    		     request.setAttribute("backupInput", candidate);
    		     return "/views/user-register.jsp"; //入力画面へ
    		 }
    		
    		 // データをBeanに詰めてセット→確認画面へ
    		 request.setAttribute("candidateUser", candidate);
    		 return "/views/user-register-confirm.jsp";
    		
    	 //confirmから確定された時
    	 } else if("commit".equals(actionType)){
    		 Users newUser = new Users( 
    			 request.getParameter("memberId"),
    			 request.getParameter("password"), 
    			 request.getParameter("lastName"), 
    			 request.getParameter("firstName"), 
    			 request.getParameter("address"), 
    			 request.getParameter("mailAddress"), 
    			 "user"
    		 );
    		 //🌞DBにINSERT🌞
    		 dao.insert(newUser);
    		
    		 HttpSession session = request.getSession(true);
    		 session.setAttribute("users", newUser);
    		 
    		 return "/views/user-register-success.jsp";		
    	 }
    	
    	 return "/views/log-in.jsp";
    }
} 