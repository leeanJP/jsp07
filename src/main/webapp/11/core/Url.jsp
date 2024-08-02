<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - URL</title>
</head>
<body>
    <c:set var="requestVar" value="must" scope="request"/>
    <c:url value="OtherPage.jsp" var="url">
        <c:param name="user_param1" value="1"/>
        <c:param name="user_param2">2</c:param>
    </c:url>
    <a href="${url}">OtherPage 바로가기</a>
</body>
</html>
