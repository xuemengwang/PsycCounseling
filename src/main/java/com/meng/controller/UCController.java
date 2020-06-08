package com.meng.controller;

import com.meng.model.Caze;
import com.meng.model.Message;
import com.meng.model.PageBean;
import com.meng.model.User;
import com.meng.service.CazeService;
import com.meng.service.MessageService;
import com.meng.service.UserService;
import com.meng.util.MyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @description: 用户个人中心相关
 * @author: wangxuemeng
 * @create: 2018-04-06 14:08
 **/

@Controller
@RequestMapping("uc")
public class UCController {

    @Autowired
    CazeService caseService;
    @Autowired
    UserService userService;
    @Autowired
    MessageService messageService;

    @RequestMapping({"/", "index"})
    public String index() {
        return "redirect:message";
    }

    @RequestMapping("message/{pageId}")
    public String message(@PathVariable Integer pageId,HttpServletRequest request,Model model) {
        Cookie userId = MyUtil.getCookie(request, "id");
        assert userId != null;
        PageBean<Message> pageBean = messageService.getMessageByUserIdAndPageId(Integer.parseInt(userId.getValue()), pageId);
        model.addAttribute("pageBean", pageBean);
        return "uc/message";
    }

    @RequestMapping("addEssay")
    public String addEssay() {

        return "uc/addEssay";
    }

    @RequestMapping("receiveCase/{pageId}")
    public String receiveCase(@PathVariable Integer pageId, HttpServletRequest request, Model model) {
        //获取该咨询师的领域
        Cookie userId = MyUtil.getCookie(request, "id");
        assert userId != null;
        Byte field = userService.getUserById(Integer.parseInt(userId.getValue())).getField();
        //根据领域查询无人受理的案例
        PageBean<Caze> pageBean = caseService.getUncaredCaseByFieldAndPageId(field, pageId);
        model.addAttribute("pageBean", pageBean);
        return "uc/receiveCase";
    }

    @RequestMapping("caseRecord/{pageId}")
    public String caseRecord(@PathVariable Integer pageId, HttpServletRequest request, Model model) {
        Cookie userId = MyUtil.getCookie(request, "id");
        assert userId != null;
        PageBean<Caze> pageBean = caseService.getCaseByUserIdAndPageId(Integer.parseInt(userId.getValue()), pageId);
        model.addAttribute("pageBean", pageBean);
        return "uc/caseRecord";
    }

    @RequestMapping("myPatientRecord/{pageId}")
    public String myPatientRecord(@PathVariable Integer pageId, HttpServletRequest request, Model model) {
        Cookie userId = MyUtil.getCookie(request, "id");
        assert userId != null;
        PageBean<Caze> pageBean = caseService.getCaseByReplyerIdAndPageId(Integer.parseInt(userId.getValue()), pageId);
        model.addAttribute("pageBean", pageBean);
        return "uc/myPatientRecord";
    }

    @RequestMapping("testRecord")
    public String testRecord() {

        return "uc/testRecord";
    }

    //页面跳转到更改密码处
    @RequestMapping("changePsw")
    public String changePsw() {
        return "uc/changePsw";
    }

    //更改密码请求
    @RequestMapping("updatePsw")
    @ResponseBody
    public Map<String,String> updatePsw(Integer userId, String oldPsw, String newPsw) {
        Map<String,String> map = new HashMap<>();
        boolean bool = userService.changePsw(userId,oldPsw,newPsw);
        if (bool){
            map.put("msg","修改成功");
        }else {
            map.put("msg","原密码错误");
        }
        return map;
    }

    @RequestMapping("profile")
    public String profile(Model model,HttpServletRequest request) {
        Integer userId = Integer.parseInt(MyUtil.getCookie(request,"id").getValue());
        User user = userService.getUserById(userId);
        model.addAttribute(user);
        return "uc/profile";
    }
    //修改个人资料
    @RequestMapping("updateProfile")
    @ResponseBody
    public void updateProfile(Integer userId,String name,Byte sex,Date borndate,String address,String introduction) {
        User user = userService.getUserById(userId);
        user.setName(name);
        user.setSex(sex);
        user.setBorndate(borndate);
        user.setAddress(address);
        user.setIntroduction(introduction);
        userService.updateUserById(user);
    }

}
