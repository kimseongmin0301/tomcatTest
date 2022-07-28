<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSP - Hello World</title>
</head>
<body>
<form action="LoginServer.jsp" method="post">
    <table>
        <tr>
            <td>아이디</td>
            <td><input type="text" name="id"></td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="pw"></td>
        </tr>
        <tr>
            <td>
                <input type="submit" value="로그인">
                <input type="submit" value="회원가입" formaction="member.jsp">
            </td>
        </tr>
    </table>
</form>
</body>
</html>