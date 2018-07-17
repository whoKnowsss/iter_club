package com.iter_club.forum.service.Impl;

import com.iter_club.forum.util.temp.PageObject;
import com.iter_club.forum.dao.MessageMapper;
import com.iter_club.forum.entity.*;
import com.iter_club.forum.service.LoginService;
import com.iter_club.forum.service.MessageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.UUID;

/**
 * Created by AsherLi
 */
@Service
public class MessageServiceImpl implements MessageService {

    @Resource
    MessageMapper _mapper;

    @Resource
    LoginService  _loginService;

    /**
     * 通知问题被别人回复
     * @param userforum
     * @param question
     */
    public void notify(Userforum userforum, Question question) {
        if(userforum.getId().equals(question.getUserid())) {  //自己回复自己的问题
            return;
        }
        Message msg = new Message();
        msg.setId(UUID.randomUUID().toString());
        msg.setTo(question.getUserid());
        msg.setContent(userforum.getName() +"回复了" + question.getTitle());
        msg.setTime(new Date());
        msg.setType("系统消息");
        msg.setFrom("system");
        msg.setFromname("系统");
        msg.setTitle("通知");
        msg.setHref("/questions/detail?id=" + question.getId());


        _mapper.insertSelective(msg);
    }

    public PageObject<Message> get(String key, int index, int size) throws Exception {
        Userforum userforum = _loginService.get();
        if(userforum == null)
            throw new Exception("亲！等个录先~~");

        if(index == 0) index = 1;
        if(size ==0) size = 10;

        MessageExample exp = new MessageExample();

        exp.setOrderByClause("time desc");
        if(key != null && !key.equals(""))
        {
            MessageExample.Criteria criteria = exp.createCriteria();
            criteria.andContentEqualTo(key);
        }

        PageObject<Message> obj = new PageObject<Message>();
        obj.size = size;
        obj.index = index;
        obj.setTotal(_mapper.countByExample(exp));

        int startindex = (index-1)*size;
        exp.setOffset(startindex);
        exp.setLimit(size);
        obj.objects = _mapper.selectByExample(exp);

        return obj;
    }

    public void del(String id) {
        _mapper.deleteByPrimaryKey(id);
    }

    public void delall() throws Exception {
        MessageExample exp = new MessageExample();
        Userforum userforum = _loginService.get();
        if(userforum == null)
            throw new Exception("亲！等个录先~~");

        _mapper.deleteByUser(userforum.getId());
    }
}
