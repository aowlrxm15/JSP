<%@page import="org.apache.coyote.AsyncContextCallback"%>
<%@page import="bean.StudentBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DBCP"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.RegisterBean"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<RegisterBean> registers = new ArrayList<>(); 
	
	try{
		Connection conn = DBCP.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT `regStdNo`,c.stdName,a.lecName,b.regLecNo,b.regMidScore,b.regFinalScore,b.regTotalScore,b.regGrade FROM `lecture` AS a JOIN `register` AS b ON a.lecNo = b.regLecNo JOIN `student` AS c ON b.regStdNo = c.stdNo");
		
		while(rs.next()){
			RegisterBean rb = new RegisterBean();
			rb.setRegStdNo(rs.getString(1));
			rb.setStdName(rs.getString(2));
			rb.setLecName(rs.getString(3));
			rb.setRegLecNo(rs.getString(4));
			rb.setRegMidScore(rs.getInt(5));
			rb.setRegFinalScore(rs.getInt(6));
			rb.setRegTotalScore(rs.getInt(7));
			rb.setRegGrade(rs.getString(8));
			
			registers.add(rb);
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
		<title>수강관리</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(function () {
				$('.btnOrder').click(function(){
					$('section').show();
				});
				
				$('.btnclose').click(function(){
					$('section').hide();
				});
			});
		</script>
	</head>
	<body>
	<h3>수강관리</h3>
		<a href="./lecture.jsp">강좌관리</a>
		<a href="./register.jsp">수강관리</a>
		<a href="./student.jsp">학생관리</a>
		
		<h4>수강현황</h4>
		<button class="btnOrder" colspan="1" align="left">검색</button>
		<button class="btnOrder" colspan="1" align="left">수강신청</button>
		<table border="1">
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>강좌명</th>
				<th>강좌코드</th>
				<th>중간시험</th>
				<th>기말시험</th>
				<th>총점</th>
				<th>등급</th>
			</tr>
			<% for(RegisterBean rb : registers){ %>
			<tr>
				<td><%= rb.getRegStdNo() %></td>
				<td><%= rb.getStdName() %></td>
				<td><%= rb.getLecName() %></td>
				<td><%= rb.getRegLecNo() %></td>
				<td><%= rb.getRegMidScore() %></td>
				<td><%= rb.getRegFinalScore() %></td>
				<td><%= rb.getRegTotalScore() %></td>
				<td><%= rb.getRegGrade() %></td>
			</tr>
			<% } %>
		</table>
		
		<section style="display:none;">
			<h4>수강신청</h4>
			<button class="btnclose">닫기</button>
			<table border="1">
				<tr>
					<td>학번</td>
					<td><input type="text" name="regStdNo"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="stdName"></td>
				</tr>
				<tr>
					<td>신청강좌</td>
					<td><input type="text" name="lecname"></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="신청"></td>
				</tr>
			</table>
		</section>
		
	</body>
</html>