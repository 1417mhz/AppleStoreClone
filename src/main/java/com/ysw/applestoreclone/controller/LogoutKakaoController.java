package com.ysw.applestoreclone.controller;

import com.ysw.applestoreclone.sensitiveinfo.SensInfoProvider;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/user/kakao-logout")
public class LogoutKakaoController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String logoutRequestUrl = SensInfoProvider.getLogoutRedirectUrl();
        // redirect는 GET 요청과 유사한 기능을 한다
        res.sendRedirect(logoutRequestUrl);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doGet(req, res);
    }
}
