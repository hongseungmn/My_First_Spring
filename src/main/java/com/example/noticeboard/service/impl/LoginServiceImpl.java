package com.example.noticeboard.service.impl;

import com.example.noticeboard.mapper.LoginMapper;
import com.example.noticeboard.service.LoginService;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service("loginService")
public class LoginServiceImpl implements LoginService {

  private LoginMapper mapper;
  @Override
  public boolean isLogin(Map map) {
    return false;
  }
}
