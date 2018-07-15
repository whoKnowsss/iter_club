package com.iter_club.forum.service;

import com.iter_club.forum.entity.Userforum;
import com.iter_club.forum.util.temp.PageObject;
import com.iter_club.forum.util.temp.UserViewModel;
import com.iter_club.forum.entity.UserExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2016-11-28.
 */
public interface UserforumService {
    int countByExample(UserExample example);

    int deleteByExample(UserExample example);

    int deleteByPrimaryKey(String id);

    int insert(Userforum record) throws Exception;
    Userforum check(String account, String pwd) throws Exception;

    int insertSelective(Userforum record);

    List<Userforum> selectByExample(UserExample example);

    Userforum selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") Userforum record, @Param("example") UserExample example);

    int updateByExample(@Param("record") Userforum record, @Param("example") UserExample example);

    int updateByPrimaryKeySelective(Userforum record);

    int updateByPrimaryKey(Userforum record);

    PageObject<UserViewModel> Get(String key, int index, int size);
}
