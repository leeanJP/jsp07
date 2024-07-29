package com.example.membership;

import com.example.common.DBConnPool;

public class MemberDAO extends DBConnPool {

    //설정한 데이터베이스로 연결이 완료된 MemberDAO 객체를 생성
    public MemberDAO() {
        super();
    }

    //받아온 파라미터로 아이디 / 패스워드 일치하는 회원정보 반환
    public MemberDTO getMemberDTO(String uid , String upass){
        MemberDTO dto = new MemberDTO();
        String sql = "SELECT id, pass, name, regidate FROM scott.member " +
                " WHERE id =? AND pass =? ";

        //selet id, pass, name, regidate FROM scott.member WHERE id =? AND pass =?
        try {
            psmt = conn.prepareStatement(sql);
            psmt.setString(1, uid);
            psmt.setString(2, upass);
            rs = psmt.executeQuery();

            while (rs.next()){
                dto.setId(rs.getString("id"));
                dto.setPass(rs.getString("pass"));
                dto.setName(rs.getString("name"));
                dto.setRegidate(rs.getString("regidate"));
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return dto;
    }

    

}
