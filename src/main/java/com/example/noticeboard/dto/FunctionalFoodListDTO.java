package com.example.noticeboard.dto;

import lombok.*;
import org.apache.ibatis.type.Alias;

import java.sql.Date;


@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Alias("functionalFoodListDto")
public class FunctionalFoodListDTO {
  private int no;
  private String marketName;
  private String productName;
  private String postNo;
  private Date postDate;
  private String expirationDate;
  private String data;
  private String intake;
  private String packageWay;
  private String preservation;
  private String caution;
  private String otherText;
  private String standard;
  private String imgURL;
}
