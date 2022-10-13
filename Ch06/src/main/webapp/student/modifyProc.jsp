<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="bean.StudentBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%
	// 전송 데이터 수신
	request.setCharacterEncoding("utf-8");
	String stdNo = request.getParameter("stdNo");
	String stdName = request.getParameter("stdName");
	String stdHp = request.getParameter("stdHp");
	String stdYear = request.getParameter("stdYear");
	String stdAddress = request.getParameter("stdAddress");
	
	// 데이터베이스 작업(Statement)
	StudentBean sb = null;
	
	try{
		String host = "jdbc:mysql://127.0.0.1:3306/java2db";
		String user = "root";
		String pass = "1234";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		Statement stmt = conn.createStatement();
		
		String sql  = "UPDATE `student` SET ";
	       sql += "`stdNo`='"+stdNo+"',";
	       sql += "`stdName`='"+stdName+"',";
	       sql += "`stdHp`='"+stdHp+"',";
	       sql += "`stdYear`="+stdYear+", ";
	       sql += "`stdAddres`="+stdAddress+", ";
	       sql += "WHERE `stdNo`='"+stdNo+"'";
	       
	stmt.executeUpdate(sql);		       	
	conn.close();
	
}catch(Exception e){
	e.printStackTrace();
}

// 목록이동
response.sendRedirect("./list.jsp");

%>