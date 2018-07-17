package com.iter_club.forum.service.Impl;

import com.iter_club.forum.dao.SysconfDao;
import com.iter_club.forum.service.SysconfService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by AsherLi
 */
@Service
public class SysconfServiceImpl implements SysconfService {

    @Resource
    SysconfDao _dao;

    public String getVersion() {
        return _dao.getVersion();
    }

    public int getDownload() {
        return _dao.getDownload();
    }

    public void addDownload() {
        _dao.addDownload();
    }
}
