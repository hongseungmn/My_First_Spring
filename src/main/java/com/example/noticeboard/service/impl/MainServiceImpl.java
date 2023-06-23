package com.example.noticeboard.service.impl;

import com.example.noticeboard.dto.FunctionalFoodListDTO;
import com.example.noticeboard.mapper.MainMapper;
import com.example.noticeboard.service.MainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("mainService")
public class MainServiceImpl implements MainService {

  @Autowired
  MainMapper mainMapper;

  @Override
  public List<FunctionalFoodListDTO> selectFoodList(Map map) {
    List<FunctionalFoodListDTO> listDtos= mainMapper.selectFoodList(map);
    for( FunctionalFoodListDTO dto : listDtos) {
      System.out.println(dto.getProductName());
    }
    return listDtos;
  }

  @Override
  public FunctionalFoodListDTO selectFoodOneByNo(Map map) {
    FunctionalFoodListDTO dto = mainMapper.selectFoodOneByNo(map);
    return dto;
  }

  @Override
  public List selectHitCountList(String no) {
    return mainMapper.selectHitCountList(no);
  }

  @Override
  public List selectDateList(String no) {
    return mainMapper.selectDateList(no);
  }
}
