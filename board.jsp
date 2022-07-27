<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="boardServer.jsp" accept-charset="UTF-8">
	<h1>게시판 글쓰기</h1>
	<table>
	<tr>
		<td>
			제목 :
		</td>
		<td>
			<input type="text" size=40 name="title"><br>
		</td>
	</tr>
	<tr>
		<td>
			내용 :
		</td>
		<td>
			<textarea cols="40" rows="10" style= "resize : none;" name="content"></textarea><br>
		</td>
	</tr>
	 <tr>
	 	<td colspan="2">
	 			 <input type="submit" value="글쓰기">
	 	</td>
		 <td>
			 <a href="boardList.jsp"><input type="button" value="취소"></a>
		 </td>
	 </tr>
	</table>
</form>

</body>
</html>