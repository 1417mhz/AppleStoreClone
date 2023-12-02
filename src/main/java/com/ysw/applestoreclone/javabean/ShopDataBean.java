package com.ysw.applestoreclone.javabean;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ShopDataBean {
    // items
    private String itemTitle; // 제품명 (title)
    private String itemPrice; // 가격 (lprice)
    private String itemUrl; // 상품 url (link)
    private String itemImgUrl; // 이미지 url (image)
}
