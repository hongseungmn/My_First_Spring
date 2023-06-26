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
    return mainMapper.selectFoodList(map);
  }

  @Override
  public FunctionalFoodListDTO selectFoodOneByNo(Map map) {
    mainMapper.updateHitcount(map.get("no").toString());
    return mainMapper.selectFoodOneByNo(map);
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
