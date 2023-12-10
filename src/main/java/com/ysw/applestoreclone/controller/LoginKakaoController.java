package com.ysw.applestoreclone.controller;

import com.ysw.applestoreclone.javabean.SocialUserBean;
import com.ysw.applestoreclone.service.UserLoginService;
import com.ysw.applestoreclone.service.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;

@WebServlet("/user/kakao-login-proc")
public class LoginKakaoController extends HttpServlet {
    UserService userService = new UserService();
    UserLoginService userLoginService = new UserLoginService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doPost(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();

        // 인가 코드가 return 되지 않고 에러가 발생한 경우를 확인
        if(req.getParameter("error") == null) {
            String authCode = req.getParameter("code"); // 인가 코드 가져오기
            String accessToken = userLoginService.getAccessToken(authCode); // 인가 코드로 토큰 받아오기
            HashMap<String, Object> userInfo = userLoginService.getUserInfo(accessToken); // 토큰으로 유저 정보 받아오기

            // 이미 회원가입이 된 소셜 로그인 유저인지, 아닌지를 검증
            String userId = userService.findUserBySocialId((String)userInfo.get("socialId"));
            if(userId != null) {
                session.setAttribute("isLogin", "true");
                session.setAttribute("userId", userId);
                session.setAttribute("loginType", "kakao");
                session.setAttribute("accessToken", accessToken);
                if (userService.isUserAdmin(userId))
                    session.setAttribute("isAdmin", "true");

                String contextPath = req.getContextPath();
                res.sendRedirect(contextPath + "/");
            } else {
                // 아직 회원가입이 안 된 유저라면 회원가입을 진행하도록 함
                SocialUserBean socialUserBean = new SocialUserBean();
                socialUserBean.setUserEmail(userInfo.get("email").toString());
                socialUserBean.setUserName(userInfo.get("nickname").toString());
                socialUserBean.setSocialId(userInfo.get("socialId").toString());
                socialUserBean.setSocialType("kakao");
                req.setAttribute("signupUser", socialUserBean);

                String viewPath = "/user/signup.jsp";
                RequestDispatcher dispatcher = req.getRequestDispatcher(viewPath);
                dispatcher.forward(req, res);
            }
        } else {
            String error = req.getParameter("error");
            String errorDesc = req.getParameter("error_description");
            System.out.println("error = " + error);
            System.out.println("errorDesc = " + errorDesc);

            String contextPath = req.getContextPath();
            res.sendRedirect(contextPath + "/user/login");
        }
    }
}
