package com.iter_club.portal.dao;


import com.iter_club.portal.entity.Course;
import com.iter_club.portal.entity.Usertocou;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by li on 2018/7
 */
@Repository
public interface UsertocouMapper {

    List<Course> selectByUserID(Integer ID);

    int deleteByPrimaryKey(@Param("ID")Integer ID);
//    int insertSelective(Usertocou usertocou);

    int insert(@Param("UserId") Integer UserId, @Param("CourseId") Integer CourseId);

    List<Course> selectByUserStatus(@Param("UserId") Integer UserId, @Param("Status") Integer Status);

    Usertocou sellectByuidAndcid(@Param("UserId") Integer UserId, @Param("CourseId") Integer cid);
}
