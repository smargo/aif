package com.smargo.dubbo.demo.service.impl;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.smargo.dubbo.demo.dao.UserInfoMapper;
import com.smargo.dubbo.demo.dto.UserInfo;
import com.smargo.dubbo.demo.service.QueryService;

@Service("queryServiceImpl")
public class QueryServiceImpl implements QueryService {
	Logger logger = LoggerFactory.getLogger(QueryServiceImpl.class);
	
	@Resource
	private UserInfoMapper userInfoMapper;

	@Override
	public int getCount() {
		int result = 1000;
		logger.info("count:{}", result);
		return result;
	}
	
	@Override
	public UserInfo getUser(String userid) {
		UserInfo userInfo = userInfoMapper.getUser(userid);
		logger.info("userid:{} user:{}", userid, userInfo.toString());
		return userInfo;
	}
	

}
