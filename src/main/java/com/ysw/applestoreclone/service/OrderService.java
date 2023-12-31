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
    UserService userService = new UserService();

    public void createNewOrder(OrderBean orderBean) throws SQLException {
        // 선택 된 용량에 따라 정가 설정
        switch (orderBean.getOrderCapacity()) {
            case "128GB":
                orderBean.setOriginPrice(1550000);
                break;
            case "256GB":
                orderBean.setOriginPrice(1700000);
                break;
            case "512GB":
                orderBean.setOriginPrice(2000000);
                break;
            case "1TB":
                orderBean.setOriginPrice(2300000);
                break;
        }
        double discountRate = getDiscountRate(orderBean.getBuyer());
        orderBean.setOrderPrice(getDiscountPrice(orderBean.getOriginPrice(), discountRate));

        Connection conn = DBConn.getDBConn();
        conn.setAutoCommit(false);
        String orderQuery = "INSERT INTO product_order(" +
                            "product_title, order_capacity, order_color, order_price, origin_price, buyer) " +
                            "values(?, ?, ?, ?, ?, ?)";
        String updateQuery = "UPDATE user SET user_balance = user_balance - ?, pay_amount = pay_amount + ? WHERE user_id = ?";
        try (
                PreparedStatement pstmtOrder = conn.prepareStatement(orderQuery);
                PreparedStatement pstmtUpdate = conn.prepareStatement(updateQuery);
        ) {
            pstmtOrder.setString(1, orderBean.getProductTitle());
            pstmtOrder.setString(2, orderBean.getOrderCapacity());
            pstmtOrder.setString(3, orderBean.getOrderColor());
            pstmtOrder.setInt(4, orderBean.getOrderPrice());
            pstmtOrder.setInt(5, orderBean.getOriginPrice());
            pstmtOrder.setString(6, orderBean.getBuyer());
            pstmtOrder.executeUpdate();

            pstmtUpdate.setInt(1, orderBean.getOrderPrice());
            pstmtUpdate.setInt(2, orderBean.getOrderPrice());
            pstmtUpdate.setString(3, orderBean.getBuyer());
            pstmtUpdate.executeUpdate();

            conn.commit();
            userService.updateUserRoleByPayment(orderBean.getBuyer());
            System.out.println("** 결제 성공 **");
        } catch (SQLException e) {
            conn.rollback();
            throw new RuntimeException(e);
        } finally {
            conn.setAutoCommit(true);
            conn.close();
        }
    }

    public void cancelOrder(int orderNo) throws SQLException {
        Connection conn = DBConn.getDBConn();
        conn.setAutoCommit(false);
        String cancelQuery = "UPDATE product_order SET order_state = 'canceled', cancel_date = CURRENT_TIMESTAMP WHERE order_no = ?";
        String updateQuery = "UPDATE user SET user_balance = user_balance + ?, pay_amount = pay_amount - ? WHERE user_id = ?";
        try (
                PreparedStatement pstmtCancel = conn.prepareStatement(cancelQuery);
                PreparedStatement pstmtUpdate = conn.prepareStatement(updateQuery);
        ) {
            pstmtCancel.setInt(1, orderNo);
            pstmtCancel.executeUpdate();

            OrderBean order = getOrderByOrderNo(orderNo);
            pstmtUpdate.setInt(1, order.getOrderPrice());
            pstmtUpdate.setInt(2, order.getOrderPrice());
            pstmtUpdate.setString(3, order.getBuyer());
            pstmtUpdate.executeUpdate();

            conn.commit();
            userService.updateUserRoleByPayment(order.getBuyer());
            System.out.println("** 결제 취소 성공 **");
        } catch (SQLException e) {
            conn.rollback();
        } finally {
            conn.setAutoCommit(true);
            conn.close();
        }
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
            orderBean.setOriginPrice(rs.getInt("origin_price"));
            orderBean.setBuyer(rs.getString("buyer"));
            orderBean.setOrderState(rs.getString("order_state"));
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
            orderBean.setOriginPrice(rs.getInt("origin_price"));
            orderBean.setBuyer(rs.getString("buyer"));
            orderBean.setOrderState(rs.getString("order_state"));
            orderBean.setOrderDate(rs.getString("order_date"));
            orderBean.setOrderCancelDate(rs.getString("cancel_date"));
            orderList.add(orderBean);
        }
        conn.close();
        pstmt.close();
        rs.close();
        return orderList;
    }

    public OrderBean getOrderByOrderNo(int orderNo) throws SQLException {
        Connection conn = DBConn.getDBConn();
        String query = "SELECT * FROM product_order WHERE order_no = ?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setInt(1, orderNo);
        ResultSet rs = pstmt.executeQuery();
        OrderBean orderBean = new OrderBean();
        while (rs.next()) {
            orderBean.setOrderNo(rs.getString("order_no"));
            orderBean.setProductTitle(rs.getString("product_title"));
            orderBean.setOrderPrice(Integer.parseInt(rs.getString("order_price")));
            orderBean.setBuyer(rs.getString("buyer"));
        }
        rs.close();
        conn.close();
        pstmt.close();
        return orderBean;
    }

    private double getDiscountRate(String userId) {
        String userRole = "";
        try (Connection conn = DBConn.getDBConn()) {
            String query = "SELECT user_role FROM user WHERE user_id = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setString(1, userId);
                ResultSet rs = pstmt.executeQuery();
                if (rs.next()) userRole = rs.getString("user_role");
                rs.close();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        switch (userRole) {
            case "Gold":
                return 0.1;
            case "Platinum":
                return 0.2;
            case "Silver":
            default:
                return 0;
        }
    }

    private int getDiscountPrice(int originPrice, double discountRate) {
        return (int)(originPrice * (1 - discountRate));
    }
}
