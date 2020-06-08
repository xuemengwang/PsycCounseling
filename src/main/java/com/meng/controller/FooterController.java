package com.meng.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @description: 页面底端跳转事件
 * @author: wangxuemeng
 * @create: 2018-05-21 10:35
 **/
@Controller
@RequestMapping("footer")
public class FooterController {
    @RequestMapping("aboutUs")
    public String about(){
        return "footer/aboutUs";
    }
    @RequestMapping("lawInformation")
    public String law(){
        return "footer/lawInformation";
    }

    @RequestMapping("contactUs")
    public String contact(){
        return "footer/contactUs";
    }

    @RequestMapping("friendLink")
    public String link(){
        return "footer/friendLink";
    }

}

