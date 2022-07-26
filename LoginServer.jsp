<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body>
<%
    //loginform.jsp에 있는 데이터 수집
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");


    System.out.println(id);
    System.out.println(pw);

    //db연결
    
    Connection conn = null;
	PreparedStatement pstmt = null;	
    ResultSet rs = null;

		
    try{
        Context init = new InitialContext();
        DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
        conn = ds.getConnection();
		
        //login을 하기 위한 sql 문장
        // prepareStatment : java -> DB에 쿼리를 보내기 위해 사용하는 객체
        pstmt=conn.prepareStatement("select * from member where id=? and password=?");
        // 첫번재 물음표에는 사용자가 입력한 id값(request.getParameter(id))을 설정
      	pstmt.setString(1, id); 
        
        // 두번재 물음표에는 사용자가 입력한 id값(request.getParameter(pw))을 설정
        pstmt.setString(2, pw);
        
		// 위 sql 문장을 실행(workbench : ctrl + enter)
        //executeQuery() : select(select된 결과를 ResultSet이라는 공간에 저장해서 반환)
        //executeUpdate() : insert, update, delete
       
		
		rs = pstmt.executeQuery();

        if(rs.next()){ //데이터있냐
			//로그인을 해라(session)
            //session 영역에 id값을 유지시킴으로 로그인 된 채로 서비스를 이용
            session.setAttribute("id",id);// 로그인이 된 채로
            // 메인페이지로 이동
            out.println("<script>");
            out.println("location.href='boardList.jsp'");
            out.println("</script>");
		}else{ //아니면
			//loginform 화면으로 이동
            out.println("<script>");
            out.println("location.href='index.jsp'");
            out.println("</script>");
		}
        
        
//        System.out.println("DB연결성공");
    } catch (Exception e) {
//        System.out.println("db 실패");
        e.printStackTrace();
    }finally{
    	conn.close();
    	rs.close();
    	pstmt.close();
    }
%>
</body>
</html>