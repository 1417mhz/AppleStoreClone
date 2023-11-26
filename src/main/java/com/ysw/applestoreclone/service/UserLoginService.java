package com.ysw.applestoreclone.service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.ysw.applestoreclone.javabean.DBConn;
import com.ysw.applestoreclone.sensitiveinfo.SensInfoProvider;
import org.mindrot.jbcrypt.BCrypt;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

public class UserLoginService {
    UserService userService = new UserService();

    // 로그인 로직
    public boolean loginUser(String userId, String userPw) {
        // DB에서 userId로 사용자를 검색하여 비밀번호를 가져옴
        String hashedPw = userService.getUserPwById(userId);
        try {
            if(BCrypt.checkpw(userPw, hashedPw)) { // 암호 복호화 후 비교 작업
                System.out.println("** " + userId + " 로그인 성공 **");
                return true;
            } else {
                System.out.println("!! 비밀번호 틀림 !!");
                return false;
            }
        } catch (NullPointerException e) {
            e.printStackTrace();
            System.out.println("!! 해당되는 ID의 회원 없음 !!");
            return false;
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            System.out.println("!! BCrypt 오류 발생 !!");
            return false;
        }
    }

    // 카카오 소셜 로그인
    // 인가 코드로 토근을 받아오는 로직
    public String getAccessToken(String authCode) {
        String accessToken = "";
        String refreshToken = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            // POST 요청을 위해 기본값이 false인 setDoOutput을 true로

            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송

            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream(), StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");

            sb.append("&client_id=" + SensInfoProvider.getRestApiKey()); //본인이 발급받은 key
            sb.append("&redirect_uri=" + SensInfoProvider.getLoginRedirectUri()); // 본인이 설정한 주소
            sb.append("&code=" + authCode);

            bw.write(sb.toString());
            bw.flush();

            // 결과 코드가 200이라면 성공
//            int responseCode = conn.getResponseCode();
//            System.out.println("responseCode : " + responseCode);

            // 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }

            // Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            accessToken = element.getAsJsonObject().get("access_token").getAsString();
            refreshToken = element.getAsJsonObject().get("refresh_token").getAsString();

            br.close();
            bw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return accessToken;
    }

    // 토큰으로 사용자 정보를 받아오는 로직
    public HashMap<String, Object> getUserInfo(String accessToken) {
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            // 요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + accessToken);

//            int responseCode = conn.getResponseCode();
//            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8));

            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);
//            System.out.println("element = " + element);

            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

            String socialId = element.getAsJsonObject().get("id").getAsString();
            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
            String email = kakao_account.getAsJsonObject().get("email").getAsString();

            userInfo.put("socialId", socialId);
            userInfo.put("nickname", nickname);
            userInfo.put("email", email);

        } catch (IOException e) {
            e.printStackTrace();
        }
        return userInfo;
    }
}
