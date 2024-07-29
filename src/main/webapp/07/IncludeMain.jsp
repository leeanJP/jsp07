<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<%
  //포함될 파일 경로
  String outerPath1 = "./OuterPage1.jsp";
  String outerPath2 = "./OuterPage2.jsp";
  
  //page 영역과 request 영역에 속성 저장
  pageContext.setAttribute("pAttr", "동명왕");
  request.setAttribute("rAttr", "온조왕");
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>지시어와 액션태그 동작 방식 비교</title>
</head>
<body>
    <h2>지시어와 액션태그 동작 방식 비교</h2>
    <%--지시어 방식--%>
    <h3>지시어로 페이지 포함하기</h3>
    <%@include file="OuterPage1.jsp"%>
    <%--include 지시어에서는 표현식 사용 X--%>
    <%--<%@include file="<%=outerPath1%>"%>--%>
    <p>외부 파일에서 선언한 변수 <%=newVar1%></p>


    <%-- 액션 태그 방식 --%>
    <h3>액션 태그로 페이지 포함하기</h3>
    <jsp:include page="OuterPage2.jsp"/>
    <jsp:include page="<%=outerPath2%>"/>
    <%--외부 파일에서 선언한 변수는 못가져온다.--%>
    <%--<p>외부 파일에서 선언한 변수 <%=newVar2%></p>--%>

</body>
</html>
