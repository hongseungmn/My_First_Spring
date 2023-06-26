package com.example.noticeboard.service.impl;

import com.example.noticeboard.dto.MemberInfoDTO;
import com.example.noticeboard.mapper.LoginMapper;
import com.example.noticeboard.service.MyInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("myInfoService")
public class MyInfoServiceImpl implements MyInfoService {

  @Autowired
  LoginMapper loginMapper;

  @Override
  public MemberInfoDTO findMemberInfoById(String id) {
    return loginMapper.findMemberInfoById(id);
  }

  @Override
  public void updateMemberInfo(MemberInfoDTO dto) {
    loginMapper.updateMemberInfo(dto);
  }
}
