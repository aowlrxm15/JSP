package kr.co.jboard2.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.db.DBHelper;

public class UserDAO extends DBHelper{

	private static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {
		return instance;
	}
	private UserDAO() {}
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insertUser() {}
	
	public void selectUser() {
		try {
			
		}catch (Exception e) {
			
		}
	}
	
	public void selectUsers() {}
	
	public void updateUser() {}
	
	public void deleteUser() {}
}
