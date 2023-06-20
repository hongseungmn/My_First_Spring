package com.example.noticeboard;

import com.example.noticeboard.dto.FunctionalFoodListDTO;
import com.example.noticeboard.service.MainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class HomeController {
  @Autowired
  MainService mainService;
  @RequestMapping("/")
  public String home(Model model) {
    List<FunctionalFoodListDTO> listData = mainService.printFoodList();
    model.addAttribute("listData",listData);
    return "Index";
  }
}
