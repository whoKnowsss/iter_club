package com.iter_club.portal.controller;


import com.iter_club.portal.entity.Teacher;
import com.iter_club.portal.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by li on 2018/7
 */
@Controller
@RequestMapping("/portal/teacher")
public class TeacherController {
    @Autowired
    private TeacherService teacherService;

    @RequestMapping("/deleteByPrimaryKey")
    public ModelAndView deleteByPrimaryKey(Integer ID){
        teacherService.deleteByPrimaryKey(ID);
        ModelAndView modelAndView = new ModelAndView();
        return modelAndView;
    }

    @RequestMapping("/insert")
    public ModelAndView insert(Teacher record){
        teacherService.insert(record);
        ModelAndView modelAndView = new ModelAndView();
        return modelAndView;
    }

    @RequestMapping("/insertSelective")
    public ModelAndView insertSelective(Teacher record){
        teacherService.insertSelective(record);
        ModelAndView modelAndView = new ModelAndView();
        return modelAndView;
    }

    @RequestMapping("/selectByPrimaryKey")
    public ModelAndView selectByPrimaryKey(Integer ID){
        teacherService.selectByPrimaryKey(ID);
        ModelAndView modelAndView = new ModelAndView();
        return modelAndView;
    }

    @RequestMapping("/updateByPrimaryKeySelective")
    public ModelAndView updateByPrimaryKeySelective(Teacher record){
        teacherService.updateByPrimaryKeySelective(record);
        ModelAndView modelAndView = new ModelAndView();
        return modelAndView;
    }

    @RequestMapping("/updateByPrimaryKey")
    public ModelAndView updateByPrimaryKey(Teacher record){
        teacherService.updateByPrimaryKey(record);
        ModelAndView modelAndView = new ModelAndView();
        return modelAndView;
    }
}
