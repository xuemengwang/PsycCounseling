package com.meng.controller;

import com.meng.model.Message;
import com.meng.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * @description: 消息相关
 * @author: wangxuemeng
 * @create: 2018-04-08 16:20
 **/

@Controller
public class MessageController {

    @Autowired
    MessageService messageService;

    @RequestMapping("sendMessage")
    @ResponseBody
    public void sendMessage(Integer receiverid,String title,String content){
        Message message = new Message();
        message.setReceiverid(receiverid);
        message.setTitle(title);
        message.setContent(content);
        message.setStatus((byte) 0);
        message.setTime(new Date().getTime());
        messageService.addNewMessage(message);
    }




}
