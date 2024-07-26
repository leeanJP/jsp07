<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 처리</title>
</head>
<body>
    <%
        String user_id = request.getParameter("user_id");
        String user_pw = request.getParameter("user_pw");

        if(user_id.equals("admin") && user_pw.equals("1111")) {
            // 로그인 성공
            session.setAttribute("id", user_id);
            out.println("로그인이 성공했습니다.");
            out.println(user_id + "님 어서오세요.");
        } else {
            // 로그인 실패
            out.println("로그인이 실패했습니다.");
            out.println("아이디와 비밀번호를 확인해주세요.");
        }
    %>
</body>
</html>



