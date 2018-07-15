package com.iter_club.forum.service.Impl;

import com.iter_club.forum.util.temp.PageObject;
import com.iter_club.forum.util.temp.QuestionViewModel;
import com.iter_club.forum.dao.AnswerMapper;
import com.iter_club.forum.dao.QuestionMapper;
import com.iter_club.forum.dao.UserforumMapper;
import com.iter_club.forum.entity.*;
import com.iter_club.forum.service.LoginService;
import com.iter_club.forum.service.MessageService;
import com.iter_club.forum.service.QuestionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.UUID;

/**
 * Created by Administrator on 2016-12-01.
 */
@Service
public class QuestionServiceImpl implements QuestionService {

    @Resource
    QuestionMapper _mapper;

    @Resource
    LoginService loginService;

    @Resource
    AnswerMapper _answerMapper;
    @Resource
    UserforumMapper _userforumMapper;

    @Resource
    MessageService _msgService;

    public PageObject<QuestionViewModel> Get(String key, String type, int index, int size) {
        if(index == 0) index = 1;
        if(size ==0) size = 10;
        if(type == null) type="";

        QuestionExample exp = new QuestionExample();
        exp.setOrderByClause("stick desc,time desc");

        QuestionExample.Criteria criteria = exp.createCriteria();

        if(key != null && !key.equals(""))
        {
            criteria.andTitleLike(key);
        }

        if (type.equals("resolved")) {  //已解决
            criteria.andAcceptIsNotNull();
        } else if (type.equals("unresolved")) {  //未解决
            criteria.andAcceptIsNull();
        } else if (type.equals("wonderful")) {    //精帖
            criteria.andStatusGreaterThan(0);
        }

        PageObject<QuestionViewModel> obj = new PageObject<QuestionViewModel>();
        obj.size = size;
        obj.index = index;
        obj.setTotal(_mapper.countByExample(exp));

        int startindex = (index-1)*size;
        exp.setOffset(startindex);
        exp.setLimit(size);


        obj.objects =_mapper.getQuestionVMs(exp);

        return obj;
    }

    public String add(Question question) throws Exception {
        Userforum userforum = checkLogin();
        String id = UUID.randomUUID().toString();
        question.setUserid(userforum.getId());
        question.setTime(new Date());
        question.setId(id);
        _mapper.insertSelective(question);
        return id;
    }

    public String edit(Question question) throws Exception {

        _mapper.update(question);
        return "";
    }

    public void del(String id) throws Exception {
        Userforum userforum = checkLogin();
        if(userforum.getAuth() != 1)
        {
            throw new Exception("哇偶！快联系站长删除");
        }

        _mapper.deleteByPrimaryKey(id);
    }

    public void set(String id, String field, int rank) throws Exception {
        Userforum userforum = checkLogin();
        if(userforum.getAuth() != 1 && userforum.getAuth() != 2)
        {
            throw new Exception("哇偶！这是站长那帮人干的事");
        }

        QuestionExample exp = new QuestionExample();
        QuestionExample.Criteria criteria = exp.createCriteria();
        criteria.andIdEqualTo(id);

        Question question = _mapper.selectByPrimaryKey(id);

        if(field.equals("stick"))
        {
            question.setStick(rank);
        }
        else if(field.equals("status"))
        {
            question.setStatus(rank);
        }
        _mapper.updateByExampleSelective(question, exp);

    }

    public void delAnswer(String id) throws Exception {
        Userforum userforum = checkLogin();
        if(userforum.getAuth() != 1)
        {
            throw new Exception("哇偶！快联系站长删除");
        }

        _answerMapper.deleteByPrimaryKey(id);
    }

    public void accept(String id) throws Exception {
        Userforum userforum = checkLogin();
        Answer answer = _answerMapper.selectByPrimaryKey(id);

        if(userforum.getAuth() != 1 && userforum.getAuth()!= 2 && answer.getUserid() == userforum.getId() )
        {
            throw new Exception("哇偶！你无权干涉这个问题");
        }

        Question question = _mapper.selectByPrimaryKey(answer.getAnswerto());
        question.setAccept(answer.getId());

        _mapper.updateByPrimaryKey(question);

        userforum.setExperience(userforum.getExperience() + question.getExperience());
        _userforumMapper.updateByPrimaryKey(userforum);
    }

    public PageObject<QuestionViewModel> getbyuser(String uid, int index, int size) {
        if(index == 0) index = 1;
        if(size ==0) size = 10;

        QuestionExample exp = new QuestionExample();
        exp.setOrderByClause("time desc");

        QuestionExample.Criteria criteria = exp.createCriteria();
        criteria.andUseridEqualTo(uid);

        PageObject<QuestionViewModel> obj = new PageObject<QuestionViewModel>();
        obj.size = size;
        obj.index = index;
        obj.setTotal(_mapper.countByExample(exp));

        int startindex = (index-1)*size;
        exp.setOffset(startindex);
        exp.setLimit(size);


        obj.objects =_mapper.getQuestionVMs(exp);

        return obj;
    }

    public PageObject<QuestionViewModel> getByUserAnswer(String uid, int index, int size) {
        if(index == 0) index = 1;
        if(size ==0) size = 10;

        PageObject<QuestionViewModel> obj = new PageObject<QuestionViewModel>();
        obj.size = size;
        obj.index = index;
        obj.setTotal(_mapper.countByUserAnswer(uid));

        int startindex = (index-1)*size;
        obj.objects =_mapper.getByUserAnswer(uid, startindex, size);

        return obj;
    }

    public PageObject<QuestionViewModel> getHot(String key, int index, int size) {
        if(index == 0) index = 1;
        if(size ==0) size = 10;

        QuestionExample exp = new QuestionExample();
        exp.setOrderByClause("hits desc,time desc");

        if(key != null && !key.equals(""))
        {
            QuestionExample.Criteria criteria = exp.createCriteria();
            criteria.andTitleLike(key);
        }

        PageObject<QuestionViewModel> obj = new PageObject<QuestionViewModel>();
        obj.size = size;
        obj.index = index;
        obj.setTotal(_mapper.countByExample(exp));

        int startindex = (index-1)*size;
        exp.setOffset(startindex);
        exp.setLimit(size);


        obj.objects =_mapper.getQuestionVMs(exp);

        return obj;
    }

    public String addAnswer(String jid, String content) throws Exception {
        Userforum userforum = checkLogin();
        String id = addAnswer(jid, content, userforum);

        userforum.setAnswercnt(userforum.getAnswercnt() + 1);
        _userforumMapper.updateByPrimaryKey(userforum);

        QuestionExample exp = new QuestionExample();
        QuestionExample.Criteria criteria = exp.createCriteria();
        criteria.andIdEqualTo(jid);

        Question question = _mapper.selectByPrimaryKey(jid);
        question.setComment(question.getComment() + 1);
        _mapper.updateByExampleSelective(question, exp);

        _msgService.notify(userforum, question);
        return id;

    }

    private String addAnswer(String jid, String content, Userforum userforum) {
        String id = UUID.randomUUID().toString();
        Answer answer = new Answer();
        answer.setId(id);
        answer.setUserid(userforum.getId());
        answer.setContent(content);
        answer.setAnswerto(jid);
        answer.setTime(new Date());
        _answerMapper.insertSelective(answer);
        return id;
    }




    public QuestionViewModel Get(String id) {
        QuestionViewModel q = _mapper.getQuestionVM(id);
        q.answers = _answerMapper.getAnswerVMs(q.getId());
        addHitCnt(id);
        return q;
    }




    private Userforum checkLogin() throws Exception {
        Userforum userforum = loginService.get();
        if(userforum == null){
            throw new Exception("请先登录");
        }
        return userforum;
    }

    private void addHitCnt(String id){
        QuestionExample exp = new QuestionExample();
        QuestionExample.Criteria criteria = exp.createCriteria();
        criteria.andIdEqualTo(id);

        Question question = _mapper.selectByPrimaryKey(id);
        question.setHits(question.getHits() + 1);
        _mapper.updateByExampleSelective(question, exp);
    }
}
