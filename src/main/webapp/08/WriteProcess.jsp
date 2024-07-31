<%@ page import="com.example.board.BoardDTO" %>
<%@ page import="com.example.board.BoardDAO" %>
<%@ page import="com.example.util.JSFunction" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<%
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    BoardDTO dto = new BoardDTO();
    dto.setTitle(title);
    dto.setContent(content);
    dto.setId(session.getAttribute("UserId").toString());

    BoardDAO dao = new BoardDAO();
    int res = dao.insertWrite(dto);

    if(res == 1){ //성공
        response.sendRedirect("List.jsp");
    }else { //실패
        JSFunction.alertBack("글쓰기 실패", out);
    }

%>