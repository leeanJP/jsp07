<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<%
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");
    String area = request.getParameter("area");
    String gender = request.getParameter("gender");
    String tel_cop = request.getParameter("tel_cop");

    out.println("아이디 - " + id + "<br>");
    out.println("비밀번호 - " + pw + "<br>");
    out.println("이름 - " + name + "<br>");
    out.println("전화번호 - " + phone + "<br>");
    out.println("이메일 - " + email + "<br>");
    out.println("사는 지역 - " + area + "<br>");
    out.println("성별 - " + gender + "<br>");
    out.println("통신사 - " + tel_cop);
%>