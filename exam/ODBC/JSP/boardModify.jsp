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
<form action="boardModifyServer.jsp">
    <table>
        <tr>
            <td>제목 :</td>
            <td>
                <input type="text" value="<%=rs.getString("TITLE")%>" name="title" placeholder="제목">
                <input type="text" value="<%=rs.getInt("BNO")%>" name="BNO" hidden>
            </td>
        </tr>
        <tr>
            <td>글쓴이 :</td>
            <td>
                <input type="text" value="<%=rs.getString("NAME")%>" name="name" readonly>
            </td>
        </tr>
        <tr>
            <td>내용 :</td>
            <td>
                <textarea style="resize : none;" cols="40" rows="10" name="text" placeholder="내용"><%=rs.getString("TEXT")%></textarea>
            </td>
        </tr>
        <tr>
            <td>
                <input type="submit" value="수정완료">
            </td>
            <td>
                <a href="boardDetail.jsp?BNO=<%=rs.getInt("BNO")%>"><input type="button" value="취소"></a>
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
