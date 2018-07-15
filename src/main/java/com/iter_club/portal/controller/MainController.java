package com.iter_club.portal.controller;

import com.iter_club.portal.entity.Category;
import com.iter_club.portal.entity.Course;
import com.iter_club.portal.service.impl.CategoryServicelmpl;
import com.iter_club.portal.service.impl.CourseServicelmpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/portal")
public class MainController {
    @Autowired
    CategoryServicelmpl categoryService;
    @Autowired
    CourseServicelmpl courseService;

    @RequestMapping("/index")
    public String index(HttpServletRequest request, HttpSession session){
        List<Category> listCategory=categoryService.selectAll();
        request.setAttribute("categorys",listCategory);
        List<Course> topFive=courseService.selectTop(5);
        request.setAttribute("topFive",topFive);
        return "index";
    }
}
