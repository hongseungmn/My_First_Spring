package com.example.noticeboard.mapper;

import com.example.noticeboard.dto.MemberDTO;
import com.example.noticeboard.dto.MemberInfoDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface LoginMapper {

  boolean findByIdAndPassword(MemberDTO map);

  MemberInfoDTO findMemberInfoById(String id);

  void updateMemberInfo(MemberInfoDTO dto);
}
