<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h1>회원가입</h1>

<form action="MemberServer.jsp" accept-charset="UTF-8">
	<table>
		<tr>
			<td>ID : </td>
			<td><input type="text" name = "id"></td>
		</tr>
		<tr>
			<td>PW : </td>
			<td><input type="password" name = "pw"></td>
		</tr>
		<tr>
			<td>ADDR : </td>
			<td><input type="text" name = "addr"></td>
		</tr>
		<tr>
			<td colspan='2'>
				<input type="submit" value = "회원가입">
			</td>
		</tr>
	</table>
</form>
</body>
</html>