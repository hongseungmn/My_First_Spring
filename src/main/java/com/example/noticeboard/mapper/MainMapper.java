package com.example.noticeboard.mapper;

import com.example.noticeboard.dto.FunctionalFoodListDTO;
import com.example.noticeboard.dto.MemberDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MainMapper {

  List<FunctionalFoodListDTO> selectFoodList();
}
