<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<%
    SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");

    long creationTime = session.getCreationTime(); //최초요청 (세션 생성) 시간
    String creationTimeStr = sdf.format(new Date(creationTime));

    long lastTime = session.getLastAccessedTime(); //마지막 요청 시간
    String lastTimeStr = sdf.format(new Date(lastTime));


%>

<html>
<head>
    <meta charset="UTF-8">
    <title>Session 설정 확인</title>
</head>
<body>
    <h2>세션 유지 시간</h2>
    <ul>
        <li>세션 유지 시간: <%= session.getMaxInactiveInterval()%> </li>
        <li>세션 아이디 :  <%=session.getId()%> </li>
        <li>최초 요청 시간 : <%=creationTimeStr%></li>
        <li>마지막 요청 시간 : <%=lastTimeStr%></li>

    </ul>
</body>
</html>
