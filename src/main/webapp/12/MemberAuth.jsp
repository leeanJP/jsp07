<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>MemberAuth</title>
</head>
<body>
    <h2>MVC 패턴으로 회원인증하기</h2>

    <p>
        <strong>${authMsg}</strong>
        <br/>
        <a href="./MemberAuth.mvc?id=admin&pass=1234">회원인증(관리자)</a> &nbsp;&nbsp;
        <a href="./MemberAuth.mvc?id=test1&pass=1234">회원인증(회원)</a> &nbsp;&nbsp;
        <a href="./MemberAuth.mvc?id=stranger&pass=1234">회원인증(비회원)</a> &nbsp;&nbsp;
    </p>
</body>
</html>
