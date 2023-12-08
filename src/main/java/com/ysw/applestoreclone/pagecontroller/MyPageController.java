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
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/user/my-page")
public class MyPageController extends HttpServlet {
    UserService userService = new UserService();
    OrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();

        UserBean userBean;
        List<OrderBean> orderList;
        try {
            userBean = userService.getUserInfoById(session.getAttribute("userId").toString());
            orderList = orderService.getOrderByBuyerId(session.getAttribute("userId").toString());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.setAttribute("userBean", userBean);
        req.setAttribute("orderList", orderList);

        String viewPath = "/user/my-page.jsp";
        RequestDispatcher dispatcher = req.getRequestDispatcher(viewPath);
        dispatcher.forward(req, res);
    }
}
