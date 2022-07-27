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
		
        //회원가입을 하기 위한 sql 문장
        // prepareStatment : java -> DB에 쿼리를 보내기 위해 사용하는 객체
        pstmt=conn.prepareStatement("insert into board(title,content,id) values(?,?,?)");
        // 첫번재 물음표에는 사용자가 입력한 id값(request.getParameter(id))을 설정
		pstmt.setString(1,title);
        // 두번재 물음표에는 사용자가 입력한 id값(request.getParameter(pw))을 설정
 		pstmt.setString(2,content);
        
 		pstmt.setString(3,id);
        
		// 위 sql 문장을 실행(workbench : ctrl + enter)
		int result = pstmt.executeUpdate();
        //executeQuery() : select(select된 결과를 ResultSet이라는 공간에 저장해서 반환)
        //executeUpdate() : insert, update, delete
       
        //insert가 되었으면 result == 1
        if(result != 0){

        	out.println("<script>");
        	out.println("location.href='boardList.jsp'");
        	out.println("</script>");
        }else{ //아니면
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