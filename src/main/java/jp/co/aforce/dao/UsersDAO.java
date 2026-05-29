package jp.co.aforce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jp.co.aforce.beans.Users;

public class UsersDAO extends DAO{
	public Users search(String loginId, String password)
		throws Exception{
		Users users=null;
	
		Connection con=getConnection();
		
		PreparedStatement st;
		st=con.prepareStatement(
			"select * from users where (MEMBER_ID=? OR MAIL_ADDRESS=?) and PASSWORD=?");
		st.setString(1, loginId);
		st.setString(2, loginId);
		st.setString(3, password);
		ResultSet rs=st.executeQuery();
		
		if (rs.next()) {
			users=new Users();
			users.setMemberId(rs.getString("MEMBER_ID"));
			users.setMailAddress(rs.getString("MAIL_ADDRESS"));
			users.setPassword(rs.getString("PASSWORD"));
			users.setLastName(rs.getString("LAST_NAME"));   
		    users.setFirstName(rs.getString("FIRST_NAME"));
		}
		
		st.close();
		con.close();
		
		return users;
				
	
	}
}
