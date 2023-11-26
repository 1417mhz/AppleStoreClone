package com.ysw.applestoreclone.service;

import com.ysw.applestoreclone.javabean.DBConn;
import com.ysw.applestoreclone.javabean.UserBean;
import org.mindrot.jbcrypt.BCrypt;

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

    public void signupUser(UserBean userBean) {
        try (Connection conn = DBConn.getDBConn()) { // Connection 객체 생성 (DB 연결)
            if(!isUserDuplicate(conn, userBean.getUserId())) { // 같은 userId를 사용하는 중복된 사용자가 있는지 확인
                // 비밀번호 암호화 후 저장
                userBean.setUserPw(BCrypt.hashpw(userBean.getUserPw(), BCrypt.gensalt()));

                String query = "INSERT INTO user(user_id, user_pw, user_email, user_name, user_dob, user_contact, social_id) VALUES(?, ?, ?, ?, ?, ?, ?);";
                try (PreparedStatement pstmt = conn.prepareStatement(query);) {
                    pstmt.setString(1, userBean.getUserId());
                    pstmt.setString(2, userBean.getUserPw());
                    pstmt.setString(3, userBean.getUserEmail());
                    pstmt.setString(4, userBean.getUserName());
                    pstmt.setString(5, userBean.getUserDob());
                    pstmt.setString(6, userBean.getUserContact());
                    pstmt.setString(7, userBean.getSocialId());
                    pstmt.executeUpdate();

                    System.out.println("** 회원가입 성공 **");
                }
            } else System.out.println("!! 회원 아이디 중복 !!");
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Fail to Connect DB", e);
        }
    }

    public boolean isUserDuplicate(Connection conn, String userId) {
        String query = "SELECT * FROM user WHERE user_id = ?";
        // try-with-resources 문법을 이용하면 db 리소스를 알아서 정리해준다
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, userId);

            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next(); // 중복된 사용자가 없으면 false 반환, 있으면 true 반환
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false; // 그 외 오류 발생시 false 반환
        }
    }
}
