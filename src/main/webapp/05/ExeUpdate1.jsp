<%@ page import="com.example.common.JDBCConnect" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>JDBC</title>
</head>
<body>
    <h2>사원 추가 테스트(excuteUpdate() 사용)</h2>


    <%
        JDBCConnect jdbc = new JDBCConnect();

        //테스트용 입력값

        int empno =  9999;
        String ename = "이재필";
        String job = "slave";
        int mgr = 7839;
        int sal = 60000;
        int comm = 200;
        int deptno = 20;


        //쿼리문 생성
        String sql = "INSERT INTO SCOTT.EMP" +
                "(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)" +
                "VALUES(? , ?, ? , ?,sysdate,?,?,?)" ;


        PreparedStatement psmt = jdbc.conn.prepareStatement(sql);

        psmt.setInt(1, empno);
        psmt.setString(2,ename);
        psmt.setString(3,job);
        psmt.setInt(4,mgr);
        psmt.setInt(5,sal);
        psmt.setInt(6,comm);
        psmt.setInt(7,deptno);

        int intResult = psmt.executeUpdate();
        out.println(intResult + " 행이 입력되었습니다.");


        //연결 종료
        jdbc.close();

    %>

</body>
</html>
