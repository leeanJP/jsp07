<%@ page import="com.example.common.JDBCConnect" %>
<%@ page import="com.example.common.DBConnPool" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>JDBC </title>
</head>
<body>
    <h2>JDBC 테스트</h2>
    <%
        JDBCConnect jdbc1 = new JDBCConnect();
        jdbc1.close();
    %>

    <h2>JDBC 테스트 2</h2>
    <%
        String driver = application.getInitParameter("OracleDriver");
        String url = application.getInitParameter("OracleURL");
        String id = application.getInitParameter("OracleId");
        String pwd = application.getInitParameter("OraclePwd");


        JDBCConnect jdbc2 = new JDBCConnect(driver, url, id, pwd);
    %>


    <h2>JDBC 테스트 3</h2>
    <%
        JDBCConnect jdbc3 = new JDBCConnect(application);
        //DB CRUD
        jdbc3.close();
    %>

    <h2>커넥션 풀 테스트</h2>
    <%
        DBConnPool pool = new DBConnPool();
        pool.close();
    %>

</body>
</html>
