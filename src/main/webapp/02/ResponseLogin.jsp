<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("user_id");
    String pwd = request.getParameter("user_pwd");


    if(id.equalsIgnoreCase("must") && pwd.equals("1234")){
        response.sendRedirect("ResponseWelcome.jsp");
    }else {
        request.getRequestDispatcher("ResponseMain.jsp?loginErr=1")
                .forward(request, response);
        //forward 는 페이지 이동과는 다르게
        //제어 흐름을 넘겨주고자 할 때 사용한다.
    }
%>