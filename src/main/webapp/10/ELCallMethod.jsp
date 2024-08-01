<%@ page import="com.example.el.MyElClass" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<%@taglib prefix="mytag" uri="/WEB-INF/MyTagLib.tld" %>

<%
  /*EL은 영역에 저장된 값을 가져오는 기법*/
  MyElClass myClass = new MyElClass();
  pageContext.setAttribute("myClass" , myClass);
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>EL - 메소드 호출</title>
</head>
<body>
  <h2>영역에 저장 후 메소드 호출</h2>
  001225-3123456 => ${myClass.getGender("001225-3123456")}<br/>
  001225-4123456 => ${myClass.getGender("001225-4123456")}<br/>

  <h2>클래스명을 통해 정적 메소드 호출</h2>
  ${MyElClass.showGugudan(9)}

  <h2>TLD 파일을 사용해 정적 메소드 호출</h2>
  <ul>
    <li>mytag:isNumber("100") = > ${mytag:isNumber("100")}</li>
    <li>mytag:isNumber("이백") = > ${mytag:isNumber("이백")}</li>
  </ul>

</body>
</html>
