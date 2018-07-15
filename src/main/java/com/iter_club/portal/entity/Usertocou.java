package com.iter_club.portal.entity;

/**
 * Created by li on 2018/7
 */
public class Usertocou {

    private Integer ID;
    private String UUID;
    private User user;
    private Course course;

    public Integer getID() {
        return ID;
    }

    public String getUUID() {
        return UUID;
    }

    public void setUUID(String UUID) {
        this.UUID = UUID;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}

