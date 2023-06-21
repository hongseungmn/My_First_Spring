package com.example.noticeboard.service;

import com.example.noticeboard.dto.FunctionalFoodListDTO;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

public interface MainService {
  List<FunctionalFoodListDTO> selectFoodList (Map map);
  FunctionalFoodListDTO selectFoodOneByNo(Map map);
}
