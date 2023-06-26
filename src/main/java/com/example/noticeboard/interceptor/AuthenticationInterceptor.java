package com.example.noticeboard.interceptor;

import com.example.noticeboard.service.JwtTokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AuthenticationInterceptor implements HandlerInterceptor {

  @Autowired
  private JwtTokenService tokenService;

  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    Cookie[] cookies = request.getCookies();
    String token = "";
    if(cookies !=null) {
      for(Cookie cookie : cookies) {
        if(cookie.getName().equals("User-Token")) {
          token = cookie.getValue();
          if(tokenService.verifyToken(token)) {
            request.setAttribute("UserId",tokenService.getTokenPayloads(token));
          }
        }
      }
    }
    return true;
  }
}
