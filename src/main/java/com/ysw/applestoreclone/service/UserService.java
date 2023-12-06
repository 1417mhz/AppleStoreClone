package com.ysw.applestoreclone.service;

import com.ysw.applestoreclone.javabean.DBConn;
import com.ysw.applestoreclone.javabean.UserBean;
import com.ysw.applestoreclone.sensitiveinfo.SensInfoProvider;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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

    // 사용자 전체 정보 추출 로직
    public UserBean getUserInfoById(String userId) {
        UserBean userBean = new UserBean();
        try (Connection conn = DBConn.getDBConn()) {
            String query = "SELECT * FROM user WHERE user_id = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setString(1, userId);
                ResultSet rs = pstmt.executeQuery();
                // ResultSet에 데이터가 담겨있는지 확인하고 리턴을 수행한다
                if (rs.next()) {
                    userBean.setUserNo(rs.getString("user_no"));
                    userBean.setUserId(rs.getString("user_id"));
                    userBean.setUserPw(rs.getString("user_pw"));
                    userBean.setSocialId(rs.getString("social_id"));
                    userBean.setUserEmail(rs.getString("user_email"));
                    userBean.setUserName(rs.getString("user_name"));
                    userBean.setUserDob(rs.getString("user_dob"));
                    userBean.setUserContact(rs.getString("user_contact"));
                    userBean.setUserRole(rs.getString("user_role"));
                    userBean.setUserBalance(Integer.parseInt(rs.getString("user_balance")));
                    userBean.setUserState(rs.getString("user_state"));
                    userBean.setSignupDate(rs.getString("signup_date"));
                    userBean.setLeaveDate(rs.getString("leave_date"));
                    rs.close();
                    return userBean;
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

    public boolean isUserActive(String userId) {
        try (Connection conn = DBConn.getDBConn()) {
            String query = "SELECT user_state FROM user WHERE user_id = ?";
            // try-with-resources 문법을 이용하면 db 리소스를 알아서 정리해준다
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setString(1, userId);
                ResultSet rs = pstmt.executeQuery();
                if (rs.next()) {
                    boolean userStatus = rs.getString("user_state").equals("active");
                    rs.close();
                    return userStatus;
                } else {
                    rs.close();
                    return false;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false; // 그 외 오류 발생시 false 반환
        }
    }

    public void signupUser(UserBean userBean) {
        try (Connection conn = DBConn.getDBConn()) { // Connection 객체 생성 (DB 연결)
            if(!isUserDuplicate(conn, userBean.getUserId())) { // 같은 userId를 사용하는 중복된 사용자가 있는지 확인
                // 비밀번호 암호화 후 저장
                userBean.setUserPw(BCrypt.hashpw(userBean.getUserPw(), BCrypt.gensalt()));

                String query = "INSERT INTO user(user_id, user_pw, user_email, user_name, user_dob, user_contact, social_id, social_type) VALUES(?, ?, ?, ?, ?, ?, ?, ?);";
                try (PreparedStatement pstmt = conn.prepareStatement(query);) {
                    pstmt.setString(1, userBean.getUserId());
                    pstmt.setString(2, userBean.getUserPw());
                    pstmt.setString(3, userBean.getUserEmail());
                    pstmt.setString(4, userBean.getUserName());
                    pstmt.setString(5, userBean.getUserDob());
                    pstmt.setString(6, userBean.getUserContact());
                    pstmt.setString(7, userBean.getSocialId());
                    pstmt.setString(8, userBean.getSocialType());
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

    public void userPwUpdate(String userId, String currentPw, String newPw) {
        if (BCrypt.checkpw(currentPw, getUserPwById(userId))) {
            try (Connection conn = DBConn.getDBConn()) {
                newPw = BCrypt.hashpw(newPw, BCrypt.gensalt());
                String query = "UPDATE user SET user_pw = ? WHERE user_id = ?";
                try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                    pstmt.setString(1, newPw);
                    pstmt.setString(2, userId);
                    pstmt.executeUpdate();

                    System.out.println("** 비밀번호 변경 성공 **");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                throw new RuntimeException("Fail to Connect DB", e);
            }
        } else {
            System.out.println("!! 비밀번호 변경 실패 !!");
            throw new RuntimeException("Fail to Connect DB");
        }
    }

    public void userLeave(String userId) {
        try (Connection conn = DBConn.getDBConn()) {
            String query = "UPDATE user SET leave_date = CURRENT_TIMESTAMP, " +
                            "user_state = 'inactive', social_id = null WHERE user_id = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setString(1, userId);
                pstmt.executeUpdate();

                System.out.println("** 회원 탈퇴 성공 **");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Fail to Connect DB", e);
        }
    }

    public void userLeaveKakao(String userId, String accessToken) throws IOException {
        String reqUrl = "https://kapi.kakao.com/v1/user/unlink";

        URL url = new URL(reqUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
        conn.setRequestProperty("Authorization", "Bearer " + accessToken);

        int responseCode = conn.getResponseCode();
        if (responseCode == HttpURLConnection.HTTP_OK) {
            /*
            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            StringBuilder response = new StringBuilder();

            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();
            */
            userLeave(userId);
        } else {
            // 에러 발생 시 처리
            System.out.println("!! 탈퇴 에러 발생 !!");
        }
    }

    public void userLeaveNaver(String userId, String accessToken) throws IOException {
        String reqUrl = "https://nid.naver.com/oauth2.0/token";
        URL url = new URL(reqUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

        // 요청 메소드와 헤더 설정
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

        // 요청 파라미터 구성
        String urlParameters = "client_id=" + SensInfoProvider.getClientId()
                + "&client_secret=" + SensInfoProvider.getClientSecret()
                + "&access_token=" + accessToken
                + "&grant_type=delete"
                + "&service_provider=NAVER";

        // 출력을 사용하여 파라미터를 요청 본문에 작성할 수 있도록 설정
        conn.setDoOutput(true);

        try (OutputStream os = conn.getOutputStream()) {
            byte[] input = urlParameters.getBytes(StandardCharsets.UTF_8);
            os.write(input, 0, input.length);
        }

        int responseCode = conn.getResponseCode();
        if (responseCode == HttpURLConnection.HTTP_OK) {
            /*
            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            StringBuilder response = new StringBuilder();

            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();
            JsonElement element = JsonParser.parseString(String.valueOf(response));
            String result = element.getAsJsonObject().get("result").getAsString();
            */
            userLeave(userId);
        } else {
            // 에러 발생 시 처리
            System.out.println("!! 탈퇴 에러 발생 !!");
        }
    }

    public void updateUser(UserBean userBean) throws SQLException {
        UserBean userInfo = getUserInfoById(userBean.getUserId());
        // 입력 된 정보만 수정 되도록 함
        if(userBean.getUserEmail().isEmpty()) userBean.setUserEmail(userInfo.getUserEmail());
        if(userBean.getUserName().isEmpty()) userBean.setUserName(userInfo.getUserName());
        if(userBean.getUserDob().isEmpty()) userBean.setUserDob(userInfo.getUserDob());
        if(userBean.getUserContact().isEmpty()) userBean.setUserContact(userInfo.getUserContact());

        Connection conn = DBConn.getDBConn();
        String query = "UPDATE user SET user_email = ?, user_name = ?, user_dob = ?, user_contact = ? WHERE user_id = ?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, userBean.getUserEmail());
        pstmt.setString(2, userBean.getUserName());
        pstmt.setString(3, userBean.getUserDob());
        pstmt.setString(4, userBean.getUserContact());
        pstmt.setString(5, userBean.getUserId());
        pstmt.executeUpdate();
        conn.close();
        pstmt.close();
        System.out.println("!! 회원 정보 수정 성공 !!");
    }

    public ArrayList<UserBean> getAllUser() throws SQLException {
        ArrayList<UserBean> usersArrayList = new ArrayList<UserBean>();
        Connection conn = DBConn.getDBConn();
        String query = "SELECT user_no, user_id, user_email, user_name, user_dob, user_contact, " +
                        "user_role, user_balance, user_state, signup_date, leave_date FROM user";
        PreparedStatement pstmt = conn.prepareStatement(query);
        ResultSet rs = pstmt.executeQuery();
        while (rs.next()) {
            UserBean userBean = new UserBean();
            userBean.setUserNo(rs.getString("user_no"));
            userBean.setUserId(rs.getString("user_id"));
            userBean.setUserEmail(rs.getString("user_email"));
            userBean.setUserName(rs.getString("user_name"));
            userBean.setUserDob(rs.getString("user_dob"));
            userBean.setUserContact(rs.getString("user_contact"));
            userBean.setUserRole(rs.getString("user_role"));
            userBean.setUserBalance(Integer.parseInt(rs.getString("user_balance")));
            userBean.setUserState(rs.getString("user_state"));
            userBean.setSignupDate("signup_date");
            userBean.setLeaveDate("leave_date");
            usersArrayList.add(userBean);
        }
        conn.close();
        pstmt.close();
        rs.close();
        return usersArrayList;
    }
}
