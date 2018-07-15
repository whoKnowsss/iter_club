package com.iter_club.portal.service.impl;


import com.iter_club.portal.dao.UsertocouMapper;
import com.iter_club.portal.entity.Course;
import com.iter_club.portal.entity.Usertocou;
import com.iter_club.portal.service.UsertocouService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by li on 2018/7
 */
@Service
public class UsertocouServicelmpl implements UsertocouService {
    @Autowired
    private UsertocouMapper usertocouMapper;

    @Override
    public int insert(Integer UserId, Integer CourseId) {
        return usertocouMapper.insert(UserId, CourseId);
    }

    @Override
    public int deleteByPrimaryKey(Integer ID) {
        return usertocouMapper.deleteByPrimaryKey(ID);
    }

    @Override
    public List<Course> selectByUserStatus(Integer UserId, Integer Status) {
        return usertocouMapper.selectByUserStatus(UserId, Status);
    }

    @Override
    public List<Course> selectByUserID(Integer ID) {
        return usertocouMapper.selectByUserID(ID);
    }

    public Usertocou sellectByuidAndcid(Integer UserId, Integer cid) {
        return usertocouMapper.sellectByuidAndcid(UserId, cid);
    }
}
