package com.secondHandTradingNetwork.dao;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.secondHandTradingNetwork.entity.Goods;

public interface GoodsDao {
	
	List<Goods> queryAllGoods();
	
	Goods queryGoodsById(@Param("goodsId") long goodsId);
	
	int updateGoodsUser(@Param("goodsId")long goodsId,@Param("userId")int userId);
	
	List<Goods> queryGoodsByUserId(@Param("userId")int userId);
	
	int confirmTransaction(@Param("buyerId")int buyerId,@Param("userId")int userId,@Param("goodsId")long goodsId);
	
	int cancelTransaction(@Param("goodsId")long goodsId);
	
	int insertGoods(@Param("userId")int userId,@Param("goodsName")String goodsName,@Param("goodsPrice")Double goodsPrice,@Param("goodsDesc")String goodsDesc,
			@Param("imgAddress")String imgAddress);
	
	int deleteGoods(@Param("goodsId")long goodsId);
}
