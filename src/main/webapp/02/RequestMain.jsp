<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  JSP 내장객체는 기본적인 요청과 응답, 화면 출력 등 필수적인 기능을 가지고 있다.
  내장 객체는 JSP 페이지가 실행될 때 컨테이너가 자동으로 생성 해준다.

  내장 객체 종류
  request     : 클라이언트의 요청 정보를 저장
  response    : 클라이언트의 요청에대한 응답 정보 저장
  out         : JSP 페이지에 출력할 내용을 담는 출력 스트림
  session     : 웹 브라우저 정보를 유지하기 위한 세션정보 저장
  applcation  :                                          
  pageContext :
  page        :
  config      :
  exception   :

내장객체는 컨테이너가 미리 선언해놓은 참조 변수를 이용해 사용
별도의 객체 생성 없이 각 내장 객체의 메서드를 사용할 수 있다.
JSP 문서 안의 스크립틀릿, 표현식에서만 사용 가능
선언부에서는 즉시 사용 불가능 , 매개변수로 전달받아 사용할 수는 있다.
--%>

<%--
    Request 주요기능
    클라이언트와 서버에 대한 정보 읽기
    클라이언트가 전송한 요청 매개변수에 대한 정보 읽기
    요청 헤더 및 쿠키 정보 읽기

    클라이언트와 서버의 환경정보 읽기
--%>
<html>
<head>
    <title>내장객체 - Request</title>
</head>
<body>
    <h2>1. 클라이언트와 서버의 환경정보 읽기</h2>

    <a href="./RequestWebInfo.jsp?eng=Hello&han=안녕">
        Get 방식 전송
    </a>

    <br>
    <form action="RequestWebInfo.jsp" method="post">
        영어 :<input type="text" name="eng" value= "Bye" /> <br/>
        한글 :<input type="text" name="han" value= "바이~" /> <br/>
        <input type="submit" value="POST 방식 전송"/>
    </form>


    <h2>2. 클라이언트의 요청 매개변수 읽기</h2>
    <form method="post" action="RequestParameter.jsp">
        아이디 : <input type="text" name="id" value=""/> <br>
        성별 : <input type="radio" name="sex" value="man"> 남자
        <input type="radio" name="sex" value="woman"> 여자 <br>
        관심사 : <input type="checkbox" name="favo" value="eco">경제
        <input type="checkbox" name="favo" value="pol">정치
        <input type="checkbox" name="favo" value="ent">연예
        <br>
        자기소개 : <textarea name="intro" cols="30" rows="4"></textarea>
        <br>
        <input type="submit" value="전송">
    </form>
    <%--
        HTTP 헤더
        클라이언트와 서버가 요청 또는 응답으로 부가적인 정보를 전송할 수 있게 해주는 것

    --%>
    <h2>3. HTTP 헤더 정보 읽기</h2>
    <a href="RequestHeader.jsp">
        요청 헤더 정보 읽기
    </a>
</body>
</html>

