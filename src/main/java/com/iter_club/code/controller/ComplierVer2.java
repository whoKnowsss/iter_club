package com.iter_club.code.controller;

import java.io.*;

/**
 * 代码编译
 *
 */
public class ComplierVer2 {
	private Process process = null;
	private BufferedWriter bw = null;
	private StringBuffer sb = null;
    private String content = null;
	
    /**
     * 
     * @param className 类名
     * @param batPath 批处理文件所在的路径
     * @param filePath 代码文件所在的路径
     * @return 编译运行的结果
     * @throws IOException
     * @throws InterruptedException
     */
	public String ComplierCode(String className, String batPath, String filePath) throws IOException, InterruptedException{
		Runtime runtime = Runtime.getRuntime();
		String os = System.getProperty("os.name");
		if(os.toLowerCase().startsWith("win")){
			process = runtime.exec(batPath+"/build.bat");

			Thread.sleep(1*1000);//线程沉睡1秒，防止文件没有被运行

			//输入批处理命令
			bw = new BufferedWriter(new OutputStreamWriter(process.getOutputStream()));
			bw.write(filePath);
			bw.flush();
			bw.write(className);
			bw.flush();
			bw.close();

		}else{
			process = runtime.exec("sh "+batPath+"/build.sh "+filePath+" "+className);
		}

        SequenceInputStream sis = new SequenceInputStream (process.getInputStream (), process.getErrorStream ());
        InputStreamReader isr = new InputStreamReader (sis, "gbk");
        BufferedReader br = new BufferedReader (isr);
        

        sb = new StringBuffer();
        while((content = br.readLine()) != null){
        	sb.append(content+"\n");
        }
        System.out.println(sb);
        content = sb.toString();
		return content;
	}
}