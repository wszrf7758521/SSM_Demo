package com.secondHandTradingNetwork.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.secondHandTradingNetwork.dao.GoodsDao;
import com.secondHandTradingNetwork.entity.Goods;
import com.secondHandTradingNetwork.service.GoodsService;

@Service
public class GoodsServiceImpl implements GoodsService{
    
	@Autowired
	private GoodsDao goodsDao;
	@Override
	public List<Goods> getALLGoods() {
		return goodsDao.queryAllGoods();
	}
	@Override
	public Goods getGoodsById(long goodsId) {
		return goodsDao.queryGoodsById(goodsId);
	}
	@Override
	public int updateGoodsUser(long goodsId,int userId) {
		return goodsDao.updateGoodsUser(goodsId,userId);
	}
	@Override
	public List<Goods> getGoodsByUserId(int userId) {
		return goodsDao.queryGoodsByUserId(userId);
	}
	@Override
	public int confirmTransaction(int buyerId, int userId, long goodsId) {
		return goodsDao.confirmTransaction(buyerId, userId, goodsId);
	}
	@Override
	public int cancelTransaction(long goodsId) {
		return goodsDao.cancelTransaction(goodsId);
	}
	@Override
	public int insertGoods(int userId, String goodsName, Double goodsPrice, String goodsDesc, String imgAddress) {
		return goodsDao.insertGoods(userId, goodsName, goodsPrice, goodsDesc, imgAddress);
	}
	@Override
	public int deleteGoods(long goodsId) {
		return goodsDao.deleteGoods(goodsId);
	}

}
