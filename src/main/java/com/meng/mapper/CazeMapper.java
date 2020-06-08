package com.meng.mapper;

import com.meng.model.Caze;
import com.meng.model.CazeExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CazeMapper {
    int countByExample(CazeExample example);

    int deleteByExample(CazeExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Caze record);

    int insertSelective(Caze record);

    List<Caze> selectByExample(CazeExample example);

    Caze selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Caze record, @Param("example") CazeExample example);

    int updateByExample(@Param("record") Caze record, @Param("example") CazeExample example);

    int updateByPrimaryKeySelective(Caze record);

    int updateByPrimaryKey(Caze record);





    //以下内容非mybatis逆向工程自动生成
    Integer getMaxId();

    List<Caze> selectCazeWithLimitAndOrderByTime(@Param("limit") int limit, @Param("offset") int offset);

    List<Caze> selectCazeWithLimitAndOrderByTimeAndFromId(@Param("limit") int limit, @Param("offset") int offset,@Param("fromid") Integer userId);

    List<Caze> selectCazeWithLimitAndOrderByTimeAndReplyId(@Param("limit") int limit, @Param("offset") int offset,@Param("replyid") Integer userId);

    List<Caze> selectUncaredCazeWithLimitAndFieldAndOrderByTime(@Param("limit") int limit, @Param("offset") int offset, @Param("field") Byte field);

}