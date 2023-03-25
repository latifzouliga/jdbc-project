package com.cydeo.jdbctests.liveSession;

import com.cydeo.jdbctests.utility.DB_Util;
import org.junit.jupiter.api.Test;

public class P02_DBUtilPractices {

    @Test
    public void dbUtil() {


        // CREATE CONN
        DB_Util.createConnection();

        // EXECUTE QUERY
        DB_Util.runQuery("select country_id,city from locations");


        System.out.println("GET ME ROW COUNT ");
        System.out.println(DB_Util.getRowCount());

        System.out.println("GET ME COLUMN COUNT ");


        System.out.println("GET ALL COLUMN NAME AS LIST");


        System.out.println("GET ROW DATA AS LIST");


        System.out.println("GET CELL VALUE --> int rowNum , int columnIndex");


        System.out.println("GET CELL VALUE --> int rowNum ,String columnName");


        System.out.println("GET FIRST ROW FIRST COLUMN VALUE");


        System.out.println("GET COLUMN DATA AS LIST--> int columnNum");


        System.out.println("GET COLUMN DATA AS LIST--> String columnName");


        System.out.println("GET ROW MAP");


        System.out.println("GET ALL ROW AS LIST OF MAP");


        // CLOSE CONN
        DB_Util.destroy();
    }
}
