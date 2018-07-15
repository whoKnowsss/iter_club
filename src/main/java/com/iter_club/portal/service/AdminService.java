package com.iter_club.portal.service;


import com.iter_club.portal.entity.Admin;

/**
 * Created by li on 2018/7
 */
public interface AdminService {
    int deleteByPrimaryKey(Integer ID);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);
}
