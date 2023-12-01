package com.ysw.applestoreclone.pagecontroller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/user/info-update")
public class InfoUpdatePageController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String viewPath = "/user/info-update.jsp";
        RequestDispatcher dsp = req.getRequestDispatcher(viewPath);
        dsp.forward(req, res);
    }
}
