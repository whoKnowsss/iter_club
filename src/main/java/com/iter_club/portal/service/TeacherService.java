package com.iter_club.portal.service;


import com.iter_club.portal.entity.Teacher;

/**
 * Created by li on 2018/7
 */
public interface TeacherService {
    int deleteByPrimaryKey(Integer ID);

    int insert(Teacher record);

    int insertSelective(Teacher record);

    Teacher selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(Teacher record);

    int updateByPrimaryKey(Teacher record);
}
