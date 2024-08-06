package com.example.fileupload;

import com.example.common.DBConnPool;

import java.util.ArrayList;
import java.util.List;

public class MyFileDAO extends DBConnPool {

    //파일 업로드
    public int insertFile(MyFileDTO dto) {
        int applyResult = 0;

        try {
            String query = "INSERT INTO scott.myfile "
                    + " (idx, title, cate, ofile, sfile)"
                    + " VALUES(scott.seq_board_num.nextval, ?,?,?,?)";
            psmt = conn.prepareStatement(query);
            psmt.setString(1, dto.getTitle());
            psmt.setString(2, dto.getCate());
            psmt.setString(3, dto.getOfile());
            psmt.setString(4, dto.getSfile());

            applyResult = psmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("insertFile 오류 발생");
        }

        return applyResult;
    }

    //파일 목록 반환
    public List<MyFileDTO> myFileList(){
        List<MyFileDTO> fileList = new ArrayList<>();

        String query ="SELECT * FROM scott.myfile ORDER BY idx DESC";

        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()){
                MyFileDTO dto = new MyFileDTO();
                dto.setIdx(rs.getString("idx"));
                dto.setTitle(rs.getString("title"));
                dto.setCate(rs.getString("cate"));
                dto.setOfile(rs.getString("ofile"));
                dto.setSfile(rs.getString("sfile"));
                dto.setPostdate(rs.getString("postdate"));

                fileList.add(dto);
            }
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("myFileList 오류 발생");
        }


        return fileList;
    }


}
