<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String name = request.getParameter("name");

    Connection conn = null;
    PreparedStatement pstmt = null;
    final String ins = "insert into MS_ACCOUNT(ID,PW,NAME) values(?,?,?)";

    try {
        Context init = new InitialContext();
        DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mysql");
        conn = ds.getConnection();

        pstmt = conn.prepareStatement(ins);

        pstmt.setString(1, id);
        pstmt.setString(2, pw);
        pstmt.setString(3, name);

        int result = pstmt.executeUpdate();

        if (result != 0) {
            out.println("<script>");
            out.println("location.href='login.jsp'");
            out.println("</script>");
        } else { //아니면
            //회원가입 화면으로 이동
            out.println("<script>");
            out.println("location.href='member.jsp'");
            out.println("</script>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        conn.close();
        pstmt.close();
    }

%>