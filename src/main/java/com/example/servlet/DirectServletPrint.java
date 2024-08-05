package com.example.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

public class DirectServletPrint extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //response 내장객체에 응답 콘텐츠 타입을 text 형식으로 지정
        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter writer = resp.getWriter();

        writer.println("<html><head>");

        writer.println("<title>Dircet Servlet Print</title>");
        writer.println("</head>");
        writer.println("<body>");
        writer.println("<h2>서블릿에서 직접 출력 </h2>");
        writer.println("<p>jsp 포워드 아님");
        writer.println("</body>");
        writer.println("</html>");
    }
}
