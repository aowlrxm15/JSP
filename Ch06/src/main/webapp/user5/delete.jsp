<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="config.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%
	// 전송 데이터 수신
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String age = request.getParameter("age");
	String addr = request.getParameter("addr");
	
	// 데이터베이스 작업
	try{
		Connection conn = DBCP.getConnection();		
		Statement stmt = conn.createStatement();
		// 4단계
		stmt.executeUpdate("DELETE FROM `user5` where `uid`=?");
		// 5단계
		// 6단계
		stmt.close();
		conn.close(); // 커넥션 반납
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// 리다이렉트
	response.sendRedirect("./list.jsp");
%>