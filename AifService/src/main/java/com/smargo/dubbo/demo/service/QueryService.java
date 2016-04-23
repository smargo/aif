package com.smargo.dubbo.demo.service;

import com.smargo.dubbo.demo.dto.UserInfo;

public interface QueryService {
	public int getCount();
	public UserInfo getUser(String userid);
}
