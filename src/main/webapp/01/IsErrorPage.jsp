<%@ page contentType="text/html;charset=UTF-8" language="java"
    isErrorPage="true"
%>

<html>
<head>
    <title>errorPage , isErrorPage 속성</title>
</head>
<body>
    <h2> 서비스 중 일시적 오류가 발생했씁니다.</h2>

    <p>
        오류명 : <%= exception.getClass().getName()%>
        <br/>
        오류 메세지 : <%= exception.getMessage()%>
    </p>
</body>
</html>
