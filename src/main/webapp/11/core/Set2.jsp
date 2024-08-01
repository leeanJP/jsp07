<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.jsp.common.Person" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL set Collection</title>
</head>
<body>
  <h2>List 컬렉션</h2>
  <%
    ArrayList<Person> pList = new ArrayList<>();
    pList.add(new Person("유비", 50));
    pList.add(new Person("관우", 40));
  %>
  <c:set var="personList" value="<%=pList%>" scope="request"/>
  <ul>
    <li>이름 : ${requestScope.personList[0].name}</li>
    <li>나이 : ${personList[1].age}</li>
  </ul>

  <h2>Map 컬렉션</h2>
  <%
    Map<String , Person> pMap = new HashMap<>();
    pMap.put("personArg1" , new Person("여포" , 30));
    pMap.put("personArg2" , new Person("동탁" , 60));
  %>
  <c:set var="personMap" value="<%=pMap%>" scope="request"/>
  <ul>
    <li>이름 : ${requestScope.personMap.personArg1.name}</li>
    <li>나이 : ${personMap.personArg2.age}</li>
  </ul>

</body>
</html>
