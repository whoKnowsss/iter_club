package com.iter_club.forum.service.Impl;

import com.iter_club.forum.util.Const;
import com.iter_club.forum.entity.Userforum;
import com.iter_club.forum.service.LoginService;
import com.iter_club.forum.service.UserforumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by AsherLi
 */
@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
//    HttpServletRequest request;

    @Resource
    UserforumService service;

    public Userforum get() {
//        HttpSession session = request.getSession();
//        Userforum userforum = (Userforum) session.getAttribute("userforum");
//        return userforum;
        return null;
    }
}
