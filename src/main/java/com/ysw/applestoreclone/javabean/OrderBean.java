package com.ysw.applestoreclone.javabean;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class OrderBean {
    private String orderNo;
    private String productTitle;
    private int orderPrice; // 할인 된 가격
    private int originPrice; // 정가
    private String buyer; // userId
    private String orderDate;
    private String orderCancelDate;
}

// 주소
// 색상
// 용량
