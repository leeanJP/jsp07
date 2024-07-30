package com.example.board;

import com.example.common.DBConnPool;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class BoardDAO extends DBConnPool {

    public BoardDAO() {
        super();
    }

    //검색 조건에 맞는 게시물 개수 반환
    public int selectCount(Map<String, Object> map){
        int totalCount = 0;

        String query = "SELECT count(*) FROM scott.board";
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
            System.out.println("selectCount 에서 오류발생");
        }
        return totalCount;
    }

    //게시물 목록 가져오기
    public List<BoardDTO> selectList(Map<String, Object>map){
        //쿼리 결과를 담을 변수
        List<BoardDTO> boardList = new ArrayList<>();

        //쿼리문 작성

        String query = "SELECT num, title, content, id, postdate, visitcount" +
                " FROM scott.board";
        if(map.get("searchWord") != null){
            query += " WHERE " + map.get("searchField") + " ";
            query += " LIKE '%" + map.get("searchWord") + "%'";
        }
        query += " ORDER BY num desc";


        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
            while (rs.next()){
                //한 row 의 내용을 DTO에 저장
                BoardDTO dto = new BoardDTO();
                dto.setNum(rs.getString("num"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setId(rs.getString("id"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setVisitcount(rs.getString("visitcount"));
                boardList.add(dto);
            }
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("selectList 오류 발생");
        }

        return boardList;
    }



    //게시글 작성
    public int insertWrite(BoardDTO dto){
        int result = 0;

        try {
            String query ="INSERT INTO scott.board ( "
                    + " num, title, content, id, visitcount) "
                    + " VALUES ( "
                    + " scott.seq_board_num.nextval, ?,?,?,0)";

            psmt = conn.prepareStatement(query);
            psmt.setString(1, dto.getTitle());
            psmt.setString(2, dto.getContent());
            psmt.setString(3, dto.getId());

            result = psmt.executeUpdate();

        }catch (Exception e){
            e.printStackTrace();
            System.out.println("insertWrite 오류 발생");
        }

        return result;
    }

}
