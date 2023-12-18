package com.ysw.applestoreclone.javabean;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class OrderBean {
    private String orderNo;
    private String productTitle;
    private String orderCapacity;
    private String orderColor;
    private int orderPrice; // 할인 된 가격
    private int originPrice; // 정가
    private String buyer; // userId
    private String orderState;
    private String orderDate;
    private String orderCancelDate;
}
