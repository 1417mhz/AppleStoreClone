package com.ysw.applestoreclone.controller;

import com.ysw.applestoreclone.javabean.OrderBean;
import com.ysw.applestoreclone.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/order-proc")
public class OrderController extends HttpServlet {
    OrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doPost(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();

        OrderBean orderBean = new OrderBean();
        orderBean.setProductTitle("iPhone 15 Pro");
        orderBean.setOrderCapacity(req.getParameter("capacity"));
        orderBean.setOrderColor(req.getParameter("color"));
        orderBean.setBuyer(session.getAttribute("userId").toString());

        try {
            orderService.createNewOrder(orderBean);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            res.sendRedirect(req.getContextPath() + "/");
        }
    }
}
