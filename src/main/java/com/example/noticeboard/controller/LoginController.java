package com.example.noticeboard.controller;


import com.example.noticeboard.dto.MemberDTO;
import com.example.noticeboard.service.JwtTokenService;
import com.example.noticeboard.service.KakaoLoginService;
import com.example.noticeboard.service.LoginService;
import com.example.noticeboard.service.NaverLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;


@Controller
public class LoginController {
  @Autowired
  private LoginService loginService;

  @Autowired
  private JwtTokenService tokenService;

  @Autowired
  private KakaoLoginService kakaoLoginService;
  @Autowired
  private NaverLoginService naverLoginService;

  @PostMapping("login/loginProcess.do")
  public String loginByUser(HttpServletResponse response, MemberDTO dto) throws IOException {
    if(loginService.isLogin(dto)) {
      Cookie cookie = new Cookie("User-Token",tokenService.createToken(dto.getId()));
      cookie.setPath("/");
      cookie.setMaxAge(60*60);
      response.addCookie(cookie);
    }
    else {
      response.setContentType("text/html; charset=euc-kr");
      PrintWriter out = response.getWriter();
      out.println("<script>alert('인증번호가 틀립니다');location.href='/'</script>");
      out.flush();
      return null;
    }
    return "redirect:/";
  }

  @GetMapping("login/logout.do")
  public String logout(HttpServletRequest request, HttpServletResponse response) {
    tokenService.removeToken(request,response);
    return "redirect:/";
  }

  @RequestMapping(value = "/kakaoLogin.do", method = RequestMethod.GET)
  public String kakaoLogin(@RequestParam(value = "code", required = false) String code,HttpServletResponse response) throws Throwable {

    System.out.println("code:" + code);

    String access_Token = kakaoLoginService.getAccessToken(code);
    System.out.println("---ACCESS_TOKEN---- : "+access_Token);
    HashMap<String, Object> userInfo = kakaoLoginService.getUserInfo(access_Token);
    if(userInfo.get("email")!=null) {
      Cookie cookie = new Cookie("User-Token",tokenService.createToken("LEE"));
      cookie.setPath("/");
      cookie.setMaxAge(60*60);
      response.addCookie(cookie);
    }
    else {
      response.setContentType("text/html; charset=euc-kr");
      PrintWriter out = response.getWriter();
      out.println("<script>alert('로그인에 실패했습니다');location.href='/'</script>");
      out.flush();
      return null;
    }
    return "redirect:/";
    // return에 페이지를 해도 되고, 여기서는 코드가 넘어오는지만 확인할거기 때문에 따로 return 값을 두지는 않았음
  }

  @RequestMapping(value="/naverLogin.do", method=RequestMethod.GET)
  public String naverLogin(@RequestParam(value="code", required = false) String code, HttpServletResponse response) throws Throwable {

    System.out.println("code : "+code);
    String access_Token = naverLoginService.getAccessToken(code);
    Map userInfo = naverLoginService.getUserInfo(access_Token);
    if(userInfo.get("email")!=null) {
      Cookie cookie = new Cookie("User-Token",tokenService.createToken("LEE"));
      cookie.setPath("/");
      cookie.setMaxAge(60*60);
      response.addCookie(cookie);
    }
    else {
      response.setContentType("text/html; charset=euc-kr");
      PrintWriter out = response.getWriter();
      out.println("<script>alert('로그인에 실패했습니다');location.href='/'</script>");
      out.flush();
      return null;
    }
    return "redirect:/";
  }
}
