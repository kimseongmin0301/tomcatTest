<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int BNO = Integer.parseInt(request.getParameter("BNO"));

    Connection conn = null;
    PreparedStatement pstmt = null;
    final String delete = "DELETE FROM MS_BOARD WHERE BNO = ?";

    try {
        Context init = new InitialContext();
        DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mysql");
        conn = ds.getConnection();

        pstmt = conn.prepareStatement(delete);

        pstmt.setInt(1,BNO);

        int result = pstmt.executeUpdate();
        if(result != 0){
            out.println("<script>");
            out.println("location.href='boardList.jsp'");
            out.println("</script>");
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        conn.close();
        pstmt.close();
    }
%>