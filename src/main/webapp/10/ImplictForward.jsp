<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>EL - 내장객체</title>
</head>
<body>
  <h3>각 영역에 저장된 속성 읽기</h3>
  <ul>
    <li>페이지 영역 : ${pageScope.scopeValue}</li>
    <li>리퀘스트 영역 : ${requestScope.scopeValue}</li>
    <li>세션 영역 : ${sessionScope.scopeValue}</li>
    <li>애플리케이션 영역 : ${applicationScope.scopeValue}</li>
  </ul>

  <ul>
    <li>${scopeValue}</li>
  </ul>
</body>
</html>
