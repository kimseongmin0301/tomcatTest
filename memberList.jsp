<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>ȸ����� ����Ʈ</h1>
<table border = 1>
	<tr>
		<td>���̵�</td><td>�ּ�</td><td>�̸���</td><td>�̸�</td>
	</tr>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;	
	ResultSet rs = null;

	
	try{
	    Context init = new InitialContext();
	    DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
	    conn = ds.getConnection();
		
	    //login�� �ϱ� ���� sql ����
	    // prepareStatment : java -> DB�� ������ ������ ���� ����ϴ� ��ü
	    pstmt=conn.prepareStatement("select * from member");
	   
		// �� sql ������ ����(workbench : ctrl + enter)
	    //executeQuery() : select(select�� ����� ResultSet�̶�� ������ �����ؼ� ��ȯ)
	    //executeUpdate() : insert, update, delete
	   
		rs = pstmt.executeQuery();

	    while(rs.next()){
%>	    	
			<tr>
				<td><%=rs.getString("id") %></td>
				<td><%=rs.getString("addr") %></td>
				<td><%=rs.getString("email") %></td>
				<td><%=rs.getString("name") %></td>
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
</table>
</body>
</html>