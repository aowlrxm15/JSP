<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>고객목록</title>
	</head>
	<body>
		<a href="/Bookstore2/index.do">처음으로</a>
		<a href="/Bookstore2/customer/register.do">고객등록</a>
		
		<table border="1">
			<tr>
				<th>고객번호</th>
				<th>고객명</th>
				<th>주소</th>
				<th>휴대폰</th>
				<th>관리</th>
			</tr>
			<c:forEach var="book" items="${requestScope.books}">
				<tr>
					<td>${book.getbookId()}</td>
					<td>${book.getbookName()}</td>
					<td>${book.getpublisher()}</td>
					<td>${book.getprice()}</td>
					<td>
						<a href="/Bookstore/customer/modify.do">수정</a>
						<a href="/Bookstore/customer/delete.do">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>