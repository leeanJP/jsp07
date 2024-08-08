package com.example.mvcboard;

import com.example.fileupload.FileUtil;
import com.example.util.JSFunction;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/mvcboard/edit.do")
@MultipartConfig(
        maxFileSize = 1024 * 1024 * 5,    //5MB
        maxRequestSize = 1024 * 1024 * 50  //50MB
)
public class EditController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idx= req.getParameter("idx");
        MVCBoardDAO dao = new MVCBoardDAO();
        MVCBoardDTO dto = dao.selectView(idx);

        req.setAttribute("dto",dto);
        req.getRequestDispatcher("/14/Edit.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //파일 업로드 처리
        String sDir = req.getServletContext().getRealPath("/upload");

        String oFileName = "";
        System.out.println("getParameter" + req.getParameter("ofile"));
        if(req.getParameter("ofile") !=null){
            try {
                oFileName = FileUtil.uploadFile(req,sDir);
            }catch (Exception e){
                e.printStackTrace();
                JSFunction.alertBack(resp, "파일 업로드 오류");
            }
        }


        //DB에 update 입력
        System.out.println("req 파라메터 확인");
        System.out.println("**********");
        System.out.println(req.getParameter("idx"));
        System.out.println(req.getParameter("name"));
        System.out.println(req.getParameter("title"));
        String idx = req.getParameter("idx");
        String prevOfile = req.getParameter("prevOfile");
        String prevSfile = req.getParameter("prevSfile");
        String name = req.getParameter("name");
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        HttpSession session = req.getSession();
        String pass = (String)session.getAttribute("pass");
        System.out.println("세션에서 받아온 pass : " + pass);

        MVCBoardDTO dto = new MVCBoardDTO();
        dto.setIdx(idx);
        dto.setTitle(title);
        dto.setContent(content);
        dto.setName(name);
        dto.setPass(pass);

        //원본 파일명과 저장된 파일명 이름 설정
        if(oFileName != ""){ //신규로 파일 등록 한 경우
            String sFileName = FileUtil.renameFile(sDir, oFileName);
            dto.setOfile(oFileName);
            dto.setSfile(sFileName);

            FileUtil.deleteFile(req,"/upload", prevSfile);

        }else { //첨부파일이 없는 경우 - 기존 파일 유지
            dto.setSfile(prevSfile);
            dto.setOfile(prevOfile);

        }
        MVCBoardDAO dao =new MVCBoardDAO();
        int result = dao.updatePost(dto);
        System.out.println("EditCont result" + result);
        dao.close();

        if(result == 1){
            session.removeAttribute("pass");
            resp.sendRedirect("../mvcboard/view.do?idx="+idx);
        }else{
            JSFunction.alertLocation(resp, "비밀번호 검증을 다시 진행해주세요"
            ,"../mvcboard/view.do?idx"+idx);
        }


    }
}
