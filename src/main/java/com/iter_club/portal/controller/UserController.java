package com.iter_club.portal.controller;

import com.iter_club.forum.entity.Userforum;
import com.iter_club.forum.service.UserforumService;
import com.iter_club.portal.entity.Category;
import com.iter_club.portal.entity.Course;
import com.iter_club.portal.entity.Teacher;
import com.iter_club.portal.entity.User;
import com.iter_club.portal.service.*;

import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

/**
 * Description
 * Author li
 * Date 2018/7
 * Version 1.0
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private UsertocouService usertocouService;
    @Autowired
    private CourseService courseService;
    @Autowired
    UserforumService userforumService;
    @Autowired
    TeacherService teacherService;
    @Autowired
    MainController mainController;

    @Autowired
    CategoryService categoryService;

    @RequestMapping("toPersonal")
    public ModelAndView toPersonal(HttpSession session) {
        User a = userService.selectByPrimaryKey(1);
        session.setAttribute("user", a);
        ModelAndView modelAndView = new ModelAndView();
        User user = (User) session.getAttribute("user");

        session.removeAttribute("user_course");
        List user_course = usertocouService.selectByUserID(user.getID());
        session.setAttribute("user_course", user_course);

        modelAndView.setViewName("personal");
        return modelAndView;
    }


    @RequestMapping("toProfile")
    public ModelAndView toProfile(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        User user = (User) session.getAttribute("user");
        if (user != null) {
            modelAndView.setViewName("accountcenter-info");
        } else {
            modelAndView.setViewName("register");
            modelAndView.addObject("error", "请先进行<a href='/portal/toLogin'><em>登录</em></a>！");
            modelAndView.addObject("info", 0);
        }
        return modelAndView;
    }

    @RequestMapping(value = "/changephoto")
    public ModelAndView uploadWJ(HttpServletRequest request,
                                 @RequestParam(value = "file", required = false) MultipartFile file) {
        ModelAndView modelAndView = new ModelAndView();
        //如果用的是Tomcat服务器，则文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\upload\\文件夹中
        //获得文件上传目标路径
        try {
            if (file == null) {
                System.out.println("后台空");
                return modelAndView;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        String path = request.getSession().getServletContext().getRealPath("upload");
        //System.out.print("路径"+path);
//        String fileName = new Date().getTime()+filename.substring(filename.lastIndexOf('.'));//设置文件名
        String fileName = System.currentTimeMillis() + ".jpg";//设置文件名
        System.out.println(path);
        File targetFile = new File(path, fileName);
        if (!targetFile.exists()) {
            targetFile.mkdirs();
        }
        //保存
        try {
            file.transferTo(targetFile);
        } catch (Exception e) {
            e.printStackTrace();
        }

        String url = request.getRequestURL().toString();
        System.out.println("url" + url.substring(0, url.indexOf("/", url.indexOf("/") + 1)));
        System.out.print("request.getContextPath() :" + request.getContextPath() + "\n"
                + "request.getRequestURL()" + request.getRequestURL()
        );

        url = request.getContextPath() + "/upload/" + fileName;
        System.out.println("url:" + url + "\n");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        user.setPhoto(url);
        userService.updateByPrimaryKeySelective(user);
        session.setAttribute("user", user);
        Userforum userforum = userforumService.selectByPrimaryKey(user.getUUID());
        userforum.setPic(user.getPhoto());
        userforumService.updateByPrimaryKeySelective(userforum);
        Teacher teacher = teacherService.selectByUUID(user.getUUID());
        if (teacher != null) {
            teacher.setPhoto(user.getPhoto());
            teacherService.updateByPrimaryKeySelective(teacher);
        }
        session.setAttribute("userforum", userforum);
        return this.toProfile(session);
    }

    @RequestMapping(value = "/change/type={type}", method = RequestMethod.POST)
    public ModelAndView changeinfo(HttpServletRequest request,
                                   @PathVariable("type") String type) {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        try {
            request.setCharacterEncoding("UTF-8");
            if (type.equals("gender")) {
                user.setGender(request.getParameter("gender"));

            }
            if (type.equals("name")) {
                user.setName(request.getParameter("name"));
                Userforum userforum = userforumService.selectByPrimaryKey(user.getUUID());
                userforum.setName(user.getName());
                userforum.setAccount(user.getName());
                userforumService.updateByPrimaryKeySelective(userforum);
                session.setAttribute("userforum", userforum);

                Teacher teacher = teacherService.selectByUUID(user.getUUID());
                if (teacher != null) {
                    teacher.setName(user.getName());
                    teacherService.updateByPrimaryKeySelective(teacher);
                }
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        userService.updateByPrimaryKeySelective(user);
        session.setAttribute("user", user);
        return this.toProfile(session);
    }


    @RequestMapping("/yanzheng/uuid={code}")
    public ModelAndView register(HttpSession session, @PathVariable("code") String code) {
        ModelAndView modelAndView = new ModelAndView();
        User user = userService.selectByUUID(code);
        if (user != null) {
            if (user.getStatus() == 0) {
                modelAndView.addObject("user", user);
                modelAndView.addObject("info", "0");
                modelAndView.addObject("error", "验证成功，请<a href='/portal/toLogin'><em>登录</em></a>完善个人信息！");
                modelAndView.setViewName("register");
                user.setStatus(1);
                userService.updateByPrimaryKeySelective(user);
                Userforum userforum = new Userforum();
                userforum.setCreatetime(new java.util.Date());
                userforum.setName(user.getName());
                userforum.setPic(user.getPhoto());
                userforum.setAccount(user.getName());
                userforum.setId(user.getUUID());
                userforum.setPwd(user.getPassword());
                userforum.setAuth(user.getStatus());
                userforumService.insertSelective(userforum);
                Teacher teacher = new Teacher();
                teacher.setUUID(user.getUUID());
                teacher.setCreatedAt(new java.util.Date());
                teacher.setName(user.getName());
                teacher.setPhoto(user.getPhoto());
                teacher.setDescription("这位老师很懒，什么都没留下~~");
                teacherService.insertSelective(teacher);


            } else {
                modelAndView.addObject("user", user);
                modelAndView.addObject("info", "0");
                modelAndView.addObject("error", "已完成验证，请<a href='/portal/toLogin'><em>登录</em></a>完善个人信息！");
                modelAndView.setViewName("register");

            }

        } else {
            modelAndView.setViewName("register");
            modelAndView.addObject("error", "请先进行<a href='/portal/toRegister'><em>注册</em></a>！");
            modelAndView.addObject("info", 0);
//            return login(session, email, password);
        }

        return modelAndView;
    }


    @RequestMapping(value = "/tocourses/id={id}", method = RequestMethod.GET)
    public ModelAndView tocourses(HttpSession session, @PathVariable("id") String id) {
        ModelAndView modelAndView = new ModelAndView();
        User user = (User) session.getAttribute("user");
        List user_course = usertocouService.selectByUserStatus(user.getID(), Integer.parseInt(id));
        modelAndView.addObject("user_course", user_course);
        modelAndView.addObject("status", id);
        modelAndView.setViewName("accountcenter-coures");
        return modelAndView;
    }

    @RequestMapping(value = "/tomyopen", method = RequestMethod.GET)
    public String tomyopen(HttpServletRequest request, HttpSession session, Model model) {
        ModelAndView modelAndView = new ModelAndView();
        User user = (User) session.getAttribute("user");
        if (user != null) {
            Teacher teacher = teacherService.selectByUUID(user.getUUID());
            if (teacher != null) {
                List user_course = courseService.selectByTeacher(teacher.getID());
                model.addAttribute("user_course", user_course);
            }
            return "accountcenter-open";
        } else {
            return mainController.index(request, session);
        }

    }

    @RequestMapping(value = "/toopennew", method = RequestMethod.GET)
    public String gotonewpage(HttpServletRequest request, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            Teacher teacher = teacherService.selectByUUID(user.getUUID());
            model.addAttribute("user", user);
            model.addAttribute("teacher", teacher);
            model.addAttribute("type", "1");
            List<Category> categories = categoryService.selectAll();
            model.addAttribute("categorys", categories);
            return "accountcenter-new-course";
        } else {
            return mainController.index(request, session);
        }
    }


    //进入编辑单个课程的界面
    @RequestMapping(value = "/course/{type}/course={id}", method = RequestMethod.GET)
    public String toeditmycourse(HttpServletRequest request, @PathVariable("type") String type, @PathVariable("id") String id, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            Teacher teacher = teacherService.selectByUUID(user.getUUID());
            Course course = courseService.selectByPrimaryKey(Integer.parseInt(id));
            if (teacher.getID().equals(course.getTeacher().getID())) {
                if (type.equals("edit")) {
                    model.addAttribute("user", user);
                    model.addAttribute("teacher", teacher);
                    model.addAttribute("course", course);
                    model.addAttribute("type", "0");   //编辑
                    List<Category> categories = categoryService.selectAll();
                    model.addAttribute("categorys", categories);
                }
                return "accountcenter-edit";
            } else
                return mainController.index(request, session);
        } else {
            return mainController.index(request, session);
        }
    }



    //我的新开课程的编辑
    @RequestMapping(value = "/course/change/type={name}/course={id}", method = RequestMethod.POST)
    public String toeditmycourseNew(HttpServletRequest request, @PathVariable("name") String name, @PathVariable("id") String id, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            Teacher teacher = teacherService.selectByUUID(user.getUUID());
            Course course = courseService.selectByPrimaryKey(Integer.parseInt(id));
            if (teacher.getID().equals(course.getTeacher().getID())) {
                if (name.equals("name")) {
                    course.setName(request.getParameter("name"));
                } else if (name.equals("description")) {
                    course.setDescription(request.getParameter("description"));
                } else if (name.equals("category")) {
                    Category category = categoryService.selectByPrimaryKey(Integer.parseInt(request.getParameter("category")));
                    course.setCategory(category);
                } else if (name.equals("status")) {
                    course.setStatus(Integer.parseInt(request.getParameter("status")));
                }else if (name.equals("image")) {
                    course.setImg(request.getParameter("image"));
                }
                course.setUpdatedAt(new Date());
                courseService.updateByPrimaryKeySelective(course);
                return this.toeditmycourse(request, "edit", course.getID().toString(), session, model);
            } else
                return mainController.index(request, session);
        } else {
            return mainController.index(request, session);
        }
    }

    //我的新开课程的缩略图的编辑
    @RequestMapping(value = "/changephotonew")
    @ResponseBody
    public JSONObject uploadWJnw(HttpServletRequest request,
                                 @RequestParam(value = "file", required = false) MultipartFile file) {
       JSONObject jsonObject=new JSONObject();
       String filena=request.getParameter("filename");
        //如果用的是Tomcat服务器，则文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\upload\\文件夹中
        //获得文件上传目标路径
        try {
            if (file == null) {
                System.out.println("后台空");
                jsonObject.put("status","0");
                jsonObject.put("info","后台空");
                return jsonObject;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        String path = request.getSession().getServletContext().getRealPath("upload");
        //System.out.print("路径"+path);
//        String fileName = new Date().getTime()+filename.substring(filename.lastIndexOf('.'));//设置文件名
        String fileName = new Date().getTime()+filena.substring(filena.lastIndexOf('.'));//设置文件名
        System.out.println(path);
        File targetFile = new File(path, fileName);
        if (!targetFile.exists()) {
            targetFile.mkdirs();
        }
        //保存
        try {
            file.transferTo(targetFile);
        } catch (Exception e) {
            e.printStackTrace();
        }

        String url = request.getRequestURL().toString();
        System.out.println("url" + url.substring(0, url.indexOf("/", url.indexOf("/") + 1)));
        System.out.print("request.getContextPath() :" + request.getContextPath() + "\n"
                + "request.getRequestURL()" + request.getRequestURL()
        );

        url = request.getContextPath() + "/upload/" + fileName;
        System.out.println("url:" + url + "\n");
        jsonObject.put("status","1");
        jsonObject.put("info","成功上传图片");
        jsonObject.put("url",url);
        return jsonObject;
    }


    @RequestMapping("/selectByStatus")
    public ModelAndView selectByStatus(@RequestParam(value = "id", required = false) String id, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        User user = (User) session.getAttribute("user");
        List user_course = usertocouService.selectByUserStatus(user.getID(), Integer.parseInt(id));
        session.removeAttribute("user_course");
        session.setAttribute("user_course", user_course);
        modelAndView.setViewName("personal");
        return modelAndView;
    }

    @RequestMapping("/selectByPrimaryKey")
    public ModelAndView selectByPrimaryKey(Integer ID) throws Exception {

        ModelAndView modelAndView = new ModelAndView();

        modelAndView.setViewName(" ");
        return modelAndView;

    }


    @RequestMapping("/deleteByPrimaryKey")
    public ModelAndView deleteByPrimaryKey(Integer ID) {
        userService.deleteByPrimaryKey(5);
        ModelAndView modelAndView = new ModelAndView();
        return modelAndView;
    }

    @RequestMapping("/insert")
    public ModelAndView insert(User record) {
        userService.insert(record);
        ModelAndView modelAndView = new ModelAndView();
        return modelAndView;
    }

    @RequestMapping("/insertSelective")
    public ModelAndView insertSelective(User record) {
        userService.insertSelective(record);
        ModelAndView modelAndView = new ModelAndView();
        return modelAndView;
    }

    @RequestMapping("/updateByPrimaryKeySelective")
    public ModelAndView updateByPrimaryKeySelective(User record) {
        userService.updateByPrimaryKeySelective(record);
        ModelAndView modelAndView = new ModelAndView();
        return modelAndView;
    }

    @RequestMapping("/updateByPrimaryKey")
    public ModelAndView updateByPrimaryKey(User record) {
        userService.updateByPrimaryKey(record);
        ModelAndView modelAndView = new ModelAndView();
        return modelAndView;
    }

    @RequestMapping("/selectByEmail")
    public ModelAndView selectByEmail(String email) {
        userService.selectByEmail(email);
        ModelAndView modelAndView = new ModelAndView();
        return modelAndView;
    }

}
