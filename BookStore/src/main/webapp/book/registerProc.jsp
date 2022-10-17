<%@page import="java.sql.PreparedStatement"%>
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
		
		// 1단계 - JNDI 서비스 객체생성
		Context initCtx = new InitialContext();
		Context ctx = (Context)initCtx.lookup("java:comp/env"); 
		
		// 2단계
		DataSource ds = (DataSource)ctx.lookup("dbcp_java2db"); 
		Connection conn = ds.getConnection(); 
		
		// 3단계
		String sql = "INSERT INTO `book` VALUES (?,?,?,?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, bookid);
		psmt.setString(2, bookname);
		psmt.setString(3, publisher);
		psmt.setString(4, price);
		
		// 4단계
		psmt.executeUpdate();
		// 5단계
		
		// 6단계
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// 리다이렉트
	response.sendRedirect("./list.jsp");
%>