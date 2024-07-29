<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>

<%
    String pVal  = "최애";
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>액션 태그 - Param</title>
</head>
<body>
    <jsp:useBean id="person" class="com.example.jsp.common.Person" scope="request"/>
    <jsp:setProperty name="person" property="name" value="아이유"/>
    <jsp:setProperty name="person" property="age" value="28"/>
    <jsp:forward page="ParamForward.jsp?param1=파라미터">
        <jsp:param name="param2" value="꽃갈피"/>
        <jsp:param name="param3" value="<%=pVal%>"/>
    </jsp:forward>
</body>
</html>
