package com.ysw.applestoreclone.controller;

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

@WebServlet("/user/naver-login-proc")
public class LoginNaverController extends HttpServlet {
    UserService userService = new UserService();
    UserLoginService userLoginService = new UserLoginService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();

        if (req.getParameter("error") == null) {
            String code = req.getParameter("code");
            String state = req.getParameter("state");
            String accessToken = userLoginService.getNaverAccessToken(code, state);
            HashMap<String, Object> userInfo = userLoginService.getNaverUserInfo(accessToken);

            // 이미 회원가입이 된 소셜 로그인 유저인지, 아닌지를 검증
            String userId = userService.findUserBySocialId((String) userInfo.get("socialId"));
            if (userId != null) {
                session.setAttribute("isLogin", "true");
                session.setAttribute("userId", userId);
                session.setAttribute("naverLogin", "true");
                session.setAttribute("accessToken", accessToken);

                String contextPath = req.getContextPath();
                res.sendRedirect(contextPath + "/");
            } else {
                // 아직 회원가입이 안 된 유저라면 회원가입을 진행하도록 함
                req.setAttribute("naverUser", userInfo);

                String viewPath = "/user/signup.jsp";
                RequestDispatcher dispatcher = req.getRequestDispatcher(viewPath);
                dispatcher.forward(req, res);
            }
        } else {
            System.out.println("Error code: " + req.getParameter("error"));
            System.out.println("Error desc: " + req.getParameter("error_description"));
            System.out.println("!! 로그인 실패 !!");
        }
    }
}
