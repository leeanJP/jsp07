<%@ page import="java.util.Enumeration" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>내장객체 - Request</title>
</head>
<body>
    <h2>3. 요청헤더 정보 출력하기</h2>
    <%
        Enumeration header = request.getHeaderNames();
        while (header.hasMoreElements()) {
            String name = header.nextElement().toString();
            String hValue = request.getHeader(name);
            out.println("헤더명 : " + name  +  ", 헤더값 : " + hValue + "<br/>");
        }
    %>
    <p>이 파일을 직접 실행하면 referer 정보는 출력되지 않음</p>
</body>
</html>
