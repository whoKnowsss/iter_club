package com.iter_club.forum.dao;

import com.iter_club.forum.entity.Donate;
import com.iter_club.forum.entity.DonateExample;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DonateMapper {
    int countByExample(DonateExample example);

    int deleteByExample(DonateExample example);

    int deleteByPrimaryKey(String id);

    int insert(Donate record);

    int insertSelective(Donate record);

    List<Donate> selectByExample(DonateExample example);

    Donate selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") Donate record, @Param("example") DonateExample example);

    int updateByExample(@Param("record") Donate record, @Param("example") DonateExample example);

    int updateByPrimaryKeySelective(Donate record);

    int updateByPrimaryKey(Donate record);
}