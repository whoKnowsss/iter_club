package com.iter_club.portal.service.impl;


import com.iter_club.portal.dao.TeacherMapper;
import com.iter_club.portal.entity.Teacher;
import com.iter_club.portal.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by li on 2018/7
 */
@Service
public class TeacherServicelmpl implements TeacherService {
    @Autowired
    private TeacherMapper teacherMapper;

    @Override
    public int deleteByPrimaryKey(Integer ID) {
        return teacherMapper.deleteByPrimaryKey(ID);
    }

    @Override
    public int insert(Teacher record) {
        return teacherMapper.insert(record);
    }

    @Override
    public int insertSelective(Teacher record) {
        return teacherMapper.insertSelective(record);
    }

    @Override
    public Teacher selectByPrimaryKey(Integer ID) {
        return teacherMapper.selectByPrimaryKey(ID);
    }

    @Override
    public int updateByPrimaryKeySelective(Teacher record) {
        return teacherMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Teacher record) {
        return teacherMapper.updateByPrimaryKey(record);
    }

    public Teacher selectByUUID(String uuid) {
        return teacherMapper.selectByUUID(uuid);
    }
}
