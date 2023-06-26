package com.example.noticeboard.controller;

import com.example.noticeboard.dto.MemberInfoDTO;
import com.example.noticeboard.service.MyInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class MyPageController {
  @Autowired
  MyInfoService myInfoService;

  @RequestMapping("/MyPage.do")
  public String myPage(HttpServletRequest request) {
    String userid = request.getAttribute("UserId").toString();
    MemberInfoDTO memberInfoDTO = myInfoService.findMemberInfoById(userid);
    request.setAttribute("UserInfo",memberInfoDTO);
    return "board/MyPage";
  }
  @RequestMapping("/Edit.do")
  public String edit(MemberInfoDTO dto,HttpServletRequest request) {
    System.out.println(dto.getId()+dto.getAddress());
    myInfoService.updateMemberInfo(dto);
    request.setAttribute("UserInfo",dto);
    return "board/MyPage";
  }
}
