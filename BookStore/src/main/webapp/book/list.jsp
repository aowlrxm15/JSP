<%@page import="Bean.bookBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="config.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<bookBean> books = new ArrayList<>();
	try{
		Connection conn = DBCP.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from `book`");
		
		while(rs.next()){
			bookBean bB = new bookBean();
			bB.setBookid(rs.getString(1));
			bB.setBookname(rs.getString(2));
			bB.setPublisher(rs.getString(3));
			bB.setPrice(rs.getInt(4));
			
			books.add(bB);
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
		<title>book:list</title>
	</head>
	<body>
		<h3>도서목록</h3>
		
		<a href="../index.jsp">처음으로</a>
		<a href="./register.jsp">도서등록</a>
		
		<table border="1">
			<tr>
				<th>도서번호</th>
				<th>도서명</th>
				<th>출판사</th>
				<th>가격</th>
				<th>관리</th>
			</tr>
		
			<% for(bookBean bB : books){ %>
			<tr>
				<td><%= bB.getBookid() %></td>
				<td><%= bB.getBookname() %></td>
				<td><%= bB.getPublisher() %></td>
				<td><%= bB.getPrice() %></td>
				<td>
					<a href="./modify.jsp?bookid=<%= bB.getBookid()%>">수정</a>
					<a href="./delete.jsp?bookid=<%= bB.getBookid()%>">삭제</a>
				</td>
			</tr>
			<% } %>
		</table>
	</body>
</html>