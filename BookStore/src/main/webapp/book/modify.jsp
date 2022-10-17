<%@page import="Bean.bookBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="config.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String bookid = request.getParameter("bookid");
	bookBean bB = null;
	
	try{
		Connection conn = DBCP.getConnection();
		
		String sql = "SELECT * FROM `book` where `bookid`=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, bookid);
		
		ResultSet rs = psmt.executeQuery();
		if(rs.next()){
			bB = new bookBean();
			bB.setBookid(rs.getString(1));
			bB.setBookname(rs.getString(2));
			bB.setPublisher(rs.getString(3));
			bB.setPrice(rs.getInt(4));
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>book::modify</title>
	</head>
	<body>
		<h3>도서수정</h3>
		
		<a href="../index.jsp">처음으로</a>
		<a href="./list.jsp">도서목록</a>
		
		<form action="./registerProc.jsp" method="post">
		
			<table border="1">
				<tr>
					<td>도서번호</td>	
					<td><input type="text" name="bookid" value="<%= bB.getBookid()%>"></td>	
				</tr>
				<tr>
					<td>도서명</td>
					<td><input type="text" name="bookname" value="<%= bB.getBookname()%>"/></td>
				</tr>
				<tr>
					<td>출판사</td>
					<td><input type="text" name="publisher" value="<%= bB.getPublisher()%>"/></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="number" name="price" value="<%= bB.getPrice()%>"/></td>
				<tr>
					<td>
						<td colspan="2" align="right"><input type="submit" value="수정"/></td>
					</td>	
				</tr>
			</table>
		</form>
	</body>
</html>