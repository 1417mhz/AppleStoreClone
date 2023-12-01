package com.ysw.applestoreclone.controller;

import com.ysw.applestoreclone.service.ShopSearchDataService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/api/shop-data")
public class ShopSearchDataController extends HttpServlet {
    ShopSearchDataService shopSearch = new ShopSearchDataService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//        String keyword = req.getParameter("keyword");
        String keyword = "아이폰 케이스"; // 필요한 쿼리에 따라 동적으로 바뀌게 해야 함
        String jsonData = shopSearch.getData(keyword);

        req.setAttribute("shopData", jsonData);

        String viewPath = "/test.jsp";
        RequestDispatcher dispatcher = req.getRequestDispatcher(viewPath);
        dispatcher.forward(req, res);
    }
}
