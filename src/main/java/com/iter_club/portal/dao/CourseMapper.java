package com.iter_club.portal.dao;


import com.iter_club.portal.entity.Course;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CourseMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(Course record);

    int insertSelective(Course record);

    Course selectByPrimaryKey(Integer ID);

    List<Course> selectByTeacher(int id);

    List<Course> selectByCategoryId(Integer ID);

    List<Course> selectByStatus(Integer ID);

    Course selectByName(String name);

    List<Course> search(String name);

    //    List<Course> selectByUsertocouStatus(Integer ID,Integer ID2);
    List<Course> selectSelective(Course course);

    List<Course> selectAll();

    int updateByPrimaryKeySelective(Course record);

    int updateByPrimaryKey(Course record);
}