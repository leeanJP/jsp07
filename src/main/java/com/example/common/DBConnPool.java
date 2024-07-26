package com.example.common;

import javax.naming.Context;
import javax.naming.InitialContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBConnPool {

    public Connection conn;
    public Statement stmt;
    public PreparedStatement psmt;
    public ResultSet rs;


    public DBConnPool() {
        try{
            //커넥션 풀 얻기
            Context initCtx = new InitialContext();
            //JNDI 에서 이름과 실제 객체를 연결해주는 역할
            Context ctx = (Context) initCtx.lookup("java:comp/env");


        }catch(Exception e){

        }
    }


}
