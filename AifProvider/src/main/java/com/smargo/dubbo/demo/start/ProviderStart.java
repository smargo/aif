package com.smargo.dubbo.demo.start;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ProviderStart {
	public static void init() throws Exception {
		//singleton();
        @SuppressWarnings("resource")
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(new String[] {"application.xml"});           
        context.start();
        System.in.read(); 
	}
	
    public static ApplicationContext context = null;

    public static void main(String argv[]) {
    	try {
			init();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    };
}
