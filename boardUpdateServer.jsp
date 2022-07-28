<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.xml.namespace.QName" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    //사용자가 입력한 값을 저장


    Object a = session.getAttribute("bno");
    int bno = (Integer)a;
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
        pstmt=conn.prepareStatement("update board set title=?, content = ? where bno = ?");

        pstmt.setString(1,title);
        pstmt.setString(2,content);
        pstmt.setInt(3,bno);

        int result = pstmt.executeUpdate();

        // 위 sql 문장을 실행(workbench : ctrl + enter)

        //executeQuery() : select(select된 결과를 ResultSet이라는 공간에 저장해서 반환)
        //executeUpdate() : insert, update, delete

        //insert가 되었으면 result == 1
//        response.sendRedirect(request.getContextPath() + "/boardDetail.jsp?bno=" + bno);
        if(result != 0){
            out.println("<script>");
            out.println("location.href='boardDetail.jsp?bno="+bno+"'");
            out.println("</script>");
        }else{ //아니면
            out.println("<script>");
            out.println("location.href='boardUpdate.jsp'");
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
