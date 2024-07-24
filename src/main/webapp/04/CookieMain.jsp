<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
    <h2>1. 쿠키 설정</h2>
    <%
        Cookie cookie = new Cookie("myCookie", "내가만든쿠키~");
        cookie.setPath(request.getContextPath()); //최상위경로 설정
        cookie.setMaxAge(3600); //1시간
        response.addCookie(cookie);

    %>

    <h2>2. 쿠키 설정 직후에 쿠키 확인</h2>
    <%
        Cookie[] cookies = request.getCookies(); //request 헤더에서 모든 쿠키 가져오기

        if(cookies != null){
            for(Cookie c : cookies){
                String cName = c.getName();
                String cValue = c.getValue();

                out.print(String.format("%s : %s " , cName, cValue));

            }

        }
    %>


</body>
</html>
