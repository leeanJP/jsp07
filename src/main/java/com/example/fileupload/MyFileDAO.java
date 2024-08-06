package com.example.fileupload;

import com.example.common.DBConnPool;

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

}
