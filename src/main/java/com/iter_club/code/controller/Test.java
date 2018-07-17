package com.iter_club.code.controller;

import java.io.*;

public class Test {
	public static void main(String[] args) {
		Process process = null;
		BufferedWriter bw = null;
		try {
			process = Runtime.getRuntime().exec("sh "+"/root/testttt/a.sh "+"/root/testttt"+" "+"HelloWorld");


	        SequenceInputStream sis = new SequenceInputStream (process.getInputStream (), process.getErrorStream ());
	        InputStreamReader isr = new InputStreamReader (sis, "gbk");
	        BufferedReader br = new BufferedReader (isr);

	        String content = null;
	        while((content = br.readLine()) != null){
	        	System.out.println(content);
	        }
		} catch (IOException e) {

			e.printStackTrace();
		}
	}
}