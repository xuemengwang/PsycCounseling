package com.meng.service;

import com.meng.mapper.MessageMapper;
import com.meng.model.*;
import com.meng.util.MyConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @description:
 * @author: wangxuemeng
 * @create: 2018-04-08 15:39
 **/

@Service
public class MessageService {

    @Autowired
    MessageMapper messageMapper;


    public PageBean<Message> getMessageByUserIdAndPageId(int userId, Integer pageId) {
        //计算总页数
        int allPage = getCountMessageByUserId(userId) / MyConstant.PAGE_LENGTH_UC_CASE_LIST + 1;
        PageBean<Message> pageBean = new PageBean<>(allPage, pageId);
        //读取指定长度的消息列表
        List<Message> messages = messageMapper.MessageByUserIdAndLimit(userId,(pageId - 1) * MyConstant.PAGE_LENGTH_UC_CASE_LIST, MyConstant.PAGE_LENGTH_UC_CASE_LIST);

        pageBean.setList(messages);
        return pageBean;
    }

    private int getCountMessageByUserId(int userId) {
        MessageExample example = new MessageExample();
        MessageExample.Criteria criteria = example.createCriteria();
        criteria.andReceiveridEqualTo(userId);
        return messageMapper.countByExample(example);
    }

    public void addNewMessage(Message message) {
        messageMapper.insert(message);
    }
}
