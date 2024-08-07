<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>파일 첨부형 게시판</title>
    <style>
        a{text-decoration: none;}
    </style>
</head>
<body>
<h2>파일 첨부형 게시판 - 목록 보기</h2>
<%--검색 폼--%>
<form method="get">
    <table border="1" width="90%">
        <tr>
            <td align="center">
                <select name="searchField">
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                </select>
                <input type="text" name="searchWord">
                <input type="submit" value="검색">
            </td>
        </tr>
    </table>
</form>

<%--게시물 목록 테이블--%>
<table border="1" width="90%">
    <tr>
        <th width="10%">번호</th>
        <th width="*">제목</th>
        <th width="15%">작성자</th>
        <th width="10%">조회수</th>
        <th width="15%">작성일</th>
        <th width="8%">첨부파일</th>
    </tr>
    <c:choose>
        <c:when test="${empty boardList}">
            <%--게시글이 없을때 --%>
            <tr>
                <td colspan="5" align="cetner">
                    등록된 게시물이 없습니다.
                </td>
            </tr>
        </c:when>
        <c:otherwise>
            <%--게시글이 있을 때--%>
            <c:forEach items="${boardList}" var="row" varStatus="loop">
                <tr align="center">
                    <td>${row.idx}</td>
                    <td align="left">
                        <a href="../mvcboard/view.do?idx=${row.idx}">${row.title}</a>
                    </td>
                    <td>${row.name}</td>
                    <td>${row.visitcount}</td>
                    <td>${row.postdate}</td>
                    <td>
                        <c:if test="${not empty row.ofile}">
                            <a href="../mvcboard/download.do?ofile=${ row.ofile }&sfile=${ row.sfile }&idx=${ row.idx }">
                                [DOWN]
                            </a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</table>
<table border="1" width="90%">
    <tr align="center">
        <td>
            ${map.pagingImg}
        </td>
        <td width="100">
            <button type="button" onclick="location.href='../mvcboard/write.do';">
                글쓰기
            </button>
        </td>
    </tr>
</table>
</body>
</html>
