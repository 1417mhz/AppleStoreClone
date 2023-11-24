package com.ysw.applestoreclone.controller;

import com.ysw.applestoreclone.sensitiveinfo.SensInfoProvider;

import javax.servlet.RequestDispatcher;
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

        // 코드 자체에서 get 요청을 보내고 처리하는 방법으로 수정해야 함

        res.sendRedirect(logoutRequestUrl);
        // redirect로 변경
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doGet(req, res);
    }
}
