package com.ysw.applestoreclone.service;

import com.ysw.applestoreclone.javabean.DBConn;
import com.ysw.applestoreclone.javabean.UserBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SignupService {
    public void signupUser(UserBean userBean) {
        try (Connection conn = DBConn.getDBConn()) { // Connection 객체 생성 (DB 연결)
            if(!isUserDuplicate(conn, userBean.getUserId())) { // 같은 userId를 사용하는 중복된 사용자가 있는지 확인
                String query = "INSERT INTO user(user_id, user_pw, user_email, user_name, user_dob, user_contact) VALUES(?, ?, ?, ?, ?, ?);";
                try (PreparedStatement pstmt = conn.prepareStatement(query);) {
                    pstmt.setString(1, userBean.getUserId());
                    pstmt.setString(2, userBean.getUserPw());
                    pstmt.setString(3, userBean.getUserEmail());
                    pstmt.setString(4, userBean.getUserName());
                    pstmt.setString(5, userBean.getUserDob());
                    pstmt.setString(6, userBean.getUserContact());
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
