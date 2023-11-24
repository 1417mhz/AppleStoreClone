package com.ysw.applestoreclone.javabean;

import com.ysw.applestoreclone.sensitiveinfo.SensInfoProvider;

import java.sql.*;

public class DBConn {
    public static Connection conn;

    public static Connection getDBConn() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            String dbUrl = SensInfoProvider.getDbUrl();
            String dbUser = SensInfoProvider.getDbUser();
            String dbPw = SensInfoProvider.getDbPw();
            conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);
            return conn;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("MySQL JDBC Driver not found");
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to connect to DB", e);
        }
    }

    public static void dbClose(PreparedStatement pstmt, Connection conn) throws SQLException {
        pstmt.close();
        conn.close();
    }
}
