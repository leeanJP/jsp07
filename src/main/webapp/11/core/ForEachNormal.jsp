<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>일반 for문 형태의 forEach 태그</title>
</head>
<body>
    <h2>일반 for문 형태</h2>

<%--    <%--%>
<%--        for(int i=1; i<=3 ;i++){--%>
<%--        }--%>
<%--    %>--%>
    <c:forEach begin="0" end="3" step="2" var="i">
        <p>반복 ${i}</p>
    </c:forEach>

    <h2>var status 속성 살펴보기</h2>
    <table border="1">
        <c:forEach begin="3" end="5" step="1" varStatus="loop">
            <tr>
                <td>count : ${loop.count}</td>
                <td>index : ${loop.index}</td>
                <td>current : ${loop.current}</td>
                <td>first : ${loop.first}</td>
                <td>last : ${loop.last}</td>
            </tr>
        </c:forEach>
    </table>


    <h2>1에서 100까지 정수 중 홀수 총 합</h2>
    <c:forEach begin="1" end="100" var="j">
        <c:if test="${j % 2 != 0}">
            <c:set var="sum" value="${sum  + j}"/>
        </c:if>
    </c:forEach>
    1~ 100까지 정수 중 홀수 총 합은 ${sum}

</body>
</html>
