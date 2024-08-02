<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - import</title>
</head>
<body>
    <%--
        외부 파일을 현재 위치에 삽입할 때 사용
        외부의 페이지도 삽입할 수 있다.

        기본형식
        <c:import url="페이지 경로" scope="영역"/>
    --%>
    <c:set var="requestVar" scope="request" value="must"/>
    <c:import url="OtherPage.jsp" var="contents">
        <c:param name="user_param1" value="JSP"/>
        <c:param name="user_param2" value="Java"/>
    </c:import>

    ${contents}

    <iframe src="GoldPage.jsp" style="width: 100%; height: 600px;">
        
    </iframe>
</body>
</html>
