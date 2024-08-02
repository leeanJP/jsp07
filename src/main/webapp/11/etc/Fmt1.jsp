<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL Formatting</title>
</head>
<body>
    <h2>숫자 포맷 설정</h2>
    <c:set var="num1" value="1234500000000"/>
    콤마 o: <fmt:formatNumber value="${num1}"/> <br/>
    콤마 x: <fmt:formatNumber value="${num1}" groupingUsed="false"/><br/>
    <fmt:formatNumber value="${num1}" type="currency" var="printNum1"/>
    통화기호 : ${printNum1}<br/>
    <fmt:formatNumber value="${num1}" type="percent" var="printNum2"/>
    퍼센트 : ${printNum2}<br/>

    <c:set var="num2" value="60,789.01778"/>

    <fmt:parseNumber value="${num2}" pattern="00,000.00" var="printNum3"/>
    소수점까지 : ${printNum3}<br/>
    <c:set var="num1" value="12345.056789" />
    소숫점 1자리 : <fmt:formatNumber type="number"  pattern="0.0" value="${ ((num1*10) - ((num1*10)%1)) * (1/10)   } " />
    소숫점 2자리 : <fmt:formatNumber type="number"  pattern="0.00" value="${ ((num1*100) - ((num1*100)%1)) * (1/100)   } " />

    <fmt:parseNumber value="${num2}" integerOnly="true" var="printNum4"/>
    정수부분만 : ${printNum4} <br/>
</body>
</html>
