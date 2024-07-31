<%@ page import="com.example.board.BoardDTO" %>
<%@ page import="com.example.board.BoardDAO" %>
<%@ page import="com.example.util.JSFunction" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<%@ include file="IsLoggedIn.jsp"%>
<%
    String num = request.getParameter("num");
    BoardDTO dto = new BoardDTO();
    BoardDAO dao = new BoardDAO();

    dto = dao.selectView(num);

    //세션 로그인 ID
    String sessionId = session.getAttribute("UserId").toString();
    int delResult = 0;

    if(sessionId.equals(dto.getId())){
        //같을 때에만 삭제 해준다
        dto.setNum(num);
        //DAO 호출해서 삭제
        delResult = dao.deletePost(dto);
        dao.close();

        if(delResult == 1){
            JSFunction.alertLocation("삭제 되었습니다.", "List.jsp", out);
        }else {
            JSFunction.alertBack("삭제 실패", out);
        }


    }else{
        //작성자 본인이 아니면 삭제 안됨
        JSFunction.alertBack("작성자 본인만 삭제 가능합니다.", out);
    }

%>