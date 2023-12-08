package com.ysw.applestoreclone.controller;

import com.ysw.applestoreclone.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/admin/user-leave")
public class AdminUserLeaveController extends HttpServlet {
    UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        String userId = req.getParameter("leaveUser");
//        String loginType = userService.getUserInfoById(userId).getSocialType();
        if (userId == null) {
            System.out.println("!! 회원 정보 확인 !!");
            res.sendRedirect(req.getContextPath() + "/admin-page");
        } else {
            /*
            switch (loginType) {
                case "kakao":
                    userService.userLeaveKakao(userId, session.getAttribute("accessToken").toString());
                    break;
                case "naver":
                    userService.userLeaveNaver(userId, session.getAttribute("accessToken").toString());
                    break;
                default:
                    userService.userLeave(userId);
                    break;
            } */
            userService.userLeave(userId);
            res.sendRedirect(req.getContextPath() + "/admin-page");
        }
    }
}
