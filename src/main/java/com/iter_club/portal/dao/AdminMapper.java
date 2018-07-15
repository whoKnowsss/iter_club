package com.iter_club.portal.dao;


import com.iter_club.portal.entity.Admin;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);
}