package com.example.noticeboard.service;

import com.example.noticeboard.dto.MemberDTO;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public interface LoginService {
  boolean isLogin(MemberDTO dto);
}
