package com.example.noticeboard.dto;


import lombok.*;
import org.apache.ibatis.type.Alias;

@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Alias("memberInfoDto")
public class MemberInfoDTO {
  private String id;
  private String pwd;
  private String nickname;
  private String email;
  private String address;
}
