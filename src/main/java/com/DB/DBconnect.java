package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnect {
    private static Connection conn;

    public static Connection getConn() throws ClassNotFoundException, SQLException {
        if (conn == null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(
                		"jdbc:mysql://localhost:3306/ebook-app?allowPublicKeyRetrieval=true&useSSL=false",
                	    "root",
                	    "vikas@2005"
                );
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return conn;
    }
}
