<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>게시판 이용하기</h1>
<form action="loginServer.jsp" method="post">
    <table>
        <tr>
            <td colspan="2">
                <input type="text" placeholder="ID" name="id">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="password" placeholder="PASSWORD" name="pw">
            </td>
        </tr>
        <tr>
            <td>
                <input type="submit" value="로그인">
            </td>
            <td>
                <a href="member.jsp"><input type="button" value="회원가입"></a>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
