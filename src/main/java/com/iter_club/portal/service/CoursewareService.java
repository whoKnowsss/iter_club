package com.iter_club.portal.service;


import com.iter_club.portal.entity.Courseware;

/**
 * Created by li on 2018/7
 */
public interface CoursewareService {
    int deleteByPrimaryKey(Integer ID);

    int insert(Courseware record);

    int insertSelective(Courseware record);

    Courseware selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(Courseware record);

    int updateByPrimaryKey(Courseware record);
}
