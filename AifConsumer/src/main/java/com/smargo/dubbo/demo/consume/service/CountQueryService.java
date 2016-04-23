package com.smargo.dubbo.demo.consume.service;

import com.smargo.dubbo.demo.dto.UserInfo;

public interface CountQueryService {
	public int query();
	public UserInfo getUser(String userid);
}
