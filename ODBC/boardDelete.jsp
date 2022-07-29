<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--</head>--%>
<%--<body>--%>
<%
    Object a = session.getAttribute("bno");
    int bno = (Integer) a;

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Context init = new InitialContext();
        DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mysql");
        conn = ds.getConnection();

        //회원가입을 하기 위한 sql 문장
        // prepareStatment : java -> DB에 쿼리를 보내기 위해 사용하는 객체
        pstmt = conn.prepareStatement("delete from board where bno = ?");

        pstmt.setInt(1, bno);

        // 위 sql 문장을 실행(workbench : ctrl + enter)
        int result = pstmt.executeUpdate();
        //executeQuery() : select(select된 결과를 ResultSet이라는 공간에 저장해서 반환)
        //executeUpdate() : insert, update, delete

        response.sendRedirect(request.getContextPath() + "/boardList.jsp");

        //insert가 되었으면 result == 1
//        if(result != 0){
//            out.println("<script>");
//            out.println("location.href='boardList.jsp'");
//            out.println("</script>");
//        }else{ //아니면
//            out.println("<script>");
//            out.println("location.href='boardDetail.jsp'");
//            out.println("</script>");
//        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        conn.close();
        pstmt.close();
    }
%>
<%--</body>--%>
<%--</html>--%>
