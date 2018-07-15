package com.iter_club.portal.dao;

import com.iter_club.portal.entity.Courseware;
import org.springframework.stereotype.Repository;

@Repository

public interface CoursewareMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(Courseware record);

    int insertSelective(Courseware record);

    Courseware selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(Courseware record);

    int updateByPrimaryKey(Courseware record);

}