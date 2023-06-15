package com.example.noticeboard.service.impl;

import com.example.noticeboard.dto.MemberDTO;
import com.example.noticeboard.mapper.LoginMapper;
import com.example.noticeboard.service.JwtTokenService;
import com.example.noticeboard.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("loginService")
public class LoginServiceImpl implements LoginService {
  @Autowired
  private LoginMapper mapper;
  @Autowired
  private JwtTokenService tokenService;
  @Override
  public boolean isLogin(MemberDTO dto) {
    return mapper.findByIdAndPassword(dto);
  }
}
