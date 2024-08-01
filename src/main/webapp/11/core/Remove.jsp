<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<%--변수 선언--%>
<c:set var="scopeVar" value="PageValue"/>
<c:set var="scopeVar" value="Req Value" scope="request"/>
<c:set var="scopeVar" value="Session Value" scope="session"/>
<c:set var="scopeVar" value="App Value" scope="application"/>

<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL Remove</title>
</head>
<body>
  <h2>출력</h2>
  <ul>
    <li>scopeVar : ${scopeVar}</li>
    <li>req scopeVar : ${requestScope.scopeVar}</li>
    <li>ses scopeVar : ${sessionScope.scopeVar}</li>
    <li>app scopeVar : ${applicationScope.scopeVar}</li>
  </ul>

  <h2>session 영역에 삭제</h2>
  <c:remove var="scopeVar" scope="session"/>
  <ul>
    <li>scopeVar : ${scopeVar}</li>
    <li>req scopeVar : ${requestScope.scopeVar}</li>
    <li>ses scopeVar : ${sessionScope.scopeVar}</li>
    <li>app scopeVar : ${applicationScope.scopeVar}</li>
  </ul>


  <h2>영역지정없이 삭제</h2>
  <c:remove var="scopeVar"/>
  <ul>
    <li>scopeVar : ${scopeVar}</li>
    <li>req scopeVar : ${requestScope.scopeVar}</li>
    <li>ses scopeVar : ${sessionScope.scopeVar}</li>
    <li>app scopeVar : ${applicationScope.scopeVar}</li>
  </ul>
</body>
</html>
