<%@ page import="java.util.Date" %>
<%@ page import="com.example.jsp.common.Person" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL Core Set</title>
    <%--
        <c:set> 태그는 EL에서 사용할 변수나 자바빈즈를 생성할 때 사용
    --%>
</head>
<body>
    <%--변수 선언--%>
    <c:set var="directVar" value="100"/>
    <c:set var="elVar" value="${directVar %5}"/>
    <c:set var="expVar" value="<%=new Date()%>"/>
    <c:set var="betweenVar">변수값 설정</c:set>

    <h2>EL을 이용해 변수 출력</h2>
    <ul>
        <li>directVar : ${pageScope.directVar}</li>
        <li>elVar : ${pageScope.elVar}</li>
        <li>expVar : ${pageScope.expVar}</li>
        <li>betweenVar : ${pageScope.betweenVar}</li>
    </ul>

    <h2>자바빈즈 생성 - 1 생성자 사용</h2>
    <c:set var="personVar1" value='<%=new Person("홍길동", 100)%>' scope="request"/>
    <ul>
        <li>이름 : ${requestScope.personVar1.name}</li>
        <li>나이 : ${personVar1.age}</li>

    </ul>

    <h2>자바빈즈 생성 - 2 target property 사용</h2>
    <c:set var="personVar2" value="<%=new Person()%>" scope="request"/>
    <c:set target="${personVar2}" property="name" value="이순신"/>
    <c:set target="${personVar2}" property="age" value="60"/>

    <ul>
        <li>이름 : ${requestScope.personVar2.name}</li>
        <li>나이 : ${personVar2.age}</li>

    </ul>

</body>
</html>
