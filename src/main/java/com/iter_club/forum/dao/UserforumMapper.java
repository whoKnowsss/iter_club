package com.iter_club.forum.dao;

import com.iter_club.forum.entity.UserExample;
import com.iter_club.forum.entity.Userforum;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserforumMapper {
    int countByExample(UserExample example);

    int deleteByExample(UserExample example);

    int deleteByPrimaryKey(String id);

    int insert(Userforum record);

    int insertSelective(Userforum record);

    List<Userforum> selectByExample(UserExample example);

    Userforum selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") Userforum record, @Param("example") UserExample example);

    int updateByExample(@Param("record") Userforum record, @Param("example") UserExample example);

    int updateByPrimaryKeySelective(Userforum record);

    int updateByPrimaryKey(Userforum record);
}