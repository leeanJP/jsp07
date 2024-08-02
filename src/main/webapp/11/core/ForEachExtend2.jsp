<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="com.example.jsp.common.Person" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL foreach</title>
</head>
<body>

    <h2>List 컬렉션</h2>
    <%
        LinkedList<Person> lists = new LinkedList<>();
        lists.add(new Person("유비", 50));
        lists.add(new Person("관우", 40));
        lists.add(new Person("장비", 30));
    %>

    <c:set var="lists" value="<%=lists%>"/>
    <c:forEach items="${lists}" var="item">
        <li>이름 : ${item.name} , 나이 : ${item.age} </li>
    </c:forEach>

    <h2>Map 컬렉션</h2>
    <%
        Map<String, Person> map = new HashMap<>();
        map.put("1st" , new Person("유비", 50));
        map.put("2nd" , new Person("관우", 40));
        map.put("3rd" , new Person("장비", 30));

    %>
    <c:set var="map" value="<%=map%>"/>
    <c:forEach items="${map}" var="item">
        <li> Key : ${item.key}</li>
        <li> Value : ${item.value.name} , ${item.value.age}</li>
    </c:forEach>


</body>
</html>
