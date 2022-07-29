<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<html>
<head>
    <title>Title</title>
    <style>
        a{
            text-decoration: none;
            color:black;
        }
        *{
            margin:0;
            padding:0;
        }
        #container{
            margin:0 auto;
            width:1024px;
            height:100vh;
        }
        #header{
            margin:50px auto;
            display: flex;
            justify-content: center;
        }
        #main{
            margin:50px auto 0 auto;
            display: block;
            justify-content: center;
        }
        table{
            width:100%;
            text-align: center;
            border-collapse: collapse;
        }
        #write{
            display: flex;
            justify-items:start;
        }
        th, td {
            border: 1px solid #444444;
            line-height: 30px;
        }
        .first{
            width:100px;
        }
        input{
            width:100px;
            height:50px;
        }
        th{
            background:#B778FF;
        }
        td{
            background:#FFF6FF;
        }
    </style>
</head>
<body>
<div id="container">
    <div id="header">
        <h1>게시글 목록 리스트</h1>
    </div>
    <div id="main">
        <table>
            <tr>
                <th class="first">
                    글번호
                </th>
                <th class="first">
                    글쓴이
                </th>
                <th>
                    글제목
                </th>
            </tr>
            <%
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                final String select = "SELECT B.BNO, A.NAME, B.TITLE FROM MS_ACCOUNT A, MS_BOARD B WHERE A.ID = B.ID ORDER BY B.BNO ASC";

                try {
                    Context init = new InitialContext();
                    DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mysql");
                    conn = ds.getConnection();

                    pstmt = conn.prepareStatement(select);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
            %>
            <tr>
                <td>
                    <%=rs.getInt("BNO") %>
                </td>
                <td>
                    <%=rs.getString("NAME")%>
                </td>
                <td>
                    <a href="boardDetail.jsp?BNO=<%=rs.getInt("BNO")%>"><%=rs.getString("TITLE") %>
                    </a>
                </td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    conn.close();
                    rs.close();
                    pstmt.close();
                }
            %>
        </table>
        <div id="write">
            <a href="boardWrite.jsp"><input type="button" value="글쓰기"></a>
        </div>
    </div>
</div>
</body>
</html>
