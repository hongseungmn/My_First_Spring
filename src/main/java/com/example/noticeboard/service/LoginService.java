package com.example.noticeboard.service;

import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public interface LoginService {
  boolean isLogin(Map map);
}
