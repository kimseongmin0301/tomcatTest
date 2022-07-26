<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>게시판 목록</h1>
<table border = 1>
	<tr>
		<td>게시판 번호</td><td>제목</td><td>날짜</td><td>조회수</td><td>아이디</td>
	</tr>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;	
	ResultSet rs = null;


	try{
	    Context init = new InitialContext();
	    DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
	    conn = ds.getConnection();
		
	    //login을 하기 위한 sql 문장
	    // prepareStatment : java -> DB에 쿼리를 보내기 위해 사용하는 객체
	    pstmt=conn.prepareStatement("select * from board");
	   
		// 위 sql 문장을 실행(workbench : ctrl + enter)
	    //executeQuery() : select(select된 결과를 ResultSet이라는 공간에 저장해서 반환)
	    //executeUpdate() : insert, update, delete
	   
		rs = pstmt.executeQuery();

	    while(rs.next()){
	%>	    	
			<tr>
				<td><%=rs.getInt("bno") %></td>
				<td><a href="boardDetail.jsp?bno=<%=rs.getInt("bno")%>"><%=rs.getString("title") %></a></td>
				<td><%=rs.getString("regdate") %></td>
				<td><%=rs.getString("cnt") %></td>
				<td><%=rs.getString("id") %></td>
			</tr>



	<%
		}


		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			conn.close();
			rs.close();
			pstmt.close();
		}
		%>
		<tr>
			<td colspan="6">
				<form action="board.jsp">
					<input type="submit" value="글쓰기">
				</form>
			</td>
		</tr>
		</table>
</body>
</html>