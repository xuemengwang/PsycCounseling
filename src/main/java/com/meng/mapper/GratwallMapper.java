package com.meng.mapper;

import com.meng.model.Gratwall;
import com.meng.model.GratwallExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GratwallMapper {
    int countByExample(GratwallExample example);

    int deleteByExample(GratwallExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Gratwall record);

    int insertSelective(Gratwall record);

    List<Gratwall> selectByExampleWithBLOBs(GratwallExample example);

    List<Gratwall> selectByExample(GratwallExample example);

    Gratwall selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Gratwall record, @Param("example") GratwallExample example);

    int updateByExampleWithBLOBs(@Param("record") Gratwall record, @Param("example") GratwallExample example);

    int updateByExample(@Param("record") Gratwall record, @Param("example") GratwallExample example);

    int updateByPrimaryKeySelective(Gratwall record);

    int updateByPrimaryKeyWithBLOBs(Gratwall record);

    int updateByPrimaryKey(Gratwall record);


    /**
     * 根据limit和offset从数据库获取列表
     * @param limit 起始位
     * @param offset 偏移量
     * @return 列表
     */
    List<Gratwall> selectByLimit(@Param("limit") int limit, @Param("offset") int offset);
}