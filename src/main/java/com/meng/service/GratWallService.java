package com.meng.service;

import com.meng.mapper.GratwallMapper;
import com.meng.mapper.UserMapper;
import com.meng.model.Gratwall;
import com.meng.model.PageBean;
import com.meng.model.User;
import com.meng.util.MyConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @description: 感恩墙相关service
 * @author: wangxuemeng
 * @create: 2018-04-13 21:45
 **/
@Service
public class GratWallService {
    @Autowired
    GratwallMapper gratwallMapper;
    @Autowired
    UserService userService;
    @Autowired
    UserMapper userMapper;

    public List<Gratwall> getGratwallList() {
//        GratwallExample example = new GratwallExample();
//        GratwallExample.Criteria criteria = example.createCriteria();
//        criteria.andFromIdBetween(1,9);
//        return gratwallMapper.selectByExampleWithBLOBs(example);
        List<Gratwall> gratwalls = gratwallMapper.selectByExampleWithBLOBs(null);
        for (Gratwall gratwall : gratwalls) {
            User fromUser = userService.getUserById(gratwall.getFromId());
            gratwall.setFromUser(fromUser);
        }
        return gratwalls;
    }


    public Gratwall getGratwallById(int wallId) {
        return gratwallMapper.selectByPrimaryKey(wallId);
    }

    //    public GratwallMapper getGratwallMapper() {
//        return gratwallMapper;
//    }
    public void insertGratwall(Gratwall gratwall) {
        gratwallMapper.insert(gratwall);
    }

    public PageBean<Gratwall> getPageBeanByPageId(Integer pageId) {
        //计算总页数
        int allPage = (int) Math.ceil(getCountOfGratwall() / (double) MyConstant.PAGE_LENGTH_GRATWALL_LIST);
        //得到感恩墙内容列表
        List<Gratwall> gratwallList = new ArrayList<>();
        gratwallList = gratwallMapper.selectByLimit((pageId - 1) * MyConstant.PAGE_LENGTH_GRATWALL_LIST, MyConstant.PAGE_LENGTH_GRATWALL_LIST);
        //为每一个感恩墙注入fromUser
        for (Gratwall gratwall : gratwallList) {
            int fromId = gratwall.getFromId();
            User fromUser = userService.getUserById(fromId);
            gratwall.setFromUser(fromUser);
        }

        PageBean<Gratwall> pageBean = new PageBean<>();
        pageBean.setCurPage(pageId);
        pageBean.setAllPage(allPage);
        pageBean.setList(gratwallList);
        return pageBean;
    }

    private int getCountOfGratwall() {
        return gratwallMapper.countByExample(null);
    }

}
