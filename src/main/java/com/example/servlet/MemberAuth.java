package com.example.servlet;

import com.example.membership.MemberDAO;
import com.example.membership.MemberDTO;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


public class MemberAuth extends HttpServlet {
    MemberDAO dao;

    @Override
    public void init() throws ServletException {
        //어플리케이션 내장객체
        ServletContext app = this.getServletContext();

        //DAO 생성
        dao = new MemberDAO();
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //서블릿 초기화 매개변수 관리자 ID 받기
        String admin_id = this.getInitParameter("admin_id");

        //인증을 요청한 ID/PW 받기
        String id = req.getParameter("id");
        String pass = req.getParameter("pass");

        MemberDTO dto = dao.getMemberDTO(id,pass);

        String memberName = dto.getName();

        if(memberName != null){ //일치하는 회원이 있을때
            req.setAttribute("authMsg" , memberName+ "님 반갑습니다.");
        }else { //일치하는 회원이 없을 때
            if(admin_id.equals(id)){
                req.setAttribute("authMsg" , admin_id+ "는 최고 관리자입니다.");

            }else { //비회원
                req.setAttribute("authMsg" , "비회원 입니다.");

            }
        }
        req.getRequestDispatcher("/12/MemberAuth.jsp").forward(req, resp);
    }

    @Override
    public void destroy() {
        dao.close();
    }
}
