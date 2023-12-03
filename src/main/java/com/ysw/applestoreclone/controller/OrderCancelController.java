package com.ysw.applestoreclone.controller;

import com.ysw.applestoreclone.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/order-cancel")
public class OrderCancelController extends HttpServlet {
    OrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        // 취소하려는 주문 정보를 가져옴
        int orderNo = Integer.parseInt(req.getParameter("orderNo"));
        try {
            orderService.cancelOrder(orderNo);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            res.sendRedirect(req.getContextPath() + "/");
        }
    }
}
