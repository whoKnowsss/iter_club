package com.iter_club.portal.util;

/**
 * /Created by xiuFeng on 2018/7/13.
 */

import java.io.*;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class SendEmail {
    public static final String HOST = "smtp.163.com";
    public static final String PROTOCOL = "smtp";
    public static final int PORT = 25;
    public static final String FROM = "m15968165981@163.com";//发件人的email
    public static final String PWD = "lixiufeng123";//发件人密码
//    public static final String FROM = "moocclub@163.com";//发件人的email
//    public static final String PWD = "moocMOOC123";//发件人密码

    /**
     * 获取Session
     *
     * @return
     */
    private static Session getSession() {
        Properties props = new Properties();
        props.put("mail.smtp.host", HOST);//设置服务器地址
        props.put("mail.store.protocol", PROTOCOL);//设置协议
        props.put("mail.smtp.port", PORT);//设置端口
        props.put("mail.smtp.auth", true);

        Authenticator authenticator = new Authenticator() {

            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM, PWD);
            }

        };
        Session session = Session.getDefaultInstance(props, authenticator);

        return session;
    }

    public static void send(String toEmail, String title, String content) {
        Session session = getSession();
        try {
            System.out.println("--send--" + content);
            // Instantiate a message
            Message msg = new MimeMessage(session);

            //Set message attributes
            msg.setFrom(new InternetAddress(FROM));
            InternetAddress[] address = {new InternetAddress(toEmail)};
            msg.setRecipients(Message.RecipientType.TO, address);
            msg.setSubject(title);
            msg.setSentDate(new Date());
            msg.setContent(content, "text/html;charset=utf-8");

            //Send the message
            Transport.send(msg);
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
    }


    public static void sendRegisterMail(String toEmail, String title, String code, HttpSession request) {
        //String info="";
        StringBuffer buff = new StringBuffer();
        InputStreamReader in = null;
        BufferedReader br = null;
        String path = request.getServletContext().getRealPath("styles/email_register.html");
//        String path = "email_register.html";
        File file = new File(path);
        try {
            in = new InputStreamReader(new FileInputStream(file));
            br = new BufferedReader(in);
            String line = null;
            while ((line = br.readLine()) != null) {
                //System.out.println(line);
                buff.append(line);

            }

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        String con=buff.toString();
        System.out.println(con);
        try {
            con=new String(con.getBytes("GBK"),"UTF-8");
            con=con.replace("#####change#####","http://localhost:8080/user/yanzheng/uuid="+code);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        send(toEmail, title,con );

    }



}

