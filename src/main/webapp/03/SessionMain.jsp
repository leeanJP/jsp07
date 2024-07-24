<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Session 영역</title>

    <%
        ArrayList<String> lists = new ArrayList<>();
        lists.add("리스트");
        lists.add("collection");

        session.setAttribute("lists" ,lists);
    %>
</head>
<body>
    <%--
        세션은 클라이언트가 서버에 접속해 있는 상태 혹은 단위를 뜻한다.
        세션 객체는 클라이언트가 브라우저를 닫을 때 까지 공유 가능
    --%>

    <h2>페이지 이동 후 페이지 이동 후 세션 영역의 속성 값 읽기
        리스트
        collectionsession 영역의 속성 읽기</h2>
    <a href="sessionLocation.jsp">페이지 이동</a>



</body>
</html>
