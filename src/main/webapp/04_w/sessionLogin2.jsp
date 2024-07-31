<%@ page import="com.example.util.CookieManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Session - 로그인</title>
</head>
<body>
    <h2>로그인 페이지</h2>
    <form action="sessionLoginProcess2.jsp" method="post">
        <p>
            <label>아이디 : <input type="text" name="user_id" /></label>
        </p>
        <p>
            <label>패스워드 : <input type="password" name="user_pw"/></label>
        </p>
        <p>
            <input type="submit" value="로그인하기" />
        </p>
    </form>
</body>
</html>




