package com.iter_club.portal.service.impl;




import com.iter_club.portal.dao.CoursewareMapper;
import com.iter_club.portal.entity.Courseware;
import com.iter_club.portal.service.CoursewareService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by li on 2018/7
 */
@Service
public class CoursewareServicelmpl implements CoursewareService {
    @Autowired
    private CoursewareMapper coursewareMapper;

    @Override
    public int deleteByPrimaryKey(Integer ID) {
        return coursewareMapper.deleteByPrimaryKey(ID);
    }

    @Override
    public int insert(Courseware record) {
        return coursewareMapper.insert(record);
    }

    @Override
    public int insertSelective(Courseware record) {
        return coursewareMapper.insertSelective(record);
    }

    @Override
    public Courseware selectByPrimaryKey(Integer ID) {
        return coursewareMapper.selectByPrimaryKey(ID);
    }

//    @Override
//    public Courseware selectAll() {
//        return coursewareMapper.selectAll();
//    }

    @Override
    public int updateByPrimaryKeySelective(Courseware record) {
        return coursewareMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Courseware record) {
        return coursewareMapper.updateByPrimaryKey(record);
    }
}
