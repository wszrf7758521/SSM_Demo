package com.secondHandTradingNetwork.service;
import java.util.List;


import com.secondHandTradingNetwork.entity.Goods;

public interface  GoodsService {
	
	List<Goods> getALLGoods();
	
    Goods getGoodsById(long goodsId);
    
    int updateGoodsUser(long goodsId,int userId);
    
    List<Goods> getGoodsByUserId(int userId);
    
    int confirmTransaction(int buyerId,int userId,long goodsId);
    
    int cancelTransaction(long goodsId);
    
    int insertGoods(int userId,String goodsName,Double goodsPrice,String goodsDesc,String imgAddress);
    
    int deleteGoods(long goodsId);
}
