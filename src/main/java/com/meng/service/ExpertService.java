package com.meng.service;

import com.meng.mapper.UserMapper;
import com.meng.model.PageBean;
import com.meng.model.User;
import com.meng.model.UserExample;
import com.meng.util.MyConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.List;

/**
 * @description: 专家相关服务
 * @author: wangxuemeng
 * @create: 2018-04-03 19:19
 **/

@Controller
public class ExpertService {

    @Autowired
    UserMapper userMapper;

    public List<User> getExpertsByField(int field) {
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        criteria.andRoleEqualTo(MyConstant.ROLE_EXPERT);
        if (field != MyConstant.FIELD_ALL) {
            criteria.andFieldEqualTo((byte) field);
        }
        return userMapper.selectByExampleWithBLOBs(example);
    }

    private int getCountOfExpertsByField(int field) {
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        criteria.andRoleEqualTo(MyConstant.ROLE_EXPERT);
        if (field != MyConstant.FIELD_ALL) {
            criteria.andFieldEqualTo((byte) field);
        }
        return userMapper.countByExample(example);
    }

    public PageBean<User> getExpertsByFieldAndPageId(Integer field, Integer pageId) {
        //计算总页数
        int allPage = (int)Math.ceil(getCountOfExpertsByField(field) / MyConstant.PAGE_LENGTH_EXPERT_LIST);
//        PageBean<User> pageBean = new PageBean<>(allPage, pageId);
        PageBean<User> pageBean = new PageBean<>();
        pageBean.setAllPage(allPage);
        pageBean.setCurPage(pageId);
        //读取指定长度的专家列表
        List<User> experts;
        if (field == MyConstant.FIELD_ALL) {
            experts = userMapper.selectExpertsWithLimit((pageId - 1) * MyConstant.PAGE_LENGTH_EXPERT_LIST, MyConstant.PAGE_LENGTH_EXPERT_LIST);
        } else {
            experts = userMapper.selectExpertsWithFieldAndLimit(field, (pageId - 1) * MyConstant.PAGE_LENGTH_EXPERT_LIST, MyConstant.PAGE_LENGTH_EXPERT_LIST);
        }
        pageBean.setList(experts);
        return pageBean;
    }


    public List<User> getExpertsForIndexPage() {
        return  userMapper.selectExpertsWithLimit(0, MyConstant.PAGE_LENGTH_EXPERT_INDEX);
    }

    public User getExpertById(Integer expertId) {
        return  userMapper.selectByPrimaryKey(expertId);
    }
}
