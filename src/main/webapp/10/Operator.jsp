<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<%
    int intVal;

    pageContext.setAttribute("nullStr", null);
    pageContext.setAttribute("emptyStr", "");
    pageContext.setAttribute("lengthZero", new Integer[0]);
    pageContext.setAttribute("sizeZero", new ArrayList<Object>());

    pageContext.setAttribute("num1" , 9);
    pageContext.setAttribute("num2" , 10);
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>EL - 연산자</title>
</head>
<body>
    <h2>할당 연산자</h2>
    <ul>
        <li>할당과 동시 출력 : ${intVal = 10}</li>
        <li>할당만 하고 출력 X : ${intVal = 20;''}</li>
    </ul>

    <%--empty 연산자
        값이 없을 때 true 반환하는 연산자
        null, 빈문자열, 길이가 0인 배열, size 0 컬렉션
    --%>
    empty nullStr : ${empty nullStr} <br/>
    empty emptyStr : ${empty emptyStr} <br/>
    empty lengthZero : ${empty lengthZero} <br/>
    empty sizeZero : ${empty sizeZero} <br/>

    <h2>삼항 연산자</h2>
    num > num2 ? 참 : 거짓 => ${num1 > num2 ? "num1 크다" : "num2가 크다"}

    <h2>null 연산</h2>
    null + 10 : ${null + 10} <br/>
    nullStr + 20 : ${null + 20}<br/>
    param.noVal > 10 : ${param.noVal > 10}
</body>
</html>
