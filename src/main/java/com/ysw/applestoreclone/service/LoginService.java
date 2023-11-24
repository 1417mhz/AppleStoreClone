package com.ysw.applestoreclone.service;

import com.ysw.applestoreclone.javabean.DBConn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginService {

    // 로그인 로직
    public boolean loginUser(String userId, String userPw) {
        // DB에서 userId로 사용자를 검색하여 비밀번호를 가져옴
        String originPw = getUserPwById(userId);
        if(userPw.equals(originPw)) { // 암호 복호화 후 비교하는 작업 필요
            System.out.println("** " + userId + " 로그인 성공 **");
            return true;
        } else if(originPw == null) {
            System.out.println("!! 해당되는 ID의 회원 없음 !!");
            return false;
        } else {
            System.out.println("!! 비밀번호 틀림 !!");
            return false;
        }
    }

    // 사용자 비밀번호 추출 로직
    public String getUserPwById(String userId) {
        try (Connection conn = DBConn.getDBConn()) {
            String query = "SELECT user_pw FROM user WHERE user_id = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setString(1, userId);
                ResultSet rs = pstmt.executeQuery();
                // ResultSet에 데이터가 담겨있는지 확인하고 리턴을 수행한다
                if (rs.next()) {
                    String userPw = rs.getString("user_pw");
                    rs.close();
                    return userPw;
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
