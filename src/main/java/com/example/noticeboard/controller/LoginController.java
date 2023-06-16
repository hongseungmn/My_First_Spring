package com.example.noticeboard.controller;


import com.example.noticeboard.dto.MemberDTO;
import com.example.noticeboard.service.JwtTokenService;
import com.example.noticeboard.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;


@Controller
@SessionAttributes("IsMember")
public class LoginController {
  @Autowired
  private LoginService loginService;

  @Autowired
  private JwtTokenService tokenService;

  @PostMapping("login/loginProcess.do")
  public String loginValidUser(HttpServletResponse response, MemberDTO dto, Model model) {
    if(loginService.isLogin(dto)) {
      response.addCookie(new Cookie("user-token",tokenService.createToken(dto.getId())));
      model.addAttribute("IsMember",dto.getId());
      System.out.println("회원입니다");
    }
    else {
      System.out.println("회원이 아닙니다");
    }
    return "redirect:/";

  }


}
