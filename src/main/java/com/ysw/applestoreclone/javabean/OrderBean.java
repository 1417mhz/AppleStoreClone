package com.ysw.applestoreclone.javabean;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class OrderBean {
    private String orderNo;
    private String productTitle;
    private int orderPrice;
    private String buyer; // userId
    private String orderDate;
    private String orderCancelDate;
}
