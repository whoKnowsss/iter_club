package com.iter_club.portal.dao;

import com.iter_club.portal.entity.School;
import org.springframework.stereotype.Repository;


import java.util.List;

@Repository
public interface SchoolMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(School record);

    int insertSelective(School record);

    School selectByPrimaryKey(Integer ID);

    List<School> selectAll();

    int updateByPrimaryKeySelective(School record);

    int updateByPrimaryKey(School record);
}