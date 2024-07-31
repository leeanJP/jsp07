<%@ page import="com.example.board.BoardDTO" %>
<%@ page import="com.example.board.BoardDAO" %>
<%@ page import="com.example.JSFunction" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<%
    String num = request.getParameter("num");
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    BoardDTO dto = new BoardDTO();
    dto.setTitle(title);
    dto.setContent(content);
    dto.setNum(num);

    BoardDAO dao = new BoardDAO();
    int affected = dao.updateEdit(dto);

    dao.close();

    if(affected == 1){ //성공
        response.sendRedirect("View.jsp?num="+dto.getNum());
    }else { //실패
        JSFunction.alertBack("수정 실패", out);
    }


%>