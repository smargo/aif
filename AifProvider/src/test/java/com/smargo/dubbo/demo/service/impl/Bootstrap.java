package com.smargo.dubbo.demo.service.impl;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.smargo.aif.test.BaseJunit4Test;

public class Bootstrap extends BaseJunit4Test {
	private Logger logger = LoggerFactory.getLogger(Bootstrap.class);
	
	@Test
    public void test() {
		logger.info("start to run");
        try {
			Thread.sleep(10000000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
        logger.info("--------------run");
    }
}
