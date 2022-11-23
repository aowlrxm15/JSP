<%@page import="Bean.customerBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="config.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%


	List<customerBean> customers = new ArrayList<>();
	try{
		Connection conn = DBCP.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from `customer`");
		
		while(rs.next()){
	customerBean cB = new customerBean();
	cB.setCustid(rs.getString(1));
	cB.setName(rs.getString(2));
	cB.setAddress(rs.getString(3));
	cB.setPhone(rs.getString(4));
	
	customers.add(cB);
		}
		rs.close();
		stmt.close();
		conn.close();		
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>customer:list</title>
	</head>
	<body>
		<h3>고객목록</h3>
		
		<a href="../index.jsp">처음으로</a>
		<a href="./register.jsp">고객등록</a>
		
		<table border="1">
			<tr>
				<th>고객번호</th>
				<th>고객명</th>
				<th>주소</th>
				<th>휴대폰</th>
				<th>관리</th>
			</tr>
		
			<%
					
					 for(customerBean cB : customers){
					%>
			<tr>
				<td><%= cB.getCustid() %></td>
				<td><%= cB.getName() %></td>
				<td><%= cB.getAddress() %></td>
				<td><%= cB.getPhone() %></td>
				<td>
					<a href="./modify.jsp?custid=<%= cB.getCustid()%>">수정</a>
					<a href="./delete.jsp?custid=<%= cB.getCustid()%>">삭제</a>
				</td>
			</tr>
			<% } %>
		</table>
	</body>
</html>