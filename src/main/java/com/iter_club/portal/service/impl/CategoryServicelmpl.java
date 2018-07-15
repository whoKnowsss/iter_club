package com.iter_club.portal.service.impl;




import com.iter_club.portal.dao.CategoryMapper;
import com.iter_club.portal.entity.Category;
import com.iter_club.portal.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by li on 2018/7
 */
@Service
public class CategoryServicelmpl implements CategoryService {
    @Autowired
    private CategoryMapper categoryMapper;

    @Override
    public int deleteByPrimaryKey(Integer ID) {
        return categoryMapper.deleteByPrimaryKey(ID);
    }

    @Override
    public int insert(Category record) {
        return categoryMapper.insert(record);
    }

    @Override
    public int insertSelective(Category record) {
        return categoryMapper.insertSelective(record);
    }


    @Override
    public Category selectByPrimaryKey(Integer ID) {
        return categoryMapper.selectByPrimaryKey(ID);
    }



    @Override
    public int updateByPrimaryKeySelective(Category record) {
        return categoryMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Category record) {
        return categoryMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<Category> selectAll() {
        return categoryMapper.selectAll();
    }
}
