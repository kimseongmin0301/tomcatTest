<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	Object loginId = session.getAttribute("id");
	String id = (String)loginId;
	String title = request.getParameter("title");
	String content = request.getParameter("content");



    Connection conn = null;
	PreparedStatement pstmt = null;	
    		
    try{
        Context init = new InitialContext();
        DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
        conn = ds.getConnection();
		
        //ȸ�������� �ϱ� ���� sql ����
        // prepareStatment : java -> DB�� ������ ������ ���� ����ϴ� ��ü
        pstmt=conn.prepareStatement("insert into board(title,content,id) values(?,?,?)");
        // ù���� ����ǥ���� ����ڰ� �Է��� id��(request.getParameter(id))�� ����
		pstmt.setString(1,title);
        // �ι��� ����ǥ���� ����ڰ� �Է��� id��(request.getParameter(pw))�� ����
 		pstmt.setString(2,content);
        
 		pstmt.setString(3,id);
        
		// �� sql ������ ����(workbench : ctrl + enter)
		int result = pstmt.executeUpdate();
        //executeQuery() : select(select�� ����� ResultSet�̶�� ������ �����ؼ� ��ȯ)
        //executeUpdate() : insert, update, delete
       
        //insert�� �Ǿ����� result == 1
        if(result != 0){

        	out.println("<script>");
        	out.println("location.href='boardList.jsp'");
        	out.println("</script>");
        }else{ //�ƴϸ�
        	out.println("<script>");
        	out.println("location.href='board.jsp'");
        	out.println("</script>");
        }
        
    } catch (Exception e) {
        e.printStackTrace();
    }finally{
    	conn.close();
    	pstmt.close();
    }	
 %>
</body>
</html>