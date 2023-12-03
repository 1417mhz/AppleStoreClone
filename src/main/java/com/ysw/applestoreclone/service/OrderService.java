package com.ysw.applestoreclone.service;

import com.ysw.applestoreclone.javabean.DBConn;
import com.ysw.applestoreclone.javabean.OrderBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderService {
    public void createNewOrder(OrderBean orderBean) throws SQLException {
        Connection conn = DBConn.getDBConn();
        String query = "INSERT INTO product_order(product_title, order_price, buyer) values(?, ?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, orderBean.getProductTitle());
        pstmt.setInt(2, orderBean.getOrderPrice());
        pstmt.setString(3, orderBean.getBuyer());
        pstmt.executeUpdate();
        conn.close();
        pstmt.close();
        System.out.println("** 결제 성공 **");
    }

    public List<OrderBean> getAllOrder() throws SQLException {
        Connection conn = DBConn.getDBConn();
        String query = "SELECT * FROM product_order";
        PreparedStatement pstmt = conn.prepareStatement(query);
        ResultSet rs = pstmt.executeQuery();

        List<OrderBean> orderList =  new ArrayList<OrderBean>();
        while (rs.next()) {
            OrderBean orderBean = new OrderBean();
            orderBean.setOrderNo(rs.getString("order_no"));
            orderBean.setProductTitle(rs.getString("product_title"));
            orderBean.setOrderPrice(rs.getInt("order_price"));
            orderBean.setBuyer(rs.getString("buyer"));
            orderBean.setOrderDate(rs.getString("order_date"));
            orderBean.setOrderCancelDate(rs.getString("cancel_date"));
            orderList.add(orderBean);
        }
        conn.close();
        pstmt.close();
        rs.close();
        return orderList;
    }

    public List<OrderBean> getOrderByBuyerId(String userId) throws SQLException {
        Connection conn = DBConn.getDBConn();
        String query = "SELECT * FROM product_order WHERE buyer = ?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, userId);
        ResultSet rs = pstmt.executeQuery();

        List<OrderBean> orderList =  new ArrayList<OrderBean>();
        while (rs.next()) {
            OrderBean orderBean = new OrderBean();
            orderBean.setOrderNo(rs.getString("order_no"));
            orderBean.setProductTitle(rs.getString("product_title"));
            orderBean.setOrderPrice(rs.getInt("order_price"));
            orderBean.setBuyer(rs.getString("buyer"));
            orderBean.setOrderDate(rs.getString("order_date"));
            orderBean.setOrderCancelDate(rs.getString("cancel_date"));
            orderList.add(orderBean);
        }
        System.out.println("orderList = " + orderList);
        conn.close();
        pstmt.close();
        rs.close();
        return orderList;
    }

    public void cancelOrder(int orderNo) throws SQLException {
        Connection conn = DBConn.getDBConn();
        String query = "UPDATE product_order SET cancel_date = CURRENT_TIMESTAMP WHERE order_no = ?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setInt(1, orderNo);
        pstmt.executeUpdate();
        conn.close();
        pstmt.close();
        System.out.println("** 결제 취소 성공 **");
    }
}
