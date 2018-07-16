package com.iter_club.portal.controller;

import com.iter_club.forum.entity.Userforum;
import com.iter_club.forum.service.UserforumService;
import com.iter_club.portal.entity.Course;
import com.iter_club.portal.entity.User;
import com.iter_club.portal.service.CourseService;
import com.iter_club.portal.service.UserService;
import com.iter_club.portal.service.UsertocouService;

import com.iter_club.portal.util.Encryption;
import com.sun.org.apache.xpath.internal.operations.Mod;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.List;
import java.util.UUID;

import static com.iter_club.portal.util.SendEmail.sendRegisterMail;

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
        if (user != null ) {
            if (user.getStatus()==0){
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
            }else{
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
