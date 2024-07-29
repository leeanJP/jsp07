<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>액션 태그 param forward</title>
</head>
<body>
<jsp:useBean id="person" class="com.example.jsp.common.Person" scope="request"/>

<ul>
    <li><jsp:getProperty name="person" property="name"/></li>
    <li><jsp:getProperty name="person" property="age"/></li>
    <li><%=request.getParameter("param1")%></li>
    <li><%=request.getParameter("param2")%></li>
    <li><%=request.getParameter("param3")%></li>
</ul>

<jsp:include page="ParamInclude.jsp">
    <jsp:param name="p1" value="파람1"/>
    <jsp:param name="p2" value="파람2"/>

</jsp:include>



</body>
</html>
