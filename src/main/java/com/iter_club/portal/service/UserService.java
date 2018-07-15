package com.iter_club.portal.service;


import com.iter_club.portal.entity.User;

/**
 * Description
 * Author li
 * Date 2018/7
 * Version 1.0
 */
public interface UserService {


    public int deleteByPrimaryKey(Integer ID);

    public int insert(User record);

    public int insertSelective(User record);

    User selectByUUID(String uuid);
    public User selectByPrimaryKey(Integer ID);

    public int updateByPrimaryKeySelective(User record);

    public int updateByPrimaryKey(User record);

    public User selectByEmail(String email);
}
