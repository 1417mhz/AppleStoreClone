package com.ysw.applestoreclone.pagecontroller;

import com.ysw.applestoreclone.javabean.OrderBean;
import com.ysw.applestoreclone.javabean.UserBean;
import com.ysw.applestoreclone.service.OrderService;
import com.ysw.applestoreclone.service.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/admin")
public class AdminPageController extends HttpServlet {
    UserService userService = new UserService();
    OrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        ArrayList<UserBean> userList;
        List<OrderBean> orderList;

        try {
            userList = userService.getAllUser();
            orderList = orderService.getAllOrder();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.setAttribute("userList", userList);
        req.setAttribute("orderList", orderList);

        String viewPath = "/admin/admin-page.jsp";
        RequestDispatcher dispatcher = req.getRequestDispatcher(viewPath);
        dispatcher.forward(req, res);
    }
}
