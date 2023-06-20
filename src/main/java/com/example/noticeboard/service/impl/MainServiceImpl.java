package com.example.noticeboard.service.impl;

import com.example.noticeboard.dto.FunctionalFoodListDTO;
import com.example.noticeboard.mapper.MainMapper;
import com.example.noticeboard.service.MainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("mainService")
public class MainServiceImpl implements MainService {

  @Autowired
  MainMapper mainService;

  @Override
  public List<FunctionalFoodListDTO> printFoodList() {
    List<FunctionalFoodListDTO> listDtos= mainService.selectFoodList();
    for( FunctionalFoodListDTO dto : listDtos) {
      System.out.println(dto.getProductName());
    }
    return listDtos;
  }
}
