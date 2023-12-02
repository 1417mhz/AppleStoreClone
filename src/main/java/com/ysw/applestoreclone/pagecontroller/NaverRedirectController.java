package com.ysw.applestoreclone.pagecontroller;

import com.ysw.applestoreclone.sensitiveinfo.SensInfoProvider;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/user/naver-login")
public class NaverRedirectController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String targetUrl = SensInfoProvider.getNaverLoginRedirectUrl();
        res.sendRedirect(targetUrl);
    }
}
