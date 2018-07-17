package com.iter_club.forum.controller;

import com.google.gson.Gson;
import com.iter_club.forum.util.Response;
import com.iter_club.forum.util.Response;

/**
 * Created by AsherLi
 */
public class BaseController {
    protected  Gson gson = new Gson();
    protected Response response = new Response();
}
