<%--
  Created by IntelliJ IDEA.
  User: GreenArt
  Date: 2022-07-28
  Time: 오후 12:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    session.invalidate();
    out.println("<script>");
    out.println("location.href='main.jsp'");
    out.println("</script>");
%>
로그아웃페이지
</body>
</html>
