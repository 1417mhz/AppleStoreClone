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
        HttpSession session = req.getSession();
        String userId = session.getAttribute("userId").toString();
        if (userId == null) {
            System.out.println("!! 로그인 정보 확인 !!");
            res.sendRedirect(req.getContextPath() + "/");
        } else {
            userService.userLeave(userId);
            res.sendRedirect(req.getContextPath() + "/user/logout");
        }
    }
}
