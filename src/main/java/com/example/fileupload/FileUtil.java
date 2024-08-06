package com.example.fileupload;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

public class FileUtil {
    /*
    * 1. Part 객체 생성 및 파일 저장
    * 2. 새로운 파일명 생성(업로드 일시.확장자)
    * 3. 파일명 변경
    * 4. 다른 폼값 처리
    * 5. DTO 생성
    * 6. DAO를 통해 데이터 저장
    * 7. 파일 목록 JSP로 리다이렉션
    * */

    public static String uploadFile(HttpServletRequest req , String sDir)
        throws ServletException , IOException {

        //Part 객체를 통해 서버로 전송된 파일명 읽기
        Part part = req.getPart("ofile");
        //Part 객체의 헤더값 content-disposition 값 읽기
        String partHeader = part.getHeader("content-disposition");
        //form-data; name="attachedFile"; filename="파일명.확장자";
        System.out.println("partHeader 확인 : " + partHeader);

        //헤더에서 파일명 잘라내기
        String[] phArr = partHeader.split("filename=");
        String originalFileName = phArr[1].trim().replace("\"" ,"");

        //전송된 파일이 있으면 디렉토리에 저장
        if(!originalFileName.isEmpty()){
            // C://download/filename.확장자
            part.write(sDir + File.separator + originalFileName);
        }


        return originalFileName;
    }

}
