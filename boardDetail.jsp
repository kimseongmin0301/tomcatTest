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
    Object loginId = session.getAttribute("id");
    String id = (String)loginId;
    Object tle = session.getAttribute("title");
    String uptitle = (String)tle;
    Object cont = session.getAttribute("content");
    String upcontent = (String)cont;


    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;


    try{
        Context init = new InitialContext();
        DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
        conn = ds.getConnection();

        //login을 하기 위한 sql 문장
        // prepareStatment : java -> DB에 쿼리를 보내기 위해 사용하는 객체
        pstmt=conn.prepareStatement("select * from board where title=? and content= ? and id =?");

        // 위 sql 문장을 실행(workbench : ctrl + enter)
        //executeQuery() : select(select된 결과를 ResultSet이라는 공간에 저장해서 반환)
        //executeUpdate() : insert, update, delete
        pstmt.setString(1, uptitle);
        pstmt.setString(2, upcontent);
        pstmt.setString(3, id);
        rs = pstmt.executeQuery();

        while(rs.next()){
%>
<form action="boardServer.jsp" accept-charset="UTF-8">
    <h1>게시판 글쓰기</h1>
    <table>
        <tr>
            <td>
                제목 :
            </td>
            <td>
                <input type="text" size=40 name="title" value="<%=rs.getString("title")%>"><br>
            </td>
        </tr>
        <tr>
            <td>
                내용 :
            </td>
            <td>
                <textarea cols="40" rows="10" name="content"><%=rs.getString("content")%></textarea><br>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="글쓰기">
            </td>
        </tr>


    </table>
    <%
            }


        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            conn.close();
            rs.close();
            pstmt.close();
        }
    %>
</form>
</body>
</html>