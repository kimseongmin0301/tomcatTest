<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>

<%
    String title = request.getParameter("title");
    String text = request.getParameter("text");
    int BNO = Integer.parseInt(request.getParameter("BNO"));

    PreparedStatement pstmt = null;
    Connection conn = null;
    final String insert = "UPDATE MS_BOARD SET TITLE=?, TEXT=? WHERE BNO=?";

    try{
        Context init = new InitialContext();
        DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mysql");
        conn = ds.getConnection();

        pstmt = conn.prepareStatement(insert);

        pstmt.setString(1, title);
        pstmt.setString(2,text);
        pstmt.setInt(3,BNO);

        int result = pstmt.executeUpdate();

        if (result != 0) {
            out.println("<script>");
            out.println("location.href='boardDetail.jsp?BNO="+ BNO +"'");
            out.println("</script>");
        } else { //아니면
            out.println("<script>");
            out.println("location.href='boardModify.jsp?BNO="+ BNO + "'");
            out.println("</script>");
        }
    }catch(Exception e){
        e.printStackTrace();
    }finally{
        conn.close();
        pstmt.close();
    }
%>