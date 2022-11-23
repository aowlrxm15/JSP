<%@page import="Bean.customerBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="config.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%


	request.setCharacterEncoding("UTF-8");
	String custid = request.getParameter("custid");
	customerBean cB = null;
	
	try{
		Connection conn = DBCP.getConnection();
		
		String sql = "SELECT * FROM `customer` where `custid`=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, custid);
		
		ResultSet rs = psmt.executeQuery();
		if(rs.next()){
	cB = new customerBean();
	cB.setCustid(rs.getString(1));
	cB.setName(rs.getString(2));
	cB.setAddress(rs.getString(3));
	cB.setPhone(rs.getString(4));
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
		<title>customer::modify</title>
	</head>
	<body>
		<h3>고객수정</h3>
		
		<a href="../index.jsp">처음으로</a>
		<a href="./list.jsp">고객목록</a>
		
		<form action="./registerProc.jsp" method="post">
		
			<table border="1">
				<tr>
					<td>고객번호</td>	
					<td><input type="text" name="custid" value="<%= cB.getCustid()%>"></td>	
				</tr>
				<tr>
					<td>고객이름</td>
					<td><input type="text" name="name" value="<%= cB.getName()%>"/></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" value="<%= cB.getAddress()%>"/></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="phone" value="<%= cB.getPhone()%>"/></td>
				<tr>
					<td>
						<td colspan="2" align="right"><input type="submit" value="수정"/></td>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>