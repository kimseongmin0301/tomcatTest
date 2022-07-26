<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	//����ڰ� �Է��� ���� ����
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String addr = request.getParameter("addr");
	
    Connection conn = null;
	PreparedStatement pstmt = null;	
    		
    try{
        Context init = new InitialContext();
        DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
        conn = ds.getConnection();
		
        //ȸ�������� �ϱ� ���� sql ����
        // prepareStatment : java -> DB�� ������ ������ ���� ����ϴ� ��ü
        pstmt=conn.prepareStatement("insert into member(id,password,addr) values(?,?,?)");
        // ù���� ����ǥ���� ����ڰ� �Է��� id��(request.getParameter(id))�� ����
		pstmt.setString(1,id);
        // �ι��� ����ǥ���� ����ڰ� �Է��� id��(request.getParameter(pw))�� ����
 		pstmt.setString(2,pw);
        // ������ ����ǥ���� ����ڰ� �Է��� id��(request.getParameter(addr))�� ����
		pstmt.setString(3,addr);
        
		// �� sql ������ ����(workbench : ctrl + enter)
		int result = pstmt.executeUpdate();
        //executeQuery() : select(select�� ����� ResultSet�̶�� ������ �����ؼ� ��ȯ)
        //executeUpdate() : insert, update, delete
       
        //insert�� �Ǿ����� result == 1
        if(result != 0){
        	//�α��� ȭ������ �̵�
        	out.println("<script>");
        	out.println("location.href='index.jsp'");
        	out.println("</script>");
        }else{ //�ƴϸ�
        	//ȸ������ ȭ������ �̵�
        	out.println("<script>");
        	out.println("location.href='member.jsp'");
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