package com.meng.service;

import com.meng.mapper.EssayMapper;
import com.meng.model.*;
import com.meng.util.MyConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @description:
 * @author: wangxuemeng
 * @create: 2018-05-06 16:20
 **/

@Service
public class EssayService {

    @Autowired
    private EssayMapper essayMapper;

    private int getCountOfEssayByField(int field) {
        EssayExample example = new EssayExample();
        EssayExample.Criteria criteria = example.createCriteria();
        if (field != MyConstant.ESSAY_FIELD_ALL) {
            criteria.andTypeEqualTo((byte) field);
        }
        return essayMapper.countByExample(example);
    }

    public PageBean<Essay> getEssaysByTypeAndPageId(Integer type, Integer pageId) {
        //计算总页数
        int allPage = (int)Math.ceil(getCountOfEssayByField(type) / (double)MyConstant.PAGE_LENGTH_ESSAY_LIST);
        PageBean<Essay> pageBean = new PageBean<>(allPage, pageId);
        //读取指定长度的文章列表
        List<Essay> essays;
        if (type == MyConstant.FIELD_ALL) {
            essays = essayMapper.selectEssaysWithLimit((pageId - 1) * MyConstant.PAGE_LENGTH_ESSAY_LIST, MyConstant.PAGE_LENGTH_ESSAY_LIST);
        } else {
            essays = essayMapper.selectEssaysWithFieldAndLimit(type, (pageId - 1) * MyConstant.PAGE_LENGTH_ESSAY_LIST, MyConstant.PAGE_LENGTH_ESSAY_LIST);
        }
        pageBean.setList(essays);
        return pageBean;
    }

    public Essay getEssayById(Integer essayId) {
        return essayMapper.selectByPrimaryKey(essayId);
    }

    public void addOneClickRate(Integer essayId){
        Essay essay = getEssayById(essayId);
        essay.setClickrate(essay.getClickrate() + 1);
        essay.setContent(null);
        essayMapper.updateByPrimaryKeySelective(essay);
    }

    /**
     * 添加文章
     * @param essay
     * @return 文章编号
     */
    public int addEssay(Essay essay) {
        essayMapper.insertSelective(essay);
        return essay.getId();
    }
}
