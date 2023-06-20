package com.example.noticeboard.service;

import com.example.noticeboard.dto.MemberDTO;
import org.springframework.stereotype.Service;

public interface LoginService {
  boolean isLogin(MemberDTO dto);
  void logout(String id);
}
