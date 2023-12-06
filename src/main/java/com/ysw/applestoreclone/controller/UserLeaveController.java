package com.ysw.applestoreclone.controller;

import com.ysw.applestoreclone.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/user/leave")
public class UserLeaveController extends HttpServlet {
    UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        String loginType = session.getAttribute("loginType").toString();
        String userId = session.getAttribute("userId").toString();
        if (userId == null) {
            System.out.println("!! 로그인 정보 확인 !!");
            res.sendRedirect(req.getContextPath() + "/");
        } else {
            switch (loginType) {
                case "email":
                    userService.userLeave(userId);
                    break;
                case "kakao":
                    userService.userLeaveKakao(userId, session.getAttribute("accessToken").toString());
                    break;
                case "naver":
                    userService.userLeaveNaver(userId, session.getAttribute("accessToken").toString());
                    break;
            }
            res.sendRedirect(req.getContextPath() + "/user/logout");
        }
    }
}
