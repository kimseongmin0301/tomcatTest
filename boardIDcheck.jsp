<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%

    Object b = session.getAttribute("id");
    String logId = String.valueOf(b);

    String contentId = request.getParameter("id");


    if (logId.equals(contentId)) {
        out.println("<script>");
        out.println("location.href='boardUpdate.jsp'");
        out.println("</script>");
    } else {
        out.println("<script>");
        out.println("alert('권한없음')");
        out.println("location.href='boardList.jsp'");
        out.println("</script>");
    }
%>
</body>
</html>
