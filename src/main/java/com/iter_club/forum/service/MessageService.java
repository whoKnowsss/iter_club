package com.iter_club.forum.service;

import com.iter_club.forum.entity.Userforum;
import com.iter_club.forum.util.temp.PageObject;
import com.iter_club.forum.entity.Message;
import com.iter_club.forum.entity.Question;

/**
 * Created by AsherLi
 */
public interface MessageService {
    void notify(Userforum userforum, Question question);

    PageObject<Message> get(String key, int index, int size) throws Exception;

    void del(String id);

    void delall() throws Exception;

}
