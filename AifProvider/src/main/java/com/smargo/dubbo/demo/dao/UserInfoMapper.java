package com.smargo.dubbo.demo.dao;

import org.springframework.stereotype.Repository;

import com.smargo.dubbo.demo.dto.UserInfo;

@Repository
public interface UserInfoMapper {
	public UserInfo getUser(String userid);
}
