<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>글쓰기</h1>
<form action="boardWriteServer.jsp">
    <table>
        <tr>
            <td>
                제목 :
            </td>
            <td>
                <input type="text" name="title" placeholder="제목">
            </td>
        </tr>
        <tr>
            <td>
                내용 :
            </td>
            <td>
                <textarea style="resize : none;" cols="40" rows="10" name="text" placeholder="내용"></textarea>
            </td>
        </tr>
        <tr>
            <td>
                <input type="submit" value="글쓰기">
            </td>
            <td>
                <a href="boardList.jsp"><input type="button" value="취소"></a>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
