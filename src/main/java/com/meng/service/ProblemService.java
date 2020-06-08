package com.meng.service;

import com.meng.mapper.ProblemMapper;
import com.meng.model.Problem;
import com.meng.model.ProblemExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @description:
 * @author: wangxuemeng
 * @create: 2018-04-05 19:05
 **/

@Service
public class ProblemService {

    @Autowired
    ProblemMapper problemMapper;

    public List<Problem> getByCaseId(int cazeId) {
        //按cazeId查找提问
        ProblemExample example = new ProblemExample();
        ProblemExample.Criteria criteria = example.createCriteria();
        criteria.andCaseidEqualTo(cazeId);
        return problemMapper.selectByExampleWithBLOBs(example);
    }

    public void addNewProblem(int cazeId, String content) {
        Problem problem = new Problem();
        problem.setCaseid(cazeId);
        problem.setContent(content);
        problem.setTime(new Date().getTime());
        problemMapper.insertSelective(problem);
    }
}
