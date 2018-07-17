package com.iter_club.forum.controller;

import com.iter_club.forum.dao.UserforumMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;

/**
 * Created by AsherLi
 */
@Controller
@RequestMapping(value="/forum/club")
public class ClubController {
    @Resource
    UserforumMapper _usermapper;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index() {
        return "forum/clubindex";
    }

}
