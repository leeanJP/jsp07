<%@ page import="com.example.JSFunction" %>
<%@ page import="com.example.CookieManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<%
  // 폼 값 읽기
  String user_id = request.getParameter("user_id");
  String user_pw = request.getParameter("user_pw");
  String save_check = request.getParameter("save_check");

  // 사용자 인증
  //  id - test / pw - 1234
  if(user_id.equals("test") && user_pw.equals("1234")) {
    // [아이디 저장하기] checkbox 체크되었는지 확인 해서
    // 체크가 된 경우 쿠키 생성
    if(save_check != null && save_check.equals("Y")) {
      // 쿠키 생성 시 유지 시간은 24시간(86400초)
      CookieManager.makeCookie(response, "loginId", user_id, 86400);
      CookieManager.makeCookie(response, "loginPw", user_pw, 86400);
    } else {
      // 체크가 되지 않은 경우 쿠키 삭제
      CookieManager.deleteCookie(response, "loginId");
      CookieManager.deleteCookie(response, "loginPw");
    }

    // 로그인 성공
    JSFunction.alertLocation("로그인에 성공했습니다.", "idSuccessLogin.jsp", out);
  } else {
    // 로그인 실패
    JSFunction.alertBack("로그인에 실패했습니다.", out);
  }



%>
