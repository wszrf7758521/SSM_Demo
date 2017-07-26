package com.secondHandTradingNetwork.dao;

import org.apache.ibatis.annotations.Param;

import com.secondHandTradingNetwork.entity.User;


public interface UserDao {
	
	User login(@Param("username") String username,@Param("password") String password);

	User getUserById(@Param("userId") int buyerId);
}
