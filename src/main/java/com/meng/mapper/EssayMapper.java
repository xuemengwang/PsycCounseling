package com.meng.mapper;

import com.meng.model.Essay;
import com.meng.model.EssayExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EssayMapper {
    int countByExample(EssayExample example);

    int deleteByExample(EssayExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Essay record);

    int insertSelective(Essay record);

    List<Essay> selectByExampleWithBLOBs(EssayExample example);

    List<Essay> selectByExample(EssayExample example);

    Essay selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Essay record, @Param("example") EssayExample example);

    int updateByExampleWithBLOBs(@Param("record") Essay record, @Param("example") EssayExample example);

    int updateByExample(@Param("record") Essay record, @Param("example") EssayExample example);

    int updateByPrimaryKeySelective(Essay record);

    int updateByPrimaryKeyWithBLOBs(Essay record);

    int updateByPrimaryKey(Essay record);




    //    以下非逆向工程自动生成
    List<Essay> selectEssaysWithLimit(@Param("limit") int limit, @Param("offset") int offset);

    List<Essay> selectEssaysWithFieldAndLimit(@Param("type") Integer type, @Param("limit") int limit, @Param("offset") int offset);

}