<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");

    ResultSet rs = null;
    Connection conn = null;
    PreparedStatement pstmt = null;
    final String select = "SELECT ID, PW FROM MS_ACCOUNT WHERE ID = ? AND PW=?";

    try {
        Context init = new InitialContext();
        DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mysql");
        conn = ds.getConnection();

        pstmt = conn.prepareStatement(select);

        pstmt.setString(1,id);
        pstmt.setString(2,pw);

        rs = pstmt.executeQuery();

        if(rs.next()){
            session.setAttribute("id", id);
            out.println("<script>");
            out.println("location.href='boardList.jsp'");
            out.println("</script>");
        }else{
            out.println("<script>");
            out.println("location.href='login.jsp'");
            out.println("</script>");
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        conn.close();
        rs.close();
        pstmt.close();
    }
%>