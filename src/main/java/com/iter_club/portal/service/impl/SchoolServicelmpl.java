package com.iter_club.portal.service.impl;




import com.iter_club.portal.dao.SchoolMapper;
import com.iter_club.portal.entity.School;
import com.iter_club.portal.service.SchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by li on 2018/7
 */
@Service
public class SchoolServicelmpl implements SchoolService {

    @Autowired
    private SchoolMapper schoolMapper;

    @Override
    public List<School> selectAll() {
        return schoolMapper.selectAll();
    }

    @Override
    public int deleteByPrimaryKey(Integer ID) {
        return schoolMapper.deleteByPrimaryKey(ID);
    }

    @Override
    public int insert(School record) {
        return schoolMapper.insert(record);
    }

    @Override
    public int insertSelective(School record) {
        return schoolMapper.insertSelective(record);
    }

    @Override
    public School selectByPrimaryKey(Integer ID) {
        return schoolMapper.selectByPrimaryKey(ID);
    }

    @Override
    public int updateByPrimaryKeySelective(School record) {
        return schoolMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(School record) {
        return schoolMapper.updateByPrimaryKey(record);
    }
}
