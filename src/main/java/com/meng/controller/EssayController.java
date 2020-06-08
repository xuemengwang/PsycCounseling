package com.meng.controller;

import com.meng.model.Essay;
import com.meng.model.PageBean;
import com.meng.service.EssayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;

/**
 * @description: 文章
 * @author: wangxuemeng
 * @create: 2018-05-06 16:16
 **/

@Controller
@RequestMapping("essay")
public class EssayController {

    @Autowired
    private EssayService essayService;


    @RequestMapping({"/","index"})
    public String index(){
        return "redirect:list/0/1";
    }


    @RequestMapping("list/{type}/{pageId}")
    public String essayList(@PathVariable Integer type, @PathVariable Integer pageId, Model model) {
        model.addAttribute("type", type);
        PageBean<Essay> pageBean = essayService.getEssaysByTypeAndPageId(type,pageId);
        model.addAttribute("pageBean", pageBean);
        return "essay/list";
    }

    @RequestMapping("{essayId}")
    public String essay(@PathVariable Integer essayId,Model model) {
        Essay essay = essayService.getEssayById(essayId);
        //增加一次阅读量
        essayService.addOneClickRate(essayId);
        model.addAttribute("essay",essay);
        return "essay/detail";
    }

    @RequestMapping("add")
    public String add(String title, Byte label, String content) {
        Essay essay = new Essay();
        essay.setTitle(title);
        essay.setType(label);
        essay.setContent(content);
        essay.setTime(new Date().getTime());
        essay.setSource("525心理网");
        int id = essayService.addEssay(essay);
        return "redirect:" + id;
    }

}
