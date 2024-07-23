<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>errorPage , isErrorPage 속성</title>
</head>
<body>
<%

    try {
        int myAge = Integer.parseInt(request.getParameter("age")) +10;
        out.println("10년 후 내 나이는 " + myAge + "입니다.");

    }catch (Exception e){
        out.println("예외발생 :  매개변수 age가 null입니다.");
        
    }

%>
</body>
</html>
