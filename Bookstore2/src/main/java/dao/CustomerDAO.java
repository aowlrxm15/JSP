package dao;

import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import vo.CustomerVO;
import vo.CustomerVO;
public class CustomerDAO extends DBHelper{
	
	private static CustomerDAO instance = new CustomerDAO();
	public static CustomerDAO getInstance() {
		return instance;
	}
	
	private CustomerDAO() {}

	
	public void insertCustomer(CustomerVO vo) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("insert into `Customer` values (?,?,?,?)");
			psmt.setInt(1, vo.getCustId());
			psmt.setString(2, vo.getName());
			psmt.setString(3, vo.getAddress());
			psmt.setString(4, vo.getPhone());
			psmt.executeUpdate();
			
			close();
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public CustomerVO selectCustomer(String CustomerId) {
		CustomerVO vo = null;
		try {
			conn = getConnection();
			conn.prepareStatement("select * from `Customer` where `CustomerId`=?");
			psmt.setString(1, CustomerId);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				vo = new CustomerVO();
				vo.setCustId(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setAddress(rs.getString(3));
				vo.setPhone(rs.getString(4));
			}
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public List<CustomerVO> selectCustomers(){
		List<CustomerVO> Customers = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from `Customer`");
			
			while(rs.next()) {
				CustomerVO vo = new CustomerVO();
				vo.setCustId(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setAddress(rs.getString(3));
				vo.setPhone(rs.getString(4));
				Customers.add(vo);
			}
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return Customers;
	}
	
	
	public void updateCustomer(CustomerVO vo) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("update `customer` set `name`=?, `address`=?, `phone`=? where `custId`=?");
			psmt.setInt(1, vo.getCustId());
			psmt.setString(2, vo.getName());
			psmt.setString(3, vo.getAddress());
			psmt.setString(4, vo.getPhone());
			psmt.executeUpdate();
			
			close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}