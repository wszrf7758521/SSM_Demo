package com.secondHandTradingNetwork.dao;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.secondHandTradingNetwork.entity.Goods;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class GoodsDaoTest {

	@Resource
	private GoodsDao goodsDao;
	
	@Test
	public void testQueryAllGoods() throws Exception{
		
		List<Goods> goods = goodsDao.queryAllGoods();
		
		for(Goods good : goods){
			System.out.println(good.getUser());
		}
 	}
	
	@Test
    public void testQueryGoodsById() throws Exception{
		
		Goods goods = goodsDao.queryGoodsById(1);
		
			System.out.println(goods);
 	}
	
}
