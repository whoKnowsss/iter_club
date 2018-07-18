package com.iter_club.dao;

import java.io.*;

public class test {
    public static void main(String[] args) throws IOException {
        File directory = new File("");//设定为当前文件夹

            System.out.println(directory.getCanonicalPath());//获取标准的路径
            System.out.println(directory.getAbsolutePath());//获取绝对路径



        File file = new File(directory.getCanonicalPath()+"/src/test/resources/email_register.html");
        StringBuffer buff = new StringBuffer();
        InputStreamReader in = null;
        BufferedReader br = null;
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
            con=con.replace("#####change#####","http://www.lixiufeng.me/user/yanzheng/uuid=");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
//        System.out.println(con);
    }
}
