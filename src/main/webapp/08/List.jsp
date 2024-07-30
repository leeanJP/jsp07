<%@ page import="com.example.board.BoardDAO" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.example.board.BoardDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<%
    //DAO 생성
    BoardDAO dao = new BoardDAO();

    Map<String ,Object> param = new HashMap<>();
    String searchField = request.getParameter("searchField");
    String searchWord = request.getParameter("searchWord");

    if(searchWord != null) {
        param.put("searchField" , searchField);
        param.put("searchWord" , searchWord);
    }

    System.out.println("param 확인 : " + param.get("searchField") + " : " + param.get("searchWord"));

    //게시물 수 확인
    int totalCount = dao.selectCount(param);
    //게시물 목록
    List<BoardDTO> boardList = dao.selectList(param);

    dao.close();



%>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원제 게시판</title>
</head>
<body>
    <jsp:include page="../common/Link.jsp"></jsp:include>
    <h2>목록 보기</h2>
    <%--검색 조건--%>
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
            <th width="10">번호</th>
            <th width="50">제목</th>
            <th width="15">작성자</th>
            <th width="10">조회수</th>
            <th width="15">작성일</th>
        </tr>

        <%-- 게시물이 하나도 없을 때 --%>
        <%
            if(boardList.isEmpty()){

        %>
                <tr>
                    <td colspan="5" align="cetner">
                        등록된 게시물이 없습니다.
                    </td>
                </tr>
        <%
            //게시물이 있을 떄
            } else {
                for(BoardDTO dto : boardList) {

        %>
                <tr align="center">
                    <td><%=dto.getNum()%></td>
                    <td align="left">
                        <a href="View.jsp?num=<%=dto.getNum()%>">
                            <%=dto.getTitle()%>
                        </a>
                    </td>
                    <td><%=dto.getId()%></td>
                    <td><%=dto.getVisitcount()%></td>
                    <td><%=dto.getPostdate()%></td>
                </tr>
        <%
                }
            }
        %>

    </table>

    <table border="1" width="90%">
        <tr align="right">
            <td>
                <button type="button" onclick="location.href='Write.jsp'">
                    글쓰기
                </button>
            </td>
        </tr>
    </table>


</body>
</html>
