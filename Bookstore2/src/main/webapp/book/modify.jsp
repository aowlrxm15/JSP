<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h3>도서수정</h3>
		<a href="/Bookstore2/book/index.do">처음으로</a>
		<a href="/Bookstore2/book/list.do">도서목록</a>
		<table border="1">
			<tr>
				<td>도서번호</td>
				<td><input type="text" name="bookId"></td>
			</tr>
			<tr>
				<td>도서명</td>
				<td><input type="text" name="bookId"></td>
			</tr>
			<tr>
				<td>출판사</td>
				<td><input type="text" name="bookId"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="bookId"></td>
			</tr>
			<tr>
				<td>수정</td>
				<td colspan="2" align="right"><input type="submit" value="수정"></td>
			</tr>
		</table>
	</body>
</html>