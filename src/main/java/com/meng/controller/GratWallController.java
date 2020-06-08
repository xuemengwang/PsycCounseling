package com.meng.controller;

import com.meng.model.Gratwall;
import com.meng.model.PageBean;
import com.meng.model.User;
import com.meng.service.GratWallService;
import com.meng.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @description: 感恩墙
 * @author: wangxuemeng
 * @create: 2018-04-05 23:42
 **/

@Controller
@RequestMapping("gratwall")
public class GratWallController {
    @Autowired
    GratWallService gratWallService;
    @Autowired
    UserService userService;

    @RequestMapping({"/", "index"})
    public String index(Model model) {
//        List<Gratwall> gratwalls = gratWallService.getGratwallList();
//
//        model.addAttribute("gratwallList", gratwalls);

//        return "gratwall/index";
        return "redirect:1";
    }

    @RequestMapping("{pageId}")
    public String list(Model model,@PathVariable Integer pageId){

        PageBean<Gratwall> pageBean = gratWallService.getPageBeanByPageId(pageId);
        model.addAttribute("pageBean",pageBean);


        return "gratwall/index";
    }


    @RequestMapping("detail/{wallId}")
    public String detail(@PathVariable int wallId, Model model) {
        Gratwall gratwall = gratWallService.getGratwallById(wallId);
        User fromUser = userService.getUserById(gratwall.getFromId());
        gratwall.setFromUser(fromUser);
        model.addAttribute("gratwallDetail", gratwall);
        return "gratwall/detail";
    }

    @RequestMapping("write")

    public String write() {

        return "gratwall/write";
    }

    @RequestMapping("writeTo")
    @ResponseBody
    public void writeTo(Gratwall gratwall){
        System.out.println(gratwall.getToName());
        System.out.println(gratwall.getContent());
        gratWallService.insertGratwall(gratwall);

    }

    @RequestMapping("writeSuccess")
    public String writeSuccess() {

        return "gratwall/writeSuccess";
    }
}
