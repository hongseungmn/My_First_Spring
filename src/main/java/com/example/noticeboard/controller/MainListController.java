package com.example.noticeboard.controller;

import com.example.noticeboard.dto.FunctionalFoodListDTO;
import com.example.noticeboard.service.MainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
public class MainListController {
  @Autowired
  MainService mainService;

  @RequestMapping("/hashtag.do")
  public String searchHome(Model model, @RequestParam(required = false, value = "searchTags") String tags,Map map ) {
    map.put("searchTags",tags.split("#"));
    List<FunctionalFoodListDTO> listData = mainService.selectFoodList(map);
    for(FunctionalFoodListDTO dto : listData) {
      System.out.println("dto.getOtherText()"+dto.getOtherText());
    }
    model.addAttribute("listData",listData);
    return "Index";
  }
  @GetMapping("/detail.do")
  public String detailPage(Model model, Map map, @RequestParam String no) {
    map.put("no",Integer.parseInt(no));
    FunctionalFoodListDTO listOne = mainService.selectFoodOneByNo(map);
    System.out.println("listOne.getProductName() : "+listOne.getProductName());
    model.addAttribute("listOne",listOne);
    return "Detail";
  }
}
