package com.cydeo.jdbctests.liveSession;

import org.junit.jupiter.api.Test;

import java.sql.*;


public class P01_JDBCPractice {

    String dbUrl="jdbc:oracle:thin:@54.237.226.155:1521:XE";
    String dbPassword="hr";
    String dbUsername="hr";

    @Test
    public void jdbcPractice() throws SQLException {

        /*
             How to init variable
             WIN --> ALT+ENTER
             MAC --> OPT+ENTER
         */

        // Driver Manager class wil help us to create conn with provided databases connection String
        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

        // It will create Statement Object to execute queries
        Statement stmnt= conn.createStatement();

        // It will store all data that we are getting after execution
        ResultSet rs = stmnt.executeQuery("select COUNTRY_ID,CITY from locations");

        /*
            RETRIEVING DATA
        */



        rs.close();

        stmnt.close();

        conn.close();










    }
}