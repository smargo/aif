package com.smargo.dubbo.demo.consume.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.smargo.dubbo.demo.consume.service.CountQueryService;
import com.smargo.dubbo.demo.dto.UserInfo;
import com.smargo.dubbo.demo.service.QueryService;

@Service("countQueryServiceImpl")
public class CountQueryServiceImpl implements CountQueryService {

	@Resource(name="queryService")
	private QueryService queryService;
	public int query() {
		int count = queryService.getCount();
		return count;
	}
	
	public UserInfo getUser(String userid) {
		return queryService.getUser(userid);
	}

}
