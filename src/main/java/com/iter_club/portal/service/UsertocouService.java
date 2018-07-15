package com.iter_club.portal.service;



import com.iter_club.portal.entity.Course;
import com.iter_club.portal.entity.Usertocou;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by li on 2018/7
 */

public interface UsertocouService {

    List<Course> selectByUserID(Integer ID);

    int insert(Integer UserId, Integer CourseId);

    int deleteByPrimaryKey(Integer ID);

   // int insert(@Param("UserId")Integer UserId, @Param("CourseId")Integer CourseId);
   List<Course> selectByUserStatus(Integer UserId, Integer Status);
    Usertocou sellectByuidAndcid( Integer UserId,  Integer cid);
}
