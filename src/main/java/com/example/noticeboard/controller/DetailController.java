package com.example.noticeboard.controller;

import com.example.noticeboard.service.MainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class DetailController {

  @Autowired
  private MainService mainService;
  @PostMapping ("/LineGraphArray.do")
  public @ResponseBody Map<String,List> getChartData(@RequestBody Map map) {
    System.out.println("productNo : "+map.get("productNo"));
    List list = mainService.selectHitCountList(map.get("productNo").toString());
    List dateList = mainService.selectDateList(map.get("productNo").toString());
    Map<String, List> graphDateMap = new HashMap<>();
    graphDateMap.put("hitList",list);
    graphDateMap.put("dateList",dateList);
    return graphDateMap;
  }
}
