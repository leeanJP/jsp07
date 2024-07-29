<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>액션 태그 useBean</title>
</head>
<body>
    <jsp:useBean id="person" class="com.example.jsp.common.Person"/>
    <%--와일드 카드로 폼값 한번에 설정하기--%>
    <jsp:setProperty name="person" property="*"/>

    <h3>getProperty 로 자바빈즈 속성 가져오기</h3>
    <ul>
        <li>이름 : <jsp:getProperty name="person" property="name"/></li>
        <li>나이 : <jsp:getProperty name="person" property="age"/></li>
    </ul>
</body>
</html>
