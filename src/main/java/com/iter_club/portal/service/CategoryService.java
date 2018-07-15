package com.iter_club.portal.service;


import com.iter_club.portal.entity.Category;

import java.util.List;

/**
 * Created by li on 2018/7
 */
public interface CategoryService {

    int deleteByPrimaryKey(Integer ID);

    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);

    List<Category> selectAll();
}
