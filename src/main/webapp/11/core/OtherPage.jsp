<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<h2>OtherPage.jsp</h2>

<ul>
    <li>저장된 값 : ${requestVar}</li>
    <li>매개변수 1 : ${param.user_param1}</li>
    <li>매개변수 2 : ${param.user_param2}</li>
</ul>