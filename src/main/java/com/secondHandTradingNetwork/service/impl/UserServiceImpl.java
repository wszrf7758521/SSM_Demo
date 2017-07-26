package com.secondHandTradingNetwork.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.secondHandTradingNetwork.dao.UserDao;
import com.secondHandTradingNetwork.entity.User;
import com.secondHandTradingNetwork.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao userDao;
	@Override
	public User login(String username,String password) {
		return userDao.login(username,password);
	}
	@Override
	public User getUserById(int buyerId) {
		return userDao.getUserById(buyerId);
	}

}
