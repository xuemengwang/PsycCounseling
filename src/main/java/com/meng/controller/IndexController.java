package com.meng.controller;

import com.meng.model.User;
import com.meng.service.ExpertService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @description: 主页相关页面处理
 * @author: wangxuemeng
 * @create: 2018-04-02 13:35
 **/
@Controller
public class IndexController {

    @Autowired
    ExpertService expertService;


    @RequestMapping({"/","index"})
    public String index(Model model){
        List<User> expertList = expertService.getExpertsForIndexPage();
        model.addAttribute("expertList",expertList);

        return "index";
    }





}
