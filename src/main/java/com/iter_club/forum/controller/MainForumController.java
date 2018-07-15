package com.iter_club.forum.controller;

import com.iter_club.forum.service.SysconfService;
//import com.iter_club.forum.service.SysconfService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 主控制器
 * Created by Administrator on 2016-11-17.
 */
@Controller
@RequestMapping(value="/forum/main")
public class MainForumController {

    @Resource
    SysconfService _service;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index() {
        return "forum/version";
    }


    /**
     * 获取版本信息
     * @return
     */
    @RequestMapping(value = "/getversion", method = RequestMethod.GET)
    public ModelAndView GetVersion() {
        ModelAndView modelAndView = new ModelAndView("version");
        modelAndView.addObject("version", _service.getVersion());
        modelAndView.addObject("download", _service.getDownload());
        return modelAndView;
    }

    @RequestMapping(value="/addDownload", method = RequestMethod.POST)
    public void AddDownload(PrintWriter out) throws IOException {
        _service.addDownload();
        out.print("ok");
    }
}