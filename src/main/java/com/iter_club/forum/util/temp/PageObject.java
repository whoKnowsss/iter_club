package com.iter_club.forum.util.temp;

import java.util.List;

/**
 * Created by AsherLi
 */
public class PageObject<T> {
    private int total;    //总记录数
    public int pagecnt;  //页数
    public int index;    //页码
    public int size;     //每页条数
    public List<T> objects;

    public void setTotal(int total) {
        this.total = total;
        if(total == 0){
            this.pagecnt = 0;
        }else{
            this.pagecnt = total/size + 1;
        }
    }
}
