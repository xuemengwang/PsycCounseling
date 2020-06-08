package com.meng.controller;

import com.meng.model.User;
import com.meng.model.UserExample;
import com.meng.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * @description: 登陆注册相关
 * @author: wangxuemeng
 * @create: 2018-04-02 14:04
 **/
@Controller
public class LoginController {

    @Autowired
    UserService userService;

    @RequestMapping("login")
    public String login() {
        return "login";
    }

    @RequestMapping("login/check")
    @ResponseBody
    public Map<String, Object> loginCheck(Model model, String userName, String password, HttpServletRequest request) {

        Map result = userService.loginCheck(userName, password);
        if ( 1 == (int)result.get("status")) {                                                                          //登录成功,将当前用户的userid存入session中
            request.getSession().setAttribute("user",(User)result.get("user"));
        }
        return result;

    }

    @RequestMapping("register")
    public String register() {
        return "register/index";
    }

    @RequestMapping("register/user")
    public String registerForUser() {
        return "register/user";
    }

    @RequestMapping("register/expert")
    public String registerForExpert() {
        return "register/expert";
    }

    @RequestMapping("register/next")
    public String registerNext(Model model, User user) {
        model.addAttribute("user", user);
        return "register/next";
    }

    @RequestMapping("register/success")
    public String registerSuccess(Model model, User user) {
        userService.addNewUser(user);
        model.addAttribute("user", user);
        return "register/success";
    }

}
