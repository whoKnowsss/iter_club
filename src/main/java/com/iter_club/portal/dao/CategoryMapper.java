package com.iter_club.portal.dao;


import com.iter_club.portal.entity.Category;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);

    List<Category> selectAll();
}