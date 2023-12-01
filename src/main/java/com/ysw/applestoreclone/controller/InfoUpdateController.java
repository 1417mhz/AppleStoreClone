package com.ysw.applestoreclone.controller;

import com.ysw.applestoreclone.javabean.UserBean;
import com.ysw.applestoreclone.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/user/info-update-proc")
public class InfoUpdateController extends HttpServlet {
    UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();

        UserBean userBean = new UserBean();
        userBean.setUserId(session.getAttribute("userId").toString());
        userBean.setUserEmail(req.getParameter("userEmail"));
        userBean.setUserName(req.getParameter("userName"));
        userBean.setUserDob(req.getParameter("userDob"));
        userBean.setUserContact(req.getParameter("userContact"));
        try {
            userService.updateUser(userBean);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            res.sendRedirect(req.getContextPath() + "/user/my-page");
        }
    }
}
