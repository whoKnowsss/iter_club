package com.iter_club.forum.service.Impl;

import com.iter_club.forum.entity.Userforum;
import com.iter_club.forum.util.MD5;
import com.iter_club.forum.util.temp.PageObject;
import com.iter_club.forum.util.temp.UserViewModel;
import com.iter_club.forum.dao.UserforumMapper;
import com.iter_club.forum.entity.UserExample;
import com.iter_club.forum.service.UserforumService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;

/**
 * Created by AsherLi
 */
@Service
public class UserforumServiceImpl implements UserforumService {
    @Resource
    UserforumMapper _mapper;

    public int countByExample(UserExample example) {
        return _mapper.countByExample(example);
    }

    public int deleteByExample(UserExample example) {
        return _mapper.deleteByExample(example);
    }

    public int deleteByPrimaryKey(String id) {
        return _mapper.deleteByPrimaryKey(id);
    }

    public int insert(Userforum record) throws Exception {
        UserExample exp = new UserExample();
        UserExample.Criteria criteria = exp.createCriteria();
        criteria.andAccountEqualTo(record.getAccount());
        if (countByExample(exp) > 0)
            throw new Exception("账号已存在");

        record.setId(UUID.randomUUID().toString());
        record.setPic(new Random().nextInt(9) + ".jpg");
        record.setCreatetime(new Date());
        return _mapper.insert(record);
    }

    public Userforum check(String account, String pwd) throws Exception {
        UserExample exp = new UserExample();
        UserExample.Criteria criteria = exp.createCriteria();
        criteria.andAccountEqualTo(account);

        List<Userforum> userforum = selectByExample(exp);
        if (userforum.isEmpty())
            throw new Exception("用户不存在");

        String md5pwd = MD5.Encode(pwd);
        if (!userforum.get(0).getPwd().equals(md5pwd)) {
            throw new Exception("密码错误");
        }
        return userforum.get(0);
    }

    public int insertSelective(Userforum record) {
        return _mapper.insertSelective(record);
    }

    public List<Userforum> selectByExample(UserExample example) {
        return _mapper.selectByExample(example);
    }

    public Userforum selectByPrimaryKey(String id) {
        return _mapper.selectByPrimaryKey(id);
    }

    public int updateByExampleSelective(@Param("record") Userforum record, @Param("example") UserExample example) {
        return _mapper.updateByExampleSelective(record, example);
    }

    public int updateByExample(@Param("record") Userforum record, @Param("example") UserExample example) {
        return _mapper.updateByExample(record, example);
    }

    public int updateByPrimaryKeySelective(Userforum record) {
        return _mapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(Userforum record) {
        return _mapper.updateByPrimaryKey(record);
    }

    public PageObject<UserViewModel> Get(String key, int index, int size) {
        if (index == 0) index = 1;
        if (size == 0) size = 10;

        UserExample exp = new UserExample();

        exp.setOrderByClause("createtime desc");
        if (key != null && !key.equals("")) {
            UserExample.Criteria criteria = exp.createCriteria();
            criteria.andNameEqualTo(key);
        }

        PageObject<UserViewModel> obj = new PageObject<UserViewModel>();
        obj.size = size;
        obj.index = index;
        obj.setTotal(_mapper.countByExample(exp));

        int startindex = (index - 1) * size;
        exp.setOffset(startindex);
        exp.setLimit(size);
        List<Userforum> userforums = _mapper.selectByExample(exp);
        if (userforums != null && userforums.size() > 0) {
            obj.objects = UserViewModel.From(userforums);
        }

        return obj;
    }
}
