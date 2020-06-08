package com.meng.mapper;

import com.meng.model.Psychtest;

import java.util.List;

public interface PsychtestMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Psychtest record);

    int insertSelective(Psychtest record);

    Psychtest selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Psychtest record);

    int updateByPrimaryKeyWithBLOBs(Psychtest record);

    int updateByPrimaryKey(Psychtest record);

	//add by administrator
	List<Psychtest> selectAllByType(int type);

}