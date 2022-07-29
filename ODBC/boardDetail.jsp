<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<%
    int bno = Integer.parseInt(request.getParameter("bno"));
    session.setAttribute("bno", bno);

    String contentID = request.getParameter("id");


    Connection conn = null;
    PreparedStatement pstmt = null;
    PreparedStatement pstmt2 = null;
    ResultSet rs = null;


    try {
        Context init = new InitialContext();
        DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mysql");
        conn = ds.getConnection();

        //login을 하기 위한 sql 문장
        // prepareStatment : java -> DB에 쿼리를 보내기 위해 사용하는 객체
        pstmt = conn.prepareStatement("select * from board where bno = ?");
        pstmt2 = conn.prepareStatement("update board set cnt = cnt + 1 where bno = ?");
        // 위 sql 문장을 실행(workbench : ctrl + enter)
        //executeQuery() : select(select된 결과를 ResultSet이라는 공간에 저장해서 반환)
        //executeUpdate() : insert, update, delete
        pstmt.setInt(1, bno);
        pstmt2.setInt(1, bno);
        rs = pstmt.executeQuery();
        int result = pstmt2.executeUpdate();

        if (rs.next()) {

%>
<h1>게시판 글쓰기</h1>
<form action="boardUpdate.jsp?id=<%=rs.getString("id")%>" method="get">
    <table>

        <tr>
            <td>
                제목 :
            </td>
            <td>
                <input type="text" name="title" value="<%=rs.getString("title")%>" readonly>
            </td>
        </tr>
        <tr>
            <td>
                내용 :
            </td>
            <td>
                <textarea cols="40" rows="10" style="resize : none;" name="content"
                          readonly><%=rs.getString("content")%></textarea><br>
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <input type="submit" value="수정">
            </td>
            <td>
                <input type="submit" value="목록" formaction="boardList.jsp">
            </td>
            <td>
                <input type="submit" value="삭제" formaction="boardDelete.jsp">
            </td>
        </tr>
    </table>
</form>

<%
            session.setAttribute("contentId", contentID);
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        conn.close();
        rs.close();
        pstmt.close();
    }
%>

</body>
</html>