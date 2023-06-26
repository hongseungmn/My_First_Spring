package com.example.noticeboard.service;

import com.example.noticeboard.dto.MemberInfoDTO;

public interface MyInfoService {
  MemberInfoDTO findMemberInfoById(String id);

  void updateMemberInfo(MemberInfoDTO dto);
}
