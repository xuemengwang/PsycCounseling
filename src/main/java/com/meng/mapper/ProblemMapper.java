package com.meng.mapper;

import com.meng.model.Problem;
import com.meng.model.ProblemExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProblemMapper {
    int countByExample(ProblemExample example);

    int deleteByExample(ProblemExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Problem record);

    int insertSelective(Problem record);

    List<Problem> selectByExampleWithBLOBs(ProblemExample example);

    List<Problem> selectByExample(ProblemExample example);

    Problem selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Problem record, @Param("example") ProblemExample example);

    int updateByExampleWithBLOBs(@Param("record") Problem record, @Param("example") ProblemExample example);

    int updateByExample(@Param("record") Problem record, @Param("example") ProblemExample example);

    int updateByPrimaryKeySelective(Problem record);

    int updateByPrimaryKeyWithBLOBs(Problem record);

    int updateByPrimaryKey(Problem record);
}