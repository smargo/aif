package com.smargo.dubbo.demo.start;

public class Main {

	public static void main(String[] args) {
		try {
			com.alibaba.dubbo.container.Main.main(args);
			//ProviderStart.init();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
