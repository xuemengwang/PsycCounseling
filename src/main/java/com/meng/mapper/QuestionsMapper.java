package com.meng.mapper;

import com.meng.model.Questions;

import java.util.List;

public interface QuestionsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Questions record);

    int insertSelective(Questions record);

    Questions selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Questions record);

    int updateByPrimaryKey(Questions record);

    //add by administrator
    List<Questions> getMultiQuestionsByTestid(int testid);
}