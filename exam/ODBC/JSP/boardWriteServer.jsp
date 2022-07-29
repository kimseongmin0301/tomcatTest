<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>

<%
    String title = request.getParameter("title");
    String text = request.getParameter("text");

    PreparedStatement pstmt = null;
    Connection conn = null;
    final String insert = "INSERT INTO MS_BOARD(ID,TITLE,TEXT) VALUES(?,?,?)";

    try{
        Context init = new InitialContext();
        DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mysql");
        conn = ds.getConnection();

        pstmt = conn.prepareStatement(insert);

        pstmt.setString(1, (String) session.getAttribute("id"));
        pstmt.setString(2,title);
        pstmt.setString(3,text);

        int result = pstmt.executeUpdate();

        if (result != 0) {
            out.println("<script>");
            out.println("location.href='boardList.jsp'");
            out.println("</script>");
        } else { //아니면
            out.println("<script>");
            out.println("location.href='boardWrite.jsp'");
            out.println("</script>");
        }
    }catch(Exception e){
        e.printStackTrace();
    }finally{
        conn.close();
        pstmt.close();
    }
%>