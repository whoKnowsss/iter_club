package com.iter_club.dao;
import com.iter_club.portal.dao.CourseMapper;
import com.iter_club.portal.dao.UserMapper;
import com.iter_club.portal.entity.Category;
import com.iter_club.portal.entity.Course;
import com.iter_club.portal.entity.Teacher;
import com.iter_club.portal.entity.User;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by 11655 on 2017/3/11.
 */
public class UserforumMapperTest {

    private ApplicationContext applicationContext;
    @Autowired
    private CourseMapper courseMapper;

    @Before
    public void setUp() throws Exception {
        applicationContext = new ClassPathXmlApplicationContext("classpath:spring/applicationContext.xml");//加载spring配置文件
        courseMapper = applicationContext.getBean(CourseMapper.class);//在这里导入要测试的
    }

    @After
    public void tearDown() throws Exception {

    }

    @Test
    public void insert() throws Exception {
        Course course=new Course();
        course.setStatus(2);
        Teacher teacher=new Teacher();
        teacher.setID(2);
        course.setTeacher(teacher);
        Category category=new Category();
        category.setID(5);
        course.setCategory(category);
        int result = courseMapper.insertSelective(course);
        System.out.println(course.getID());
        System.out.println(result);
        assert (result == 1);

    }

}