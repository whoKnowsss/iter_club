package com.iter_club.portal.entity;

import java.util.Date;

public class Course {
    private Integer ID;

    private String UUID;

    private String Name;

    private Teacher teacher;


    private String description;

    private Category category;

    private Integer status;

    private String img;

    private Date createdAt;

    private Date updatedAt;

    public Course() {
    }

    public Course(Date updatedAt, String UUID, String name, Teacher teacher, String description, Category category, Integer status, String img, Date createdAt, Integer ID) {
        this.updatedAt = updatedAt;
        this.UUID = UUID;
        Name = name;
        this.teacher = teacher;

        this.description = description;
        this.category = category;
        this.status = status;
        this.img = img;
        this.createdAt = createdAt;
        this.ID = ID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

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

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }


    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
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

    @Override
    public String toString() {
        return "Course{" +
                "ID=" + ID +
                ", UUID='" + UUID + '\'' +
                ", Name='" + Name + '\'' +
                ", teacher=" + teacher +

                ", description='" + description + '\'' +
                ", category=" + category +
                ", status=" + status +
                ", img='" + img + '\'' +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                '}';
    }
}