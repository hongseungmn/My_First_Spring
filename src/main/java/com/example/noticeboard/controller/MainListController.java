package com.example.noticeboard.controller;

import com.example.noticeboard.dto.FunctionalFoodListDTO;
import com.example.noticeboard.service.MainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

@Controller
public class MainListController {
  @Autowired
  MainService mainService;

  @RequestMapping("/hashtag.do")
  public String searchHome(Model model,
                           @RequestParam(required = false, value = "searchTags") String tags,
                           Map map ) {
    map.put("searchTags",tags.replace(",","").split("#"));
    List<FunctionalFoodListDTO> listData = mainService.selectFoodList(map);
    model.addAttribute("listData",listData);
    model.addAttribute("searchTags",tags);
    System.out.println(Arrays.toString(tags.replace(",", "").split("#")));
    return "Index";
  }
  @GetMapping("/detail.do")
  public String detailPage(Model model, Map map, @RequestParam String no) {
    map.put("no",Integer.parseInt(no));
    FunctionalFoodListDTO listOne = mainService.selectFoodOneByNo(map);
    model.addAttribute("listOne",listOne);
    return "Detail";
  }
  @RequestMapping("/Model.do")
  public String modelPage() {
    return "Model";
  }
  @GetMapping("/modelOCR.do")
  public String modelOCR() {
    return "OcrSearch";
  }
  @GetMapping("/magazine.do")
  public String magazine(@RequestParam String no) {
    return "slider/Magazine"+no;
  }

}
