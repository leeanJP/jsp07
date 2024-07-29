<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<%
    pageContext.setAttribute("pAttr", "김유신");
    request.setAttribute("rAttr", "계백");
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>액션 태그 - forward</title>
</head>
<body>
    <h2>액션태그를 활용한 포워딩</h2>
    <jsp:forward page="ForwadSub.jsp"/>
</body>
</html>
