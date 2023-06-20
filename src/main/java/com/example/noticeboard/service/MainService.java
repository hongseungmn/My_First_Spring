package com.example.noticeboard.service;

import com.example.noticeboard.dto.FunctionalFoodListDTO;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public interface MainService {
  List<FunctionalFoodListDTO> printFoodList ();
}
