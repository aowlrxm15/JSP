<%@page import="java.sql.PreparedStatement"%>
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
	String phone= request.getParameter("phone");
	
	try{
		
		// 1단계 - JNDI 서비스 객체생성
		Context initCtx = new InitialContext();
		Context ctx = (Context)initCtx.lookup("java:comp/env"); 
		
		// 2단계
		DataSource ds = (DataSource)ctx.lookup("dbcp_java2db"); 
		Connection conn = ds.getConnection(); 
		
		// 3단계
		String sql = "INSERT INTO `customer` VALUES (?,?,?,?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, custid);
		psmt.setString(2, name);
		psmt.setString(3, address);
		psmt.setString(4, phone);
		
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