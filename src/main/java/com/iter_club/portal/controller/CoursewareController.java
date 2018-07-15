package com.iter_club.portal.controller;


import com.iter_club.portal.entity.Courseware;
import com.iter_club.portal.service.CoursewareService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by li on 2018/7
 */
@Controller
@RequestMapping("/portal/courseware")
public class CoursewareController {
    @Autowired
    private CoursewareService coursewareService;

    @RequestMapping("/deleteByPrimaryKey")
    public ModelAndView deleteByPrimaryKey(Integer ID){
        coursewareService.deleteByPrimaryKey(ID);
        ModelAndView modelAndView = new ModelAndView();
        return  modelAndView;
    }

    @RequestMapping("/insert")
    public ModelAndView insert(Courseware record){
        coursewareService.insert(record);
        ModelAndView modelAndView = new ModelAndView();
        return  modelAndView;
    }

    @RequestMapping("/insertSelective")
    public ModelAndView insertSelective(Courseware record){
        coursewareService.insertSelective(record);
        ModelAndView modelAndView = new ModelAndView();
        return  modelAndView;
    }

    @RequestMapping("/selectByPrimaryKey")
    public ModelAndView selectByPrimaryKey(Integer ID){
        coursewareService.selectByPrimaryKey(ID);
        ModelAndView modelAndView = new ModelAndView();
        return  modelAndView;
    }

    @RequestMapping("/updateByPrimaryKeySelective")
    public ModelAndView updateByPrimaryKeySelective(Courseware record){
        coursewareService.updateByPrimaryKeySelective(record);
        ModelAndView modelAndView = new ModelAndView();
        return  modelAndView;
    }

    @RequestMapping("/updateByPrimaryKey")
    public ModelAndView updateByPrimaryKey(Courseware record){
        coursewareService.updateByPrimaryKey(record);
        ModelAndView modelAndView = new ModelAndView();
        return  modelAndView;
    }
}
