package com.iter_club.forum.controller;

import com.google.gson.Gson;
import com.iter_club.forum.util.Response;
import com.iter_club.forum.util.Response;

/**
 * Created by Administrator on 2016-11-30.
 */
public class BaseController {
    protected  Gson gson = new Gson();
    protected Response response = new Response();
}
