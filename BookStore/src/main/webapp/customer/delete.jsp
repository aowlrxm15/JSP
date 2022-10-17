<%@page import="java.sql.Statement"%>
<%@page import="config.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String custid = request.getParameter("custid");
	
	try{
		Connection conn = DBCP.getConnection();		
		Statement stmt = conn.createStatement();
		stmt.executeUpdate("DELETE FROM `customer` where `custid`='"+custid+"'");
		stmt.close();
		conn.close(); 
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	
	response.sendRedirect("./list.jsp");
%>