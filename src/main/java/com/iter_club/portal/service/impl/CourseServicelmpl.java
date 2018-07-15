package com.iter_club.portal.service.impl;


import com.iter_club.portal.dao.CourseMapper;
import com.iter_club.portal.entity.Course;
import com.iter_club.portal.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by li on 2018/7
 */
@Service
public class CourseServicelmpl implements CourseService {


    @Autowired
    private CourseMapper courseMapper;

//    @Override
//    public List<Course> selectByUsertocouStatus(Integer ID, Integer ID2) {
//        return courseMapper.selectByUsertocouStatus( ID, ID2);;
//    }


    @Override
    public List<Course> search(String name) {
        return courseMapper.search(name);
    }

    @Override
    public Course selectByName(String name) {
        return courseMapper.selectByName(name);
    }

    @Override
    public List<Course> selectByStatus(Integer ID) {
        return courseMapper.selectByStatus(ID);
    }


    @Override
    public List<Course> selectByCategoryId(Integer ID) {
        return courseMapper.selectByCategoryId(ID);
    }

    @Override
    public List<Course> selectSelective(Course course) {
        return courseMapper.selectSelective(course);
    }

    @Override
    public int deleteByPrimaryKey(Integer ID) {
        return courseMapper.deleteByPrimaryKey(ID);
    }

    @Override
    public int insert(Course record) {
        return courseMapper.insert(record);
    }

    @Override
    public int insertSelective(Course record) {
        return courseMapper.insertSelective(record);
    }

    @Override
    public Course selectByPrimaryKey(Integer ID) {
        return courseMapper.selectByPrimaryKey(ID);
    }

    @Override
    public List<Course> selectAll() {
        return courseMapper.selectAll();
    }

    @Override
    public int updateByPrimaryKeySelective(Course record) {
        return courseMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Course record) {
        return courseMapper.updateByPrimaryKey(record);
    }


    public List<Course> selectTop(int num) {
        List<Course> one = new ArrayList<Course>();
        for (int i=1;i<=num;i++){
            one.add(courseMapper.selectByPrimaryKey(i));
        }
        return  one;
    }

}
