package com.example.noticeboard;

import com.example.noticeboard.dto.FunctionalFoodListDTO;
import com.example.noticeboard.service.MainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;
import java.util.Set;

@Controller
public class HomeController {
  @Autowired
  MainService mainService;
  @RequestMapping("/")
  public String home(Model model,Map map) {
    List<FunctionalFoodListDTO> listData = mainService.selectFoodList(map);
    model.addAttribute("listData",listData);
    return "Index";
  }


}
