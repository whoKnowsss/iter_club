package com.iter_club.portal.service;

import com.iter_club.portal.entity.Course;


import java.util.List;

/**
 * Created by li on 2018/7
 */
public interface CourseService {
    int deleteByPrimaryKey(Integer ID);

    int insert(Course record);

    int insertSelective(Course record);

    Course selectByPrimaryKey(Integer ID);

    Course selectByName(String name);

    List<Course> selectByTeacher(int uuid);

    List<Course> selectByCategoryId(Integer ID);

    List<Course> selectSelective(Course course);

    List<Course> selectByStatus(Integer ID);

    List<Course> search(String name);
//    List<Course> selectByUsertocouStatus(Integer ID,Integer ID2);

    List<Course> selectAll();

    int updateByPrimaryKeySelective(Course record);

    int updateByPrimaryKey(Course record);
}
