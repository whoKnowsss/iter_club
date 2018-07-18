package com.iter_club.portal.dao;

import com.iter_club.portal.entity.Teacher;
import org.springframework.stereotype.Repository;

@Repository

public interface TeacherMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(Teacher record);

    int insertSelective(Teacher record);

    Teacher selectByPrimaryKey(Integer ID);
    Teacher selectByUUID(String uuid);

    int updateByPrimaryKeySelective(Teacher record);

    int updateByPrimaryKey(Teacher record);
}