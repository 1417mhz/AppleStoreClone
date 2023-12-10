package com.ysw.applestoreclone.javabean;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SocialUserBean { // 소셜 로그인 회원가입 사용자를 위한 가입용 객체
    private String userEmail;
    private String userName;
    private String socialId;
    private String socialType;
}
