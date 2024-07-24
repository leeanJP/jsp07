<%@ page import="com.example.jsp.common.Person" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Application 영역</title>
</head>
<body>
    <%--
        웹 애플리케이션당 하나의 applcation 객체 생성
        서버를 닫을 때 까지 유지가 된다.
    --%>

    <%
        Map<String, Person> maps = new HashMap<>();
        maps.put("person1" , new Person("제우스", 20));
        maps.put("person2" , new Person("오너", 20));
        maps.put("person3" , new Person("페이커", 20));
        maps.put("person4" , new Person("구마유시", 20));
        maps.put("person5" , new Person("케리아", 20));

        application.setAttribute("maps", maps);
    %>
    <p> application 영역에 속성이 저장되었습니다.</p>
</body>
</html>
