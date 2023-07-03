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
  private String company;
  private String name;
  private long postno;
  private Date postdate;
  private String expirationdate;
  private String shape;
  private String intake;
  private String packageway;
  private String preservation;
  private String caution;
  private String nutrient;
  private String material;
  private int hitcount;
  private String imgURL;
}
