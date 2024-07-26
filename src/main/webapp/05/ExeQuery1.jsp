<%@ page import="com.example.common.JDBCConnect" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>JDBC</title>
</head>
<body>
    <h2>부서 조회 테스트(executeQuery() 사용)</h2>

    <%
        JDBCConnect jdbc = new JDBCConnect();

        //쿼리문 생성
        String sql = "SELECT DEPTNO, DNAME, LOC FROM scott.DEPT";
        Statement stmt = jdbc.conn.createStatement();
        //쿼리 실행
        ResultSet rs = stmt.executeQuery(sql);

        //결과 확인(페이지에 출력)
        while(rs.next()){
            String deptno = rs.getString(1);
            String dname = rs.getString(2);
            String loc = rs.getString(3);

            out.println(String.format("%s %s %s" , deptno , dname, loc ) + "<br/>");

        }

        //연결 종료
        jdbc.close();
    %>
</body>
</html>
