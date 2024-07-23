<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--선언부 메소드, 변수 선언--%>
<%!
    public int add(int x , int y){
        return x+y;
    }
%>
<html>
<head>
    <title>스크립트 요소 </title>
</head>
<body>
    <%--스크립틀릿 --%>
    <%
        int res = add(1,2);
    %>

    <%-- 표현식 --%>

    덧셈 결과 : <%=res%> <br>
    덧셈 결과 : <%=add(10,20)%> <br>

</body>
</html>
