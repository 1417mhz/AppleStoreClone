package com.ysw.applestoreclone.controller;

import com.ysw.applestoreclone.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/user/pw-change-proc")
public class PwChangeController extends HttpServlet {
    UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doPost(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        String userId = session.getAttribute("userId").toString();
        String currentPw = req.getParameter("currentPw");
        String newPw = req.getParameter("newPw");

        if (userId == null) {
            System.out.println("!! 로그인 정보 확인 !!");
        } else {
            userService.userPwUpdate(userId, currentPw, newPw);
        }
        res.sendRedirect(req.getContextPath() + "/");
    }
}
