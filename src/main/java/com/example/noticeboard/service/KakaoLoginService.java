package com.example.noticeboard.service;

import java.util.HashMap;

public interface KakaoLoginService {
  String getAccessToken(String authorize_code) throws Throwable;
  HashMap<String, Object> getUserInfo(String access_token);
}
