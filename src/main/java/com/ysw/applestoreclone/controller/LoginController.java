package com.ysw.applestoreclone.controller;

import com.ysw.applestoreclone.service.UserLoginService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/user/loginProc")
public class LoginController extends HttpServlet {
    UserLoginService userLoginService = new UserLoginService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doPost(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        String userId = req.getParameter("userId");
        String userPw = req.getParameter("userPw");

        // 로그인 로직 수행
        // 로그인 작업이 성공적으로 수행되었다면 메인 페이지로, 아니라면 다시 로그인 페이지로 이동
        if (userLoginService.loginUser(userId, userPw)) {
            session.setAttribute("isLogin", "true");
            session.setAttribute("userId", userId);

            String contextPath = req.getContextPath();
            res.sendRedirect(contextPath + "/");
        } else {
            String contextPath = req.getContextPath();
            res.sendRedirect(contextPath + "/user/login");
        }
    }
}
