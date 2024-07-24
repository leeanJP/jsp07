<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Collection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
    pageEncoding="UTF-8"
%>
<%
    //응답헤더 정보 추가용 메소드
    // add : 새로 추가  set: 기존값 수정할 때

    //응답헤더에 추가할 값
    SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    long add_date = sd.parse(request.getParameter("add_date")).getTime();
    int add_int = Integer.parseInt(request.getParameter("add_int"));
    String add_str = request.getParameter("add_str");

    //응답 헤더에 값 추가
    response.addDateHeader("today", add_date);
    response.addIntHeader("myNum", add_int);
    response.addIntHeader("myNum", 1000);
    response.addIntHeader("myNum", 2000);
    response.addIntHeader("myNum", 3000);
    response.addHeader("myName" , add_str);
    response.setHeader("myName" , "안중근");

%>

<html>
<head>
    <title>내장 객체 - Response</title>
</head>
<body>
    <h2>응답 헤더 출력하기</h2>

    <%
        Collection<String> headerNames = response.getHeaderNames();

        for(String hName : headerNames) {

            String hValue = response.getHeader(hName);

    %>
            <li> <%=hName%> : <%=hValue%></li>
    <%
        }
    %>


    <h2>myNum만 출력하기</h2>
    <%
        Collection<String> myNum = response.getHeaders("myNum");
        for(String num : myNum) {

    %>
        <li> myNum : <%=num%></li>
    <%

        }
    %>


</body>
</html>
