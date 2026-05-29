package jp.co.aforce.servlet;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.tool.Action;

public class LogoutAction extends Action {

	public String execute(
		HttpServletRequest request, HttpServletResponse response
	) throws Exception {

		HttpSession session = request.getSession();
		
		if(session!=null && session.getAttribute("users")!=null) {
		    
		    session.invalidate();
		    
		    return "/views/logout-out.jsp";
		}

		return "/views/logout-error.jsp";
	}
}

