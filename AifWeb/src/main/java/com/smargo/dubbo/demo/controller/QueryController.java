package com.smargo.dubbo.demo.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smargo.dubbo.demo.dto.UserInfo;
import com.smargo.dubbo.demo.service.QueryService;


@Controller
@RequestMapping("/query")
public class QueryController  {
	private Logger logger = LoggerFactory.getLogger(QueryController.class);
	
	@Resource(name="queryService")
	private QueryService queryService;
	
	@RequestMapping("/getcount")
	public String getCount(ModelMap model) {
		logger.info("begin to get count");
		UserInfo c = queryService.getUser("001");
		logger.info("get count:{}", c.getUsername());
		model.addAttribute("count", c.getUsername());
		return "/query/getcount";
	}
}
