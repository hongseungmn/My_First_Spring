package com.example.noticeboard.controller;


import com.example.noticeboard.service.JwtTokenService;
import com.example.noticeboard.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.Map;

@Controller
public class LoginController {

  private JwtTokenService jwtToken;

  @Autowired
  private LoginService loginService;

  @PostMapping("login/loginProcess.do")
  public String loginValidUser(Model model, @RequestParam String userId,@RequestParam String userPassword) {
    if(userId.equals("KIM") && userPassword.equals("1234")) {
      model.addAttribute("message" , "유효한 사용자입니다");
      return "redirect:Index";
    }
    model.addAttribute("message" , "유효하지 않은 사용자입니다");
    return "redirect:Index";
  }


}
