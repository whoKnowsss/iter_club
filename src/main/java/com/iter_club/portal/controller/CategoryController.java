package com.iter_club.portal.controller;



import com.iter_club.portal.entity.Category;
import com.iter_club.portal.entity.Course;
import com.iter_club.portal.service.CategoryService;
import com.iter_club.portal.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by li on 2018/7
 */
@Controller
@RequestMapping("/portal/category")
public class CategoryController {
    @Autowired
    private CategoryService categoryService;

    @Autowired
    private CourseService courseService;

    @RequestMapping("/deleteByPrimaryKey")
    public ModelAndView deleteByPrimaryKey(Integer ID){
        categoryService.deleteByPrimaryKey(ID);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("userShow");
        return modelAndView;
    }

    @RequestMapping("/insert")
    public ModelAndView insert(Category record){
        categoryService.insert(record);
        ModelAndView modelAndView = new ModelAndView();
        return modelAndView;
    }

    @RequestMapping("/insertSelective")
    public ModelAndView insertSelective(Category record){
        categoryService.insertSelective(record);
        ModelAndView modelAndView = new ModelAndView();
        return modelAndView;
    }



    @RequestMapping("/updateByPrimaryKeySelective")
    public ModelAndView updateByPrimaryKeySelective(Category record){
        categoryService.updateByPrimaryKeySelective(record);
        ModelAndView modelAndView = new ModelAndView();
        return modelAndView;
    }

    @RequestMapping("/updateByPrimaryKey")
    public ModelAndView updateByPrimaryKey(Category record){
        categoryService.updateByPrimaryKey(record);
        ModelAndView modelAndView = new ModelAndView();
        return modelAndView;
    }
}
