package com.secondHandTradingNetwork.service;
import com.secondHandTradingNetwork.entity.User;

public interface UserService {

	User login(String username,String password);
	
	User getUserById(int buyerId);
}
