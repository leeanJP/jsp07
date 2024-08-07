package com.example.mvcboard;

import com.example.board.BoardDTO;
import com.example.common.DBConnPool;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class MVCBoardDAO extends DBConnPool {

    public MVCBoardDAO() {
        super();
    }


    //검색 조건에 맞는 게시물 개수 반환
    public int selectCount(Map<String, Object> map){
        int totalCount = 0;
        String query = "SELECT count(*) FROM scott.mvcboard";
        if(map.get("searchWord") != null){
            query += " WHERE " + map.get("searchField") + " ";
            query += " LIKE '%" + map.get("searchWord") + "%'";
        }

        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
            rs.next();
            totalCount = rs.getInt(1);
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("MVC BOARD selectCount 에서 오류발생");
        }
        return totalCount;
    }

    //검색 조건에 맞는 게시물 목록 반환 (페이징 기능 O)
    public List<MVCBoardDTO> selectListPage(Map<String, Object> map){
        List<MVCBoardDTO> boardList = new ArrayList<>();

        String query = "SELECT * "
                + " FROM (SELECT tb.*, rownum rNum"
                + " FROM (SELECT *"
                + " FROM mvcboard";
        if(map.get("searchWord") != null){
            query += " WHERE " + map.get("searchField") + " ";
            query += " LIKE '%" + map.get("searchWord") + "%'";
        }
        query += " ORDER BY idx desc"
                + " ) tb"
                + " ) "
                + "WHERE rNum BETWEEN ? AND ?";
        try {
            psmt = conn.prepareStatement(query);
            psmt.setString(1, map.get("start").toString());
            psmt.setString(2, map.get("end").toString());


            rs = psmt.executeQuery();

            while (rs.next()){
                //한 row 의 내용을 DTO에 저장
                MVCBoardDTO dto = new MVCBoardDTO();
                dto.setIdx(rs.getString("idx"));
                dto.setName(rs.getString("name"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setOfile(rs.getString("ofile"));
                dto.setSfile(rs.getString("sfile"));
                dto.setDowncount(rs.getInt("downcount"));
                dto.setPass(rs.getString("pass"));
                dto.setVisitcount(rs.getInt("visitcount"));
                boardList.add(dto);
            }

        }catch (Exception e){
            e.printStackTrace();
            System.out.println("mvcboard selectListPage 오류 발생");
        }

        return boardList;
    }

    //게시글 작성
    public int insertWrite(MVCBoardDTO dto) {
        int result = 0;

        try {
            String query ="INSERT INTO scott.mvcboard ( "
                    + " idx, name,title, content, ofile,sfile, pass) "
                    + " VALUES ( "
                    + " scott.seq_board_num.nextval, ?,?,?,?,?,?)";

            psmt = conn.prepareStatement(query);
            psmt.setString(1, dto.getName());
            psmt.setString(2, dto.getTitle());
            psmt.setString(3, dto.getContent());
            psmt.setString(4, dto.getOfile());
            psmt.setString(5, dto.getSfile());
            psmt.setString(6, dto.getPass());

            result = psmt.executeUpdate();

        }catch (Exception e){
            e.printStackTrace();
            System.out.println("mvcboard insertWrite 오류 발생");
        }

        return result;
    }

}
