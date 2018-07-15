package com.iter_club.portal.dao;


import com.iter_club.portal.entity.Course;
import com.iter_club.portal.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer ID);


    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User selectByEmail(String email);

    User selectByUUID(String uuid);

    List<Course> selectByStatus(Integer ID);
}