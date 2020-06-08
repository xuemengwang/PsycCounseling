package com.meng.service;

import com.meng.mapper.CazeMapper;
import com.meng.mapper.ProblemMapper;
import com.meng.mapper.ReplyMapper;
import com.meng.mapper.UserMapper;
import com.meng.model.*;
import com.meng.util.MyConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @description:
 * @author: wangxuemeng
 * @create: 2018-04-05 13:48
 **/

@Service
public class CazeService {

    @Autowired
    CazeMapper cazeMapper;
    @Autowired
    UserMapper userMapper;

    @Autowired
    ProblemMapper problemMapper;
    @Autowired
    ReplyMapper replyMapper;

    public void addNewCase(Caze caze, String content) {
        //为案件添加id
        Integer caseId = cazeMapper.getMaxId();
        if (caseId == null) caseId = 0;
        caseId = caseId + 1;
        caze.setId(caseId);
        //添加新案例
        cazeMapper.insertSelective(caze);
        //添加第一次咨询
        Problem problem = new Problem();
        problem.setCaseid(caseId);
        problem.setTime(new Date().getTime());
        problem.setContent(content);
        problemMapper.insertSelective(problem);
    }

    public PageBean<Caze> getCaseByUserIdAndPageId(Integer userId, Integer pageId) {
        //计算总页数
        int allPage = getCountOfCazeByUserId(userId) / MyConstant.PAGE_LENGTH_UC_CASE_LIST + 1;
        PageBean<Caze> pageBean = new PageBean<>(allPage, pageId);
        //读取指定长度的案件列表
        List<Caze> cazes = cazeMapper.selectCazeWithLimitAndOrderByTimeAndFromId((pageId - 1) * MyConstant.PAGE_LENGTH_UC_CASE_LIST, MyConstant.PAGE_LENGTH_UC_CASE_LIST, userId);
        for (Caze caze : cazes) {
            User user = userMapper.selectByPrimaryKey(caze.getReplyid());
            caze.setReplyUser(user);
        }
        pageBean.setList(cazes);
        return pageBean;
    }

    private int getCountOfCazeByUserId(Integer userId) {
        CazeExample example = new CazeExample();
        CazeExample.Criteria criteria = example.createCriteria();
        criteria.andFromidEqualTo(userId);
        return cazeMapper.countByExample(example);
    }

    public PageBean<Caze> getCaseByReplyerIdAndPageId(Integer userId, Integer pageId) {
        //计算总页数
        int allPage = getCountOfCazeByReplyerId(userId) / MyConstant.PAGE_LENGTH_UC_CASE_LIST + 1;
        PageBean<Caze> pageBean = new PageBean<>(allPage, pageId);
        //读取指定长度的案件列表
        List<Caze> cazes = cazeMapper.selectCazeWithLimitAndOrderByTimeAndReplyId((pageId - 1) * MyConstant.PAGE_LENGTH_UC_CASE_LIST, MyConstant.PAGE_LENGTH_UC_CASE_LIST, userId);
        for (Caze caze : cazes) {
            User user = userMapper.selectByPrimaryKey(caze.getFromid());
            caze.setFromUser(user);
        }
        pageBean.setList(cazes);
        return pageBean;
    }

    private int getCountOfCazeByReplyerId(Integer userId) {
        CazeExample example = new CazeExample();
        CazeExample.Criteria criteria = example.createCriteria();
        criteria.andReplyidEqualTo(userId);
        return cazeMapper.countByExample(example);
    }

    public PageBean<Caze> getUncaredCaseByFieldAndPageId(Byte field, Integer pageId) {
        //计算总页数
        int allPage = getCountOfUncaredCazeByField(field) / MyConstant.PAGE_LENGTH_UC_CASE_LIST + 1;
        PageBean<Caze> pageBean = new PageBean<>(allPage, pageId);
        //读取指定长度的案件列表
        List<Caze> cazes = cazeMapper.selectUncaredCazeWithLimitAndFieldAndOrderByTime((pageId - 1) * MyConstant.PAGE_LENGTH_UC_CASE_LIST, MyConstant.PAGE_LENGTH_UC_CASE_LIST, field);
        for (Caze caze : cazes) {
            User user = userMapper.selectByPrimaryKey(caze.getFromid());
            caze.setFromUser(user);
        }
        pageBean.setList(cazes);
        return pageBean;
    }

    private int getCountOfUncaredCazeByField(Byte field) {
        CazeExample example = new CazeExample();
        CazeExample.Criteria criteria = example.createCriteria();
        criteria.andFieldEqualTo(field);
        criteria.andReplyidIsNull();
        return cazeMapper.countByExample(example);
    }

    public List<Caze> selectLastSeveralCaze() {
        List<Caze> list = cazeMapper.selectCazeWithLimitAndOrderByTime(0, MyConstant.PAGE_LENGTH_CASE_INDEX);
        //根据caze中的咨询者和咨询师的id获取对于的人，放到caze中
        addFromUserAndReplyUser(list);
        return list;
    }

    public PageBean<Caze> getCazeByPageIdAndOrderByTime(int pageId) {
        //计算总页数
        int allPage = getCountOfCaze() / MyConstant.PAGE_LENGTH_CASE_LIST + 1;
        PageBean<Caze> pageBean = new PageBean<>(allPage, pageId);
        //按页获取案例集合
        List<Caze> list = cazeMapper.selectCazeWithLimitAndOrderByTime((pageId - 1) * MyConstant.PAGE_LENGTH_EXPERT_LIST, MyConstant.PAGE_LENGTH_EXPERT_LIST);
        //根据caze中的咨询者和咨询师的id获取对于的人，放到caze中
        addFromUserAndReplyUser(list);
        pageBean.setList(list);
        return pageBean;
    }

    //根据caze中的咨询者和咨询师的id获取对应的人，放到caze中
    private void addFromUserAndReplyUser(List<Caze> list) {
        User user = null;
        for (Caze caze : list) {
            user = userMapper.selectByPrimaryKey(caze.getFromid());
            caze.setFromUser(user);
            user = userMapper.selectByPrimaryKey(caze.getReplyid());
            caze.setReplyUser(user);
        }
    }

    private int getCountOfCaze() {
        return cazeMapper.countByExample(null);
    }

    public Caze getCazeById(int cazeId) {
        Caze caze = cazeMapper.selectByPrimaryKey(cazeId);
        User user = null;
        user = userMapper.selectByPrimaryKey(caze.getFromid());
        caze.setFromUser(user);
        user = userMapper.selectByPrimaryKey(caze.getReplyid());
        caze.setReplyUser(user);
        return caze;
    }

    public void addReplyUser(int cazeId, Integer userId) {
        Caze caze = cazeMapper.selectByPrimaryKey(cazeId);
        caze.setReplyid(userId);
        cazeMapper.updateByPrimaryKey(caze);
    }
}
