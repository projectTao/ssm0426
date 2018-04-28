package com.bdqn.controller;


import com.bdqn.dto.RealEstateDTO;
import com.bdqn.model.RealEstate;
import com.bdqn.service.EstateService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/estate")
public class EstateController {

    @Autowired
    private EstateService estateService;

    /**
     * 分页效果第一次访问初始
     * @param model
     * @return
     */
    @RequestMapping("/index")
    public String index(Model model){
        PageInfo <RealEstate> pageInfo = estateService.getAll();
        model.addAttribute("page",pageInfo);
        return "estateList";
    }


    /**
     * 分页方法
     * @param dto
     * @param model
     * @return
     */
    @RequestMapping("/page")
    public String page(RealEstateDTO dto ,Model model){
        PageInfo<RealEstate> pageInfo = estateService.listPage(dto);
        model.addAttribute("inputStr",dto.getInputValue());
        model.addAttribute("type",dto.getType());
        model.addAttribute("page",pageInfo);
        return "estateList";
    }
}
