<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>액션 태그  - UseBean</title>
    <%--
        자바빈즈 규약
        - 기본 패키지 이외의 패키지에 속해야한다
        - 멤버변수는 private 선언
        - 기본 생성자 필요
        - Getter / Setter 메소드가 있어야한다.
        - Getter / Setter 메소드는 public으로 선언
    --%>
</head>
<body>
    <h2>액션태그 UseBean</h2>
    <h3>자바빈즈 생성하기</h3>
    <jsp:useBean id="person" class="com.example.jsp.common.Person" scope="request"/>
    <%--
        useBean 내부 동작
        Person person = (Person)request.getAttribute("person");
        if(person == null){
            person = new Person();
            request.setAttribute("person");
        }
    --%>
    <h3>setProperty 로 자바빈즈 속성 지정하기</h3>
    <jsp:setProperty name="person" property="name" value="홍길동"/>
    <jsp:setProperty name="person" property="age" value="100"/>
    <%--
        person.setName("홍길동");
    --%>
    <h3>getProperty 로 자바빈즈 속성 가져오기</h3>
    <li>이름 : <jsp:getProperty name="person" property="name"/></li>
    <li>나이 : <jsp:getProperty name="person" property="age"/></li>


</body>
</html>
