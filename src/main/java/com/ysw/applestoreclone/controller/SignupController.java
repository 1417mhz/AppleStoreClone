package com.ysw.applestoreclone.controller;

import com.ysw.applestoreclone.javabean.UserBean;
import com.ysw.applestoreclone.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/user/signupProc")
public class SignupController extends HttpServlet {
    UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doPost(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        if(!req.getParameterMap().isEmpty()) {
            UserBean userBean = new UserBean();
            userBean.setUserId(req.getParameter("userId"));
            userBean.setUserPw(req.getParameter("userPw"));
            userBean.setUserEmail(req.getParameter("userEmail"));
            userBean.setUserName(req.getParameter("userName"));
            userBean.setUserDob(req.getParameter("userDob"));
            userBean.setUserContact(req.getParameter("userContact"));
            if(req.getParameter("socialId") != null) {
                userBean.setSocialType(req.getParameter("socialType"));
                userBean.setSocialId(req.getParameter("socialId"));
            }

            userService.signupUser(userBean);
        } else throw new RuntimeException("No parameter found");

        String contextPath = req.getContextPath();
        res.sendRedirect(contextPath + "/");
    }
}
