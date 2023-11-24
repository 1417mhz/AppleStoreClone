package com.ysw.applestoreclone.service;

import com.ysw.applestoreclone.javabean.DBConn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserService {
    // 해당 소셜 로그인 ID를 가진 사용자가 있는지 확인. (소셜 로그인 검증을 위함)
    public String findUserBySocialId(String socialId) {
        try (Connection conn = DBConn.getDBConn()) {
            String query = "SELECT user_id FROM user WHERE social_id = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setString(1, socialId);
                ResultSet rs = pstmt.executeQuery();
                // ResultSet에 데이터가 담겨있는지 확인하고 리턴을 수행한다
                if (rs.next()) {
                    String userId = rs.getString("user_id");
                    rs.close();
                    return userId;
                } else { // ResultSet에 데이터가 없을 경우 ResultSet을 닫고 null을 리턴한다
                    rs.close(); // ResultSet을 닫음
                    return null;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}
