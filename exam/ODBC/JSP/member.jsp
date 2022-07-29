<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body>
<h1>회원가입</h1>
<form action="memberServer.jsp" method="post">
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
            <td colspan="2">
                <input type="text" placeholder="NAME" name="name">
            </td>
        </tr>
        <tr>
            <td>
                <input type="submit" value="가입하기">
            </td>
        </tr>
    </table>
</form>
<script type="text/javascript" src="../JS/CRUD.js"></script>
</body>
</html>