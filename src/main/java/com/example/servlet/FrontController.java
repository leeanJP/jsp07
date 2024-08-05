package com.example.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("*.one")
public class FrontController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();
        int lastSlash = uri.lastIndexOf('/');
        String commandStr = uri.substring(lastSlash);

        if(commandStr.equals("/regist.one")){
            registFun(req);
        }else if(commandStr.equals("/login.one")){
            loginFun(req);
        }else if(commandStr.equals("/freeboard.one")){
            freeboardFun(req);
        }
        req.setAttribute("uri", uri);
        req.setAttribute("commandStr", commandStr);
        req.getRequestDispatcher("/12/FrontController.jsp").forward(req, resp);

    }

    //페이지별 처리 메소드

    void registFun (HttpServletRequest req){
        req.setAttribute("resultValue" , "<h4>회원가입</h4>");
    }
    void loginFun (HttpServletRequest req){
        req.setAttribute("resultValue" , "<h4>로그인</h4>");
    }

    void freeboardFun (HttpServletRequest req){
        req.setAttribute("resultValue" , "<h4>자유게시판</h4>");
    }


}
