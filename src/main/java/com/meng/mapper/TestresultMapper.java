package com.meng.mapper;

import com.meng.model.Testresult;
import com.meng.model.TestresultExample;
import org.apache.ibatis.annotations.Param;
import org.junit.Test;

import java.util.List;

public interface TestresultMapper {
    int countByExample(TestresultExample example);

    int deleteByExample(TestresultExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Testresult record);

    int insertSelective(Testresult record);

    List<Testresult> selectByExampleWithBLOBs(TestresultExample example);

    List<Testresult> selectByExample(TestresultExample example);

    Testresult selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Testresult record, @Param("example") TestresultExample example);

    int updateByExampleWithBLOBs(@Param("record") Testresult record, @Param("example") TestresultExample example);

    int updateByExample(@Param("record") Testresult record, @Param("example") TestresultExample example);

    int updateByPrimaryKeySelective(Testresult record);

    int updateByPrimaryKeyWithBLOBs(Testresult record);

    int updateByPrimaryKey(Testresult record);

}