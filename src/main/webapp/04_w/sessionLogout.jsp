<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<%
  // 세션 삭제
  session.removeAttribute("id");

  // 다시 로그인 페이지로 이동
  response.sendRedirect("sessionLogin2.jsp");
%>
