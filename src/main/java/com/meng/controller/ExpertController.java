package com.meng.controller;

import com.meng.model.PageBean;
import com.meng.model.User;
import com.meng.service.ExpertService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @description: 与专家相关的controller
 * @author: wangxuemeng
 * @create: 2018-04-03 15:38
 **/
@Controller
@RequestMapping("expert")
public class ExpertController {

    @Autowired
    ExpertService expertService;

    @RequestMapping("list/{field}/{pageId}")
    public String expertList(@PathVariable Integer field, @PathVariable Integer pageId, Model model) {
        model.addAttribute("field", field);
        PageBean<User> pageBean = expertService.getExpertsByFieldAndPageId(field,pageId);
        model.addAttribute("pageBean", pageBean);
        return "expert/list";
    }

    @RequestMapping("{expertId}")
    public String expert(@PathVariable Integer expertId,Model model) {
        User expert = expertService.getExpertById(expertId);
        model.addAttribute("expert",expert);
        return "expert/profile";
    }


}
