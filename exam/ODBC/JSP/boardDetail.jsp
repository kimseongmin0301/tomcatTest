<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    int BNO = Integer.parseInt(request.getParameter("BNO"));

    ResultSet rs = null;
    Connection conn = null;
    PreparedStatement pstmt = null;
    final String select = "SELECT B.BNO, B.TITLE, A.NAME, B.TEXT FROM MS_ACCOUNT A, MS_BOARD B WHERE A.ID = B.ID AND B.BNO = ?";

    try {
        Context init = new InitialContext();
        DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mysql");
        conn = ds.getConnection();

        pstmt = conn.prepareStatement(select);
        pstmt.setInt(1, BNO);

        rs = pstmt.executeQuery();

        if (rs.next()) {
%>
<h1>상세 내용 보기</h1>
<form action="boardModify.jsp">
    <table>
        <tr>
            <td>제목 :</td>
            <td>
                <input type="text" value="<%=rs.getString("B.TITLE")%>" readonly>
                <input type="text" value="<%=rs.getInt("B.BNO")%>" name="BNO" hidden>
            </td>

        </tr>
        <tr>
            <td>글쓴이 :</td>
            <td>
                <input type="text" value="<%=rs.getString("A.NAME")%>" readonly>
            </td>
        </tr>
        <tr>
            <td>내용 :</td>
            <td>
                <textarea style="resize : none;" cols="40" rows="10"
                          readonly><%=rs.getString("B.TEXT")%></textarea>
            </td>
        </tr>
        <tr>
            <td>
                <input type="submit" value="수정하기">
            </td>
            <td>
                <input type="submit" value="삭제하기" formaction="boardDeleteServer.jsp">
            </td>
            <td>
                <a href="boardList.jsp"><input type="button" value="목록" formaction="boardList.jsp"></a>
            </td>
        </tr>
    </table>
</form>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        rs.close();
        conn.close();
        pstmt.close();
    }
%>
</body>
</html>
