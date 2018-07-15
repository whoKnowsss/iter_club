package com.iter_club.portal.controller;


import com.iter_club.portal.entity.User;
import com.iter_club.portal.service.UserService;
import com.iter_club.portal.service.UsertocouService;
import com.iter_club.portal.util.Encryption;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.util.List;
import java.util.UUID;

import static com.iter_club.portal.util.SendEmail.sendRegisterMail;

/**
 * Created by Administrator on 2017/7/28.
 */

@Controller
@RequestMapping("/portal")
public class LoginController {

    @Autowired
    private CourseController courseController;

    @Autowired
    private MainController mainController;
    @Autowired
    private UserService userService;

    @Autowired
    private UsertocouService usertocouService;

    @RequestMapping("/toLogin")
    public ModelAndView toLogin(HttpSession session, String id) {
        session.setAttribute("courseid", id);

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");
        return modelAndView;
    }


    @RequestMapping("/login")
    public ModelAndView login(HttpSession session, String email, String password) {

        ModelAndView modelAndView = new ModelAndView();
        User user = userService.selectByEmail(email);
        Encryption encryption = new Encryption();
        password = encryption.MD5(password);         //密码加密
        if (user == null) {
            modelAndView.setViewName("login");
            modelAndView.addObject("info", "请输入有效账号！");
            return modelAndView;
        } else if (!password.equals(user.getPassword())) {
            modelAndView.setViewName("login");
            modelAndView.addObject("info", "请输入正确密码！");
            return modelAndView;
        } else {

            //将email保存在session，来查看登录状态
            session.removeAttribute("user");
            session.setAttribute("user", user);


            modelAndView.setViewName("accountcenter-info");

            return modelAndView;

        }
    }

    @RequestMapping("/toRegister")
    public ModelAndView toRegister() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("register");
        return modelAndView;
    }


    @RequestMapping("/register")
    public ModelAndView register(HttpSession session, String email, String password, String password_2) {
        ModelAndView modelAndView = new ModelAndView();
        User user = userService.selectByEmail(email);
        if (user != null) {
            if (user.getStatus() == 0)
                modelAndView.addObject("info", "该邮箱已注册过,请进行验证！");
            else
                modelAndView.addObject("info", "该邮箱已注册过,请进行登陆！");
        } else if (email.equals("")) {
            modelAndView.addObject("info", "请输入邮箱！");
        } else if (!password_2.equals(password)) {
            modelAndView.addObject("info", "两次密码不一致！");
        } else {
            user = new User();
            user.setUUID(UUID.randomUUID().toString());
            user.setStatus(0);
            user.setName("新人新人");
            user.setEmail(email);
            user.setPhoto("/image/user/01.png");
            Encryption encryption = new Encryption();
            password = encryption.MD5(password);         //密码加密
            user.setPassword(password);
            user.setCreatedAt(new Date(System.currentTimeMillis()));
            user.setUpdatedAt(new Date(System.currentTimeMillis()));
            userService.insertSelective(user);
            sendRegisterMail(user.getEmail(), "艾特社区（ITer_Club） 注册激活链接", user.getUUID(), session);
            modelAndView.addObject("info", "请等待邮件接收，进行验证完成注册！");
//            return login(session, email, password);
        }
        modelAndView.setViewName("register");
        return modelAndView;
    }


    @RequestMapping("/logout")
    public String outLogin(HttpServletRequest request, HttpSession session) {
        session.removeAttribute("user");
        //modelAndView.setViewName("course-index");
        return mainController.index(request, session);
    }
}
