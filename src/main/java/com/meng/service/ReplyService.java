package com.meng.service;

import com.meng.mapper.ReplyMapper;
import com.meng.model.Reply;
import com.meng.model.ReplyExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @description:
 * @author: wangxuemeng
 * @create: 2018-04-05 19:06
 **/

@Service
public class ReplyService {
    @Autowired
    ReplyMapper replyMapper;


    public Reply getReplyByProblemId(int problemId) {
        ReplyExample example = new ReplyExample();
        ReplyExample.Criteria criteria = example.createCriteria();
        criteria.andProblidEqualTo(problemId);
        //目前我们假设一个提问只有一个回答，故返回第一个回复即可
        List<Reply> replies = replyMapper.selectByExampleWithBLOBs(example);
        if (replies.size()>0){
            return replies.get(0);
        }
        return null;
    }

    public void addNewReply(Integer problemId, String content) {
        Reply reply = new Reply();
        reply.setProblid(problemId);
        reply.setContent(content);
        reply.setTime(new Date().getTime());
        replyMapper.insertSelective(reply);
    }
}
