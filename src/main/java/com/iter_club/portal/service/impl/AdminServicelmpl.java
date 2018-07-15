package com.iter_club.portal.service.impl;




import com.iter_club.portal.dao.AdminMapper;
import com.iter_club.portal.entity.Admin;
import com.iter_club.portal.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by li on 2018/7
 */
@Service
public class AdminServicelmpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;

    @Override
    public int deleteByPrimaryKey(Integer ID) {
        return adminMapper.deleteByPrimaryKey(ID);
    }

    @Override
    public int insert(Admin record) {
        return adminMapper.insert(record);
    }

    @Override
    public int insertSelective(Admin record) {
        return adminMapper.insertSelective(record);
    }

    @Override
    public Admin selectByPrimaryKey(Integer ID) {
        return adminMapper.selectByPrimaryKey(ID);
    }

    @Override
    public int updateByPrimaryKeySelective(Admin record) {
        return adminMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Admin record) {
        return adminMapper.updateByPrimaryKey(record);
    }
}
