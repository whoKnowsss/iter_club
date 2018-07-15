package com.iter_club.portal.service.impl;


import com.iter_club.portal.dao.UserMapper;
import com.iter_club.portal.entity.User;
import com.iter_club.portal.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Description
 * Author li
 * Date 2018/7
 * Version 1.0
 */
@Service
public class UserServiceImpl implements UserService {


    @Autowired
    private UserMapper userMapper;


    @Override
    public int deleteByPrimaryKey(Integer ID) {
        return userMapper.deleteByPrimaryKey(ID);
    }

    @Override
    public User selectByUUID(String uuid) {
        return userMapper.selectByUUID(uuid);
    }

    @Override
    public int insert(User record) {
        return userMapper.insert(record);
    }

    @Override
    public int insertSelective(User record) {
        return userMapper.insertSelective(record);
    }

    @Override
    public User selectByPrimaryKey(Integer ID) {
        return userMapper.selectByPrimaryKey(ID);
    }

    @Override
    public int updateByPrimaryKeySelective(User record) {
        return userMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(User record) {
        return userMapper.updateByPrimaryKey(record);
    }

    @Override
    public User selectByEmail(String email) {
        return userMapper.selectByEmail(email);
    }
}
