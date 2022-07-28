<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
메인입니다
<a href="logoutServer.jsp">로그아웃</a>
<%=session.getAttribute("id")%>
</body>
</html>
