package com.example.fileupload;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/13/MultipleProcess.do")
@MultipartConfig(
        maxFileSize = 1024 * 1024 * 5,    //5MB
        maxRequestSize = 1024 * 1024 * 50  //50MB
)
public class MultipleProcess extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            //드라이브 명으로 절대경로 지정하기
            String saveDirectory = getServletContext().getRealPath("/upload");
            System.out.println("저장경로 확인: " + saveDirectory);

            //다중 파일 업로드
            ArrayList<String> listFileName = FileUtil.multipleFile(req, saveDirectory);

            for( String originalFileName : listFileName){
                //저장된 파일명 변경
                String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);

                //DB 저장
                insertFile(req, originalFileName, savedFileName);
            }

            resp.sendRedirect("FileList.jsp");


        }catch  (Exception e){
            e.printStackTrace();
            req.setAttribute("errMessage" , "멀티파일 업로드 오류");
            req.getRequestDispatcher("MultipleUploadMain.jsp").forward(req,resp);
        }
    }


    private void insertFile(HttpServletRequest req , String ofileName , String sfileName){
        //파일 이외의 폼 값
        String title = req.getParameter("title");

        String[] cateArr = req.getParameterValues("cate");
        StringBuffer cateBuf = new StringBuffer();
        int index = 0;

        if(cateArr == null){
            cateBuf.append("선택한 항목 없음");
        }else {
            //사진, 음원
            for(String s : cateArr){
                if(index != cateArr.length -1){
                    cateBuf.append(s + ", ");

                }else {
                    cateBuf.append(s);
                }
                index++;
            }
        }


        //DB 입력 하기
        MyFileDTO dto = new MyFileDTO();
        dto.setTitle(title);
        dto.setCate(cateBuf.toString());
        dto.setOfile(ofileName);
        dto.setSfile(sfileName);

        //DAO를 통해 DB 반영
        MyFileDAO dao = new MyFileDAO();
        dao.insertFile(dto);
        dao.close();
    }
}