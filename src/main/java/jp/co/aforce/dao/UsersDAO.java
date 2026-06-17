package jp.co.aforce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jp.co.aforce.beans.Users;

public class UsersDAO extends DAO {

	
	public Users search(String loginId, String password) throws Exception {
		Users users = null;

		Connection con = getConnection();

		PreparedStatement st;
		st = con.prepareStatement(
			"select * from users where (MEMBER_ID=? OR MAIL_ADDRESS=?) and PASSWORD=?");
		st.setString(1, loginId);
		st.setString(2, loginId);
		st.setString(3, password);
		ResultSet rs = st.executeQuery();

		if (rs.next()) {
			users = new Users();
			users.setMemberId(rs.getString("MEMBER_ID"));
			users.setMailAddress(rs.getString("MAIL_ADDRESS"));
			users.setAddress(rs.getString("ADDRESS"));
			users.setPassword(rs.getString("PASSWORD"));
			users.setLastName(rs.getString("LAST_NAME"));   
			users.setFirstName(rs.getString("FIRST_NAME"));
			users.setUserRole(rs.getString("user_role")); 
		}

		st.close();
		con.close();

		return users;
	}

	public boolean checkIdExists(String memberId) throws Exception {
		boolean exists = false;
		Connection con = getConnection();
		
		PreparedStatement st = con.prepareStatement(
			"select COUNT(*) from users where MEMBER_ID = ?");
		st.setString(1, memberId);
		ResultSet rs = st.executeQuery();
		
		if (rs.next()) {
			// カウントが0より大きければ、存在する（true）
			if (rs.getInt(1) > 0) {
				exists = true;
			}
		}
		
		rs.close();
		st.close();
		con.close();
		return exists;
	}

	//会員登録機能（Insert）
	public int insert(Users user) throws Exception {
		Connection con = getConnection();
		
		PreparedStatement st = con.prepareStatement(
			"insert into users (MEMBER_ID, MAIL_ADDRESS, PASSWORD, LAST_NAME, FIRST_NAME, ADDRESS, user_role) values (?, ?, ?, ?, ?, ?, 'user')");
		st.setString(1, user.getMemberId());
		st.setString(2, user.getMailAddress()); 
		st.setString(3, user.getPassword());
		st.setString(4, user.getLastName());
		st.setString(5, user.getFirstName());
		st.setString(6, user.getAddress());
		
		int line = st.executeUpdate();
		
		st.close();
		con.close();
		return line; 
	}

	//会員編集機能（Update）
	//主キー（MEMBER_ID）を条件にして、パスワード、名前、住所、メールを一括更新
	public int update(Users user) throws Exception {
		Connection con = getConnection();
		
		PreparedStatement st = con.prepareStatement(
			"update users set MAIL_ADDRESS = ?, PASSWORD = ?, LAST_NAME = ?, FIRST_NAME = ?, ADDRESS = ? where MEMBER_ID = ?");
		st.setString(1, user.getMailAddress());
		st.setString(2, user.getPassword());
		st.setString(3, user.getLastName());
		st.setString(4, user.getFirstName());
		st.setString(5, user.getAddress());
		st.setString(6, user.getMemberId());
		
		int line = st.executeUpdate();
		
		st.close();
		con.close();
		return line;
	}

	//会員削除機能（Delete）
	//主キー（MEMBER_ID）を指定して、DBから物理削除
	public int delete(String memberId) throws Exception {
		Connection con = getConnection();
		
		PreparedStatement st = con.prepareStatement(
			"delete from users where MEMBER_ID = ?");
		st.setString(1, memberId);
		
		int line = st.executeUpdate();
		
		st.close();
		con.close();
		return line;
	}
}