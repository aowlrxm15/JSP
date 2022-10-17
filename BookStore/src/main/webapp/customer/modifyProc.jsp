<%@page import="java.sql.PreparedStatement"%>
<%@page import="config.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String custid = request.getParameter("custid");
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
	
	try{
		Connection conn = DBCP.getConnection();		
		String sql = "update `customer` set `custid`=?, `name`=?, `address`=?, `phone`=? where `custid`=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, custid);
		psmt.setString(2, name);
		psmt.setString(3, address);
		psmt.setString(4, phone);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close(); 
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");
%>
