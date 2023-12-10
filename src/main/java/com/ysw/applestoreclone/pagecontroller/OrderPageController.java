package com.ysw.applestoreclone.pagecontroller;

import com.ysw.applestoreclone.javabean.ShopDataBean;
import com.ysw.applestoreclone.service.ShopSearchDataService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/order")
public class OrderPageController extends HttpServlet {
    ShopSearchDataService shopSearch = new ShopSearchDataService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        //        String keyword = req.getParameter("keyword");
        String keyword = "아이폰 케이스"; // 필요한 쿼리에 따라 동적으로 바뀌게 해야 함
        List<ShopDataBean> itemList = shopSearch.getData(keyword);
        req.setAttribute("shopData", itemList);

        // jsp 파일 안에 상품 관련 데이터가 담긴 form이 있어야 함
        String viewPath = "/order/order-page.jsp";
        RequestDispatcher dispatcher = req.getRequestDispatcher(viewPath);
        dispatcher.forward(req, res);
    }
}
