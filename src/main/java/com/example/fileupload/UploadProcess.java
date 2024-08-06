package com.example.fileupload;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/13/UploadProcess.do")
@MultipartConfig (
        maxFileSize = 1024 * 1024 * 1,    //1MB
        maxRequestSize = 1024 * 1024 * 10  //10MB
)
public class UploadProcess extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            //드라이브 명으로 절대경로 지정하기
            String saveDirectory = getServletContext().getRealPath("/upload");
            System.out.println("servlet Context : " + getServletContext());


            //파일 업로드
            String originalFileName = FileUtil.uploadFile(req,saveDirectory);

        }catch (Exception e){
            e.printStackTrace();
            req.setAttribute("errMessage" , "파일 업로드 오류");
            req.getRequestDispatcher("FlieUploadMain.jsp").forward(req,resp);
        }
    }
}
