package com.meng.controller;

import com.meng.model.Caze;
import com.meng.model.User;
import com.meng.service.CazeService;
import com.meng.service.ExpertService;
import com.meng.service.UserService;
import com.meng.util.MyConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @description: 心理咨询相关模块
 * @author: wangxuemeng
 * @create: 2018-04-04 13:59
 **/

@Controller
@RequestMapping("ask")
public class AskController {

    @Autowired
    UserService userService;
    @Autowired
    ExpertService expertService;
    @Autowired
    CazeService caseService;

    @RequestMapping({"/", "index"})
    public String index() {

        return "ask/index";
    }

    @RequestMapping("{expertId}")
    public String to(@PathVariable int expertId, Model model) {
        User expert = userService.getUserById(expertId);
        model.addAttribute("expert", expert);
        return "ask/to";
    }

    @RequestMapping("tel")
    public String tel(Model model) {
        //获取所有专家
        List<User> allExpert = expertService.getExpertsByField(MyConstant.FIELD_ALL);
        //随机选取需要的三名专家，随机数(0~N-1)：(int)(Math.random()*N))
        List<User> list = new ArrayList<>();
        list.add(allExpert.get((int) (Math.random() * allExpert.size())));
        list.add(allExpert.get((int) (Math.random() * allExpert.size())));
        list.add(allExpert.get((int) (Math.random() * allExpert.size())));
        model.addAttribute("expertList", list);
        return "ask/tel";
    }

    @RequestMapping("success")
    public String success(Model model, String title, String problem,int fromId, int field,
                          @RequestParam(value = "replyId", required = false) Integer replyId) {
        Caze caze = new Caze();
        caze.setFromid(fromId);
        caze.setTime(new Date().getTime());
        caze.setTitle(title);
        caze.setField((byte) field);
        if (replyId != null){
            //如果replyId不为空，说明是向指定人提问
            caze.setReplyid(replyId);
        }else{
            //如果replyId为空，说明是向指定领域人提问,添加新消息给指定领域专家
            //todo 添加新消息给指定领域专家
        }
        caseService.addNewCase(caze,problem);
        model.addAttribute("expertId",replyId);
        return "ask/success";
    }


}
