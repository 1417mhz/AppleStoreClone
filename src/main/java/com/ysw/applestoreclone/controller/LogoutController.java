package com.ysw.applestoreclone.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/user/logout")
public class LogoutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("isLogin").equals("true")) {
            session.removeAttribute("isLogin");
            session.removeAttribute("userId");
            if (session.getAttribute("kakaoLogin") != null) {
                session.removeAttribute("kakaoLogin");
                session.removeAttribute("accessToken");
            }
            if (session.getAttribute("naverLogin") != null) {
                session.removeAttribute("naverLogin");
                session.removeAttribute("accessToken");
            }
            System.out.println("** 로그아웃 성공 **");
        } else {
            System.out.println("!! 로그인 되어 있지 않음 !!");
        }

        String contextPath = req.getContextPath();
        res.sendRedirect(contextPath + "/");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doGet(req, res);
    }
}
