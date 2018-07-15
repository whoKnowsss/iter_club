package com.iter_club.dao;
import com.iter_club.portal.dao.UserMapper;
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
    private UserMapper userMapper;

    @Before
    public void setUp() throws Exception {
        applicationContext = new ClassPathXmlApplicationContext("classpath:spring/applicationContext.xml");//加载spring配置文件
        userMapper = applicationContext.getBean(UserMapper.class);//在这里导入要测试的
    }

    @After
    public void tearDown() throws Exception {

    }

    @Test
    public void insert() throws Exception {
        User user = new User();
        user.setUUID("5555");
        user.setPassword("dddd");
        user.setName("九九");
        int result = userMapper.insertSelective(user);
        System.out.println(result);
        assert (result == 1);

    }

}