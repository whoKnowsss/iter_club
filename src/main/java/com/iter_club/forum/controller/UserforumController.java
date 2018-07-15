package com.iter_club.forum.controller;

import com.iter_club.forum.util.Const;
import com.iter_club.forum.util.MD5;
import com.iter_club.forum.util.Response;
import com.iter_club.forum.util.temp.UserViewModel;
import com.iter_club.forum.entity.Userforum;
import com.iter_club.forum.service.LoginService;
import com.iter_club.forum.service.UserforumService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Administrator on 2016-11-29.
 */
@Controller
@RequestMapping(value = "/forum/user")
public class UserforumController extends BaseController {

    @Resource
    UserforumService service;

    @Resource
    LoginService loginService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "forum/login";
    }

    @RequestMapping(value = "/reg", method = RequestMethod.GET)
    public String reg() {
        return "forum/reg";
    }

    @RequestMapping(value = "/message", method = RequestMethod.GET)
    public String message() {
        return "forum/user/message";
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index() {
        return "forum/user/index";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletResponse out) {
        Cookie cookie = new Cookie(Const.COOKIE_LOGIN_USER,"");
        cookie.setMaxAge(-1);
        cookie.setPath("/");
        out.addCookie(cookie);
        return "forum/clubindex";
    }

    /**
     * 获取登陆的用户
     * @param request
     * @param out
     * @throws IOException
     */
    @ResponseBody
    @RequestMapping(value = "/getuser", method = RequestMethod.GET)
    public void getUser(HttpServletRequest request, HttpServletResponse out) throws IOException {
        out.setContentType("text/html; charset=utf-8");
        Response resp = new Response();
        Userforum userforum = loginService.get();
        if(userforum == null){
            resp.Status = false;
            resp.Result = null;
        }else{
            resp.Status = true;
            resp.Result = UserViewModel.From(userforum);
        }

        out.getWriter().print(gson.toJson(resp));
    }

    @ResponseBody
    @RequestMapping(value = "/getbyid", method = RequestMethod.GET)
    public void getbyid(String uid, HttpServletResponse out) throws IOException {
        out.setContentType("text/html; charset=utf-8");
        Response resp = new Response();
        Userforum userforum = service.selectByPrimaryKey(uid);
        if(userforum == null){
            resp.Status = false;
            resp.Result = null;
        }else{
            resp.Status = true;
            resp.Result = UserViewModel.From(userforum);
        }

        out.getWriter().print(gson.toJson(resp));
    }

    @ResponseBody
    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public void addUser(HttpServletResponse out, String name, String account, String pwd) throws IOException {
        out.setContentType("text/html; charset=utf-8");
        try {

            Userforum userforum = new Userforum();
            userforum.setName(name);
            userforum.setAccount(account);
            userforum.setPwd(MD5.Encode(pwd));

            service.insert(userforum);
            response.Status = true;
        } catch (Exception e) {
            response.Status = false;
            response.Message = e.getMessage();
        }
        out.getWriter().print(gson.toJson(response));
    }

    @ResponseBody
    @RequestMapping(value = "/check", method = RequestMethod.POST)
    public void checkUser(HttpServletResponse out, String account, String pwd) throws IOException {
        out.setContentType("text/html; charset=utf-8");
        try {
            Userforum u = service.check(account, pwd);
            Cookie cookie = new Cookie(Const.COOKIE_LOGIN_USER, u.getId());
            cookie.setPath("/");
            cookie.setMaxAge(360000);
            out.addCookie(cookie);
            response.Status = true;
        } catch (Exception e) {
            response.Status = false;
            response.Message = e.getMessage();
        }
        out.getWriter().print(gson.toJson(response));
    }

    @ResponseBody
    @RequestMapping(value = "/getnew", method = RequestMethod.GET)
    public void getnew(HttpServletResponse out, String key, int index, int size) throws IOException {
        out.setContentType("text/html; charset=utf-8");
        response.Status = true;
        response.Result = service.Get(key, index, size);

        out.getWriter().print(gson.toJson(response));
    }
}
