package com.iter_club.portal.service;


import com.iter_club.portal.entity.School;

import java.util.List;

/**
 * Created by li on 2018/7
 */
public interface SchoolService {
    int deleteByPrimaryKey(Integer ID);

    int insert(School record);

    int insertSelective(School record);

    School selectByPrimaryKey(Integer ID);

    List<School> selectAll();

    int updateByPrimaryKeySelective(School record);

    int updateByPrimaryKey(School record);
}
