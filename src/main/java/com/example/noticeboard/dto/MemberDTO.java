package com.example.noticeboard.dto;


import lombok.*;
import org.apache.ibatis.type.Alias;
import org.springframework.core.annotation.AliasFor;

@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Alias("memberDto")
public class MemberDTO {
  private String id;
  private String pwd;
}
