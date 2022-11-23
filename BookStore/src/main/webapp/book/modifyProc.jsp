<%@page import="java.sql.PreparedStatement"%>
<%@page import="config.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String bookid = request.getParameter("bookid");
	String bookname = request.getParameter("bookname");
	String publisher = request.getParameter("publisher");
	String price = request.getParameter("price");
	
	try{
		Connection conn = DBCP.getConnection();		
		String sql = "update `book` set  `bookname`=?, `publisher`=?, `price`=? where `bookid`=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, bookid);
		psmt.setString(2, bookname);
		psmt.setString(3, publisher);
		psmt.setString(4, price);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close(); 
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");
%>
