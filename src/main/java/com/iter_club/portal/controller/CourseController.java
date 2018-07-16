package com.iter_club.portal.controller;

import com.iter_club.portal.entity.Category;
import com.iter_club.portal.entity.Course;
import com.iter_club.portal.entity.User;
import com.iter_club.portal.entity.Usertocou;
import com.iter_club.portal.service.CategoryService;
import com.iter_club.portal.service.CourseService;
import com.iter_club.portal.service.UserService;
import com.iter_club.portal.service.UsertocouService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by li on 2018/7
 */
@Controller
@RequestMapping("/portal/course")
public class CourseController {

    @Autowired
    private CourseService courseService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private UsertocouService usertocouService;
    @Autowired
    private UserService userService;
    @Autowired
    UserController userController;

    @RequestMapping("/deleteByPrimaryKey")
    public ModelAndView deleteByPrimaryKey(Integer ID) {
        courseService.deleteByPrimaryKey(ID);
        ModelAndView modelAndView = new ModelAndView();
        return modelAndView;
    }

    @RequestMapping("/insert")
    public ModelAndView insert(Course record) {
        courseService.insert(record);
        ModelAndView modelAndView = new ModelAndView();
        return modelAndView;
    }

    @RequestMapping("/insertSelective")
    public ModelAndView insertSelective(Course record) {
        courseService.insertSelective(record);
        ModelAndView modelAndView = new ModelAndView();
        return modelAndView;
    }

    @RequestMapping("/select/id={id}")
    public String selectCourseOne(Model model, @PathVariable("id") int id, HttpServletRequest request) {
        Course course = courseService.selectByPrimaryKey(id);
        model.addAttribute("course", course);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null) {
            Usertocou course1 = usertocouService.sellectByuidAndcid(user.getID(), id);
            if (course1 != null)
                model.addAttribute("leanred", 1);
        }
        return "course-info";
    }

    @RequestMapping("/category_code={id}/status={status}")
    public String selectCourseCategory(Model model, @PathVariable("id") int id, @PathVariable("status") int status, HttpServletRequest request) {
        List<Course> courses = new ArrayList<Course>();
        if (status == -1) {
            if (id == 1)
                courses = courseService.selectAll();
            else
                courses = courseService.selectByCategoryId(id);
        } else {
            if (id == 1)
                courses = courseService.selectByStatus(status);
            else {
                Course course = new Course();
                course.setStatus(status);
                Category category = new Category();
                category.setID(id);
                course.setCategory(category);
                courses = courseService.selectSelective(course);

            }
        }
        List<Category> list = categoryService.selectAll();
        model.addAttribute("categorys", list);
        model.addAttribute("category_code", id);
        model.addAttribute("status", status);
        model.addAttribute("courses", courses);
        return "course-index";
    }


    //    ${ctx}/portal/course/delete/user=${sessionScope.user.ID}/course=${one.ID}
    @RequestMapping("/delete/user={uid}/course={cid}")
    public ModelAndView abandon_course(@PathVariable(value = "uid") Integer uid, @PathVariable("cid") Integer cid, HttpSession session) {
        Usertocou usertocou = usertocouService.sellectByuidAndcid(uid, cid);
        usertocouService.deleteByPrimaryKey(usertocou.getID());
        return userController.tocourses(session, "-1");

    }


    @RequestMapping("/selectByPrimaryKey")
    public ModelAndView selectByPrimaryKey(@RequestParam(value = "id", required = false) String id) {

        Course course = courseService.selectByPrimaryKey(Integer.parseInt(id));
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("course", course);
        modelAndView.setViewName("course-info");
        return modelAndView;
    }

    @RequestMapping("/selectAll")
    public ModelAndView selectAll(HttpSession session) {

        ModelAndView modelAndView = new ModelAndView();

        List<Course> courses = courseService.selectAll();
        List<Category> categories = categoryService.selectAll();

        modelAndView.addObject("courses", courses);
        modelAndView.addObject("categorys", categories);

        List<String> list_class = new ArrayList<String>();
        list_class.add("iconfont mooc-quanbu");
        list_class.add("iconfont mooc-jisuanji");
        list_class.add("iconfont mooc-icon");
        list_class.add("iconfont mooc-xinli");
        list_class.add("iconfont mooc-waiyu");
        list_class.add("iconfont mooc-wenxuezhexuelishi");
        list_class.add("iconfont mooc-yishu");
        list_class.add("iconfont mooc-xuegongduiwuguanli");
        list_class.add("iconfont mooc-lilun");
        list_class.add("iconfont mooc-shengmingkexue");
        list_class.add("iconfont mooc-shu");
        list_class.add("iconfont mooc-falv");
        list_class.add("iconfont mooc-jiaoyu");
        list_class.add("iconfont mooc-qita");
        modelAndView.addObject("list_class", list_class);

        modelAndView.setViewName("course-index");

        return modelAndView;
    }

    @RequestMapping("/selectSpecial")
    public ModelAndView selectSpecial(HttpSession session) {
        String before_page = (String) session.getAttribute("before_page");
        ModelAndView modelAndView = new ModelAndView();
        String courseid = (String) session.getAttribute("courseid");
        Course course = courseService.selectByPrimaryKey(Integer.parseInt(courseid));
        modelAndView.addObject("course", course);
        modelAndView.setViewName(before_page);
        session.removeAttribute("before_page");
        session.removeAttribute("courseid");
        return modelAndView;
    }

    @RequestMapping("/toLearn/course={course}")
    public String toLearn(@PathVariable(value = "course") String course, HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user!=null){
            Usertocou usertocou = usertocouService.sellectByuidAndcid(user.getID(), Integer.parseInt(course));
            if (usertocou == null)
                usertocouService.insert(user.getID(), Integer.parseInt(course));
            return this.selectCourseOne(model, Integer.parseInt(course), request);
        }

         return  this.selectCourseOne(model, Integer.parseInt(course), request);

    }




    @RequestMapping("/search")
    public ModelAndView search(@RequestParam(value = "search_input", required = false) String search_input) {
        ModelAndView modelAndView = new ModelAndView();
        List<Course> search_list = courseService.search(search_input);
        List<Category> categories = categoryService.selectAll();
        modelAndView.addObject("courses", search_list);
        modelAndView.addObject("categorys", categories);

        List<String> list_class = new ArrayList<String>();
        list_class.add("iconfont mooc-quanbu");
        list_class.add("iconfont mooc-jisuanji");
        list_class.add("iconfont mooc-icon");
        list_class.add("iconfont mooc-xinli");
        list_class.add("iconfont mooc-waiyu");
        list_class.add("iconfont mooc-wenxuezhexuelishi");
        list_class.add("iconfont mooc-yishu");
        list_class.add("iconfont mooc-xuegongduiwuguanli");
        list_class.add("iconfont mooc-lilun");
        list_class.add("iconfont mooc-shengmingkexue");
        list_class.add("iconfont mooc-shu");
        list_class.add("iconfont mooc-falv");
        list_class.add("iconfont mooc-jiaoyu");
        list_class.add("iconfont mooc-qita");
        modelAndView.addObject("list_class", list_class);
        modelAndView.setViewName("course-index");
        return modelAndView;
    }


    @RequestMapping("/updateByPrimaryKeySelective")
    public ModelAndView updateByPrimaryKeySelective(Course record) {
        courseService.updateByPrimaryKeySelective(record);
        ModelAndView modelAndView = new ModelAndView();
        return modelAndView;
    }

    @RequestMapping("/updateByPrimaryKey")
    public ModelAndView updateByPrimaryKey(Course record) {
        courseService.updateByPrimaryKey(record);
        ModelAndView modelAndView = new ModelAndView();
        return modelAndView;
    }

}
