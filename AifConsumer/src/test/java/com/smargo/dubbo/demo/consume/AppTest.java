package com.smargo.dubbo.demo.consume;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import com.smargo.aif.test.BaseJunit4Test;
import com.smargo.dubbo.demo.consume.service.CountQueryService;
import com.smargo.dubbo.demo.dto.UserInfo;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * Unit test for simple App.
 */
//@RunWith(SpringJUnit4ClassRunner.class)  //使用junit4进行测试  
//@ContextConfiguration(locations={"classpath*:application.xml"}) //加载配置文件
public class AppTest extends BaseJunit4Test {
	Logger logger = LoggerFactory.getLogger(AppTest.class);
	
	@Resource(name="countQueryServiceImpl")
	private CountQueryService countQueryService;
    
    /**
     * Rigourous Test :-)
     */
	@Test
    public void testQuery() {
    	logger.debug("consume test ------strat:");
    	int c = countQueryService.query();
    	logger.debug("consume test ------end, c:{}", c);
    	assertTrue( true );
    }
	
	@Test
    public void testQueryUser() {
    	logger.debug("consume test ------strat:");
    	UserInfo u = countQueryService.getUser("001");
    	if (null != u) {
    		logger.debug("consume test ------end, u:{}", u.getUsername());
    	}
    	
    	assertTrue( true );
    }
}
