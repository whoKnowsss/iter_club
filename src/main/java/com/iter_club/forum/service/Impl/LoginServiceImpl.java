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

/**
 * Created by Administrator on 2016-12-04.
 */
@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    HttpServletRequest request;

    @Resource
    UserforumService service;

    public Userforum get() {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {

                if (cookie.getName().equals(Const.COOKIE_LOGIN_USER)) {
                    String id = cookie.getValue();
                    if(id != null && !id.equals("")){
                        Userforum userforum = service.selectByPrimaryKey(id);
                        return userforum;
                    }
                }
            }
        }
        return null;
    }
}
