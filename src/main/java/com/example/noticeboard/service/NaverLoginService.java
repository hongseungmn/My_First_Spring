package com.example.noticeboard.service;

import java.util.HashMap;
import java.util.Map;

public interface NaverLoginService {
  String getAccessToken(String code) throws Throwable;
  Map getUserInfo(String access_token);
}
