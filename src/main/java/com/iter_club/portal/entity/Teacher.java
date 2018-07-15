package com.iter_club.portal.entity;

import java.util.Date;

public class Teacher {
    private Integer ID;

    private String UUID;

    private School school;

//    public Integer getSchoolId() {
//        return schoolId;
//    }
//
//    public void setSchoolId(Integer schoolId) {
//        this.schoolId = schoolId;
//    }
    public School getSchool() {
        return school;
    }

    public void setSchool(School school) {
        this.school = school;
    }

    private String name;

    private String photo;

    private String description;

    private Date createdAt;

    private Date updatedAt;




    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public String getUUID() {
        return UUID;
    }

    public void setUUID(String UUID) {
        this.UUID = UUID;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo == null ? null : photo.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }
}