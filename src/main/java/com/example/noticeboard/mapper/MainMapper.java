package com.example.noticeboard.mapper;

import com.example.noticeboard.dto.FunctionalFoodListDTO;
import com.example.noticeboard.dto.MemberDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

@Mapper
public interface MainMapper {

  List<FunctionalFoodListDTO> selectFoodList(Map map);

  FunctionalFoodListDTO selectFoodOneByNo(Map map);

  int updateHitcount(String no);

  List selectHitCountList(String no);

  List selectDateList(String no);
}
