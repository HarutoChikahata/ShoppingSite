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
    	if(loginUser == null) return "/views/log_in.jsp";
    	
    	//編集確認画面へ進む前
    	if("check".equals(actionType)) {
    		String mailAddress = request.getParameter("mailAddress");
    		String currentPassword = request.getParameter("currentPassword");    		
    		String password = request.getParameter("password");
    	    String passwordConfirm = request.getParameter("passwordConfirm");
    	    
    	    //メールアドレス半角英数チェック
    	    if(mailAddress == null 
    	    	|| !mailAddress.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$")
    	    	|| mailAddress.contains("xn--")) {
    	    	request.setAttribute("errorMsg", "メールアドレスの形式が正しくありません。すべて半角英数字・記号で入力してください。");
    	    	return "/views/user_update.jsp";
    	    }
    	    
    	    //6文字以上かつ半角文字チェック
            if(password == null || !password.matches("^[a-zA-Z0-9!-/:-@\\[-`\\{-~]{6,}$")) {
            	request.setAttribute("errorMsg", "パスワードは6文字以上の半角文字で入力してください。");
            	return "/views/user_update.jsp";
            }
            
    	    if(currentPassword == null || !currentPassword.equals(loginUser.getPassword())) {
    	    	request.setAttribute("errorMsg", "現在のパスワードが間違っています。");
    	    	return "/views/user_update.jsp";
    	    			
    	    }
    	    if(password == null || !password.equals(passwordConfirm)) {
    		    request.setAttribute("errorMsg", "入力されたパスワードが一致しません。");
    		    return "/views/user_update.jsp";
    		}
    	    
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
    		return "/views/user_update_confirm.jsp";
    	
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
    		return "/views/user_update_success.jsp";
    	}
    	
    	return "/views/home.jsp";
    }
}