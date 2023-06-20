package com.example.noticeboard.controller;


import com.example.noticeboard.dto.MemberDTO;
import com.example.noticeboard.service.JwtTokenService;
import com.example.noticeboard.service.KakaoLoginService;
import com.example.noticeboard.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;


@Controller
public class LoginController {
  @Autowired
  private LoginService loginService;

  @Autowired
  private JwtTokenService tokenService;

  @Autowired
  private KakaoLoginService kakaoLoginService;

  @PostMapping("login/loginProcess.do")
  public String loginByUser(HttpServletResponse response, MemberDTO dto, Model model) {
    if(loginService.isLogin(dto)) {
      Cookie cookie = new Cookie("User-Token",tokenService.createToken(dto.getId()));
      cookie.setPath("/");
      cookie.setMaxAge(60*60);
      response.addCookie(cookie);
      System.out.println("회원입니다");
    }
    else {
      System.out.println("회원이 아닙니다");
    }
    System.out.println("redirect:/ 로 이동합니다");
    return "redirect:/";
  }

  @GetMapping("login/logout.do")
  public String logout(HttpServletRequest request, HttpServletResponse response) {
    tokenService.removeToken(request,response);
    return "redirect:/";
  }

  @RequestMapping(value = "/kakaoLogin.do", method = RequestMethod.GET)
  public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpServletRequest request) throws Throwable {

    System.out.println("code:" + code);

    String access_Token = kakaoLoginService.getAccessToken(code);
    System.out.println("---ACCESS_TOKEN---- : "+access_Token);
    HashMap<String, Object> userInfo = kakaoLoginService.getUserInfo(access_Token);
    System.out.println("###nickname#### : " + userInfo.get("nickname"));
    System.out.println("###email#### : " + userInfo.get("email"));
    request.getSession().setAttribute("UserId","카카오");
    return "Index";
    // return에 페이지를 해도 되고, 여기서는 코드가 넘어오는지만 확인할거기 때문에 따로 return 값을 두지는 않았음
  }


}
