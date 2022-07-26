<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<%
    Connection conn = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam?serverTimezone=Asia/Seoul","root","1234");

        System.out.println("db 연결 성공");

        conn.close();
    } catch (Exception e) {
        System.out.println("db 연결 실패");
        e.printStackTrace();
    }
%>
</body>
</html>
