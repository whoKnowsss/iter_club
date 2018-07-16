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
import javax.servlet.http.HttpSession;
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





    @RequestMapping(value = "/message", method = RequestMethod.GET)
    public String message() {
        return "forum/user/message";
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index() {
        return "forum/user/index";
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
        out.setContentType("text/html;charset=utf-8");
        Response resp = new Response();
        HttpSession session=request.getSession();
        Userforum userforum = (Userforum) session.getAttribute("userforum");
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
        out.setContentType("text/html;charset=utf-8");
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
    @RequestMapping(value = "/getnew", method = RequestMethod.GET)
    public void getnew(HttpServletResponse out, String key, int index, int size) throws IOException {
        out.setContentType("text/html;charset=utf-8");
        response.Status = true;
        response.Result = service.Get(key, index, size);

        out.getWriter().print(gson.toJson(response));
    }
}
