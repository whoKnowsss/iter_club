package com.iter_club.portal.controller;


import com.iter_club.portal.entity.School;
import com.iter_club.portal.service.SchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by li on 2018/7
 */
@Controller
@RequestMapping("/portal/school")
public class SchoolController {
    @Autowired
    private SchoolService schoolService;

    @RequestMapping("/deleteByPrimaryKey")
    public ModelAndView deleteByPrimaryKey(Integer ID){
        schoolService.deleteByPrimaryKey(ID);
        ModelAndView modelAndView = new ModelAndView();
        return modelAndView;
    }

    @RequestMapping("/insert")
    public ModelAndView insert(School record){
        schoolService.insert(record);
        ModelAndView modelAndView = new ModelAndView();
        return modelAndView;
    }

    @RequestMapping("/insertSelective")
    public ModelAndView insertSelective(School record){
        schoolService.insertSelective(record);
        ModelAndView modelAndView = new ModelAndView();
        return modelAndView;
    }

    @RequestMapping("/selectByPrimaryKey")
    public ModelAndView selectByPrimaryKey(Integer ID){
        schoolService.selectByPrimaryKey(ID);
        ModelAndView modelAndView = new ModelAndView();
        return modelAndView;
    }

    @RequestMapping("/updateByPrimaryKeySelective")
    public ModelAndView updateByPrimaryKeySelective(School record){
        schoolService.updateByPrimaryKeySelective(record);
        ModelAndView modelAndView = new ModelAndView();
        return modelAndView;
    }

    @RequestMapping("/updateByPrimaryKey")
    public ModelAndView updateByPrimaryKey(School record){
        schoolService.updateByPrimaryKey(record);
        ModelAndView modelAndView = new ModelAndView();
        return modelAndView;
    }

    @RequestMapping("/selectAll")
    public ModelAndView selectAll(){
        List<School> schools = schoolService.selectAll();

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("schools",schools);
        modelAndView.setViewName("school-list");

        return modelAndView;
    }
}
