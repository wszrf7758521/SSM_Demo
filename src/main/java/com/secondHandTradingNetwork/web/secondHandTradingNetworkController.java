package com.secondHandTradingNetwork.web;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.secondHandTradingNetwork.entity.Goods;
import com.secondHandTradingNetwork.entity.User;
import com.secondHandTradingNetwork.service.GoodsService;
import com.secondHandTradingNetwork.service.UserService;

@Controller
@RequestMapping("/secondHandTradingNetwork")
public class secondHandTradingNetworkController {
	@Autowired
    private GoodsService goodsService;
	@Autowired
	private UserService UserService;
	@Autowired
	HttpServletRequest request; 
	
	//列表画面
	@RequestMapping(value = "/goodsList",method = RequestMethod.GET)
	public String list(Model model){
	 List<Goods> list = goodsService.getALLGoods();
	 model.addAttribute("list",list);
	 return "goodsList";
	}
	
	
	//跳转登陆页面
	@RequestMapping(value = "/login",method = RequestMethod.GET)
	public String toLogin(){
		return "login";
	}
	
	
	//执行登陆
	@RequestMapping(value = "/{username}/{password}/doLogin",
	        method = RequestMethod.POST,
	        produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public User doLogin(@PathVariable("username")String username,@PathVariable("password")String password ){
		User user = UserService.login(username,password);
		if(user!=null){
			HttpSession session = request.getSession();
			session.setAttribute("user",user );
 		    return user;
		}else{
		  return null;
		}
	}
	
	//退出用户
	@RequestMapping(value = "/exit",method = RequestMethod.GET)
	@ResponseBody
	public String exit() {
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		return null;
	}
	
	
	//商品详细页面
	@RequestMapping(value = "/{goodsId}/goodsDetail",method = RequestMethod.GET)
	public String goodsDetail(@PathVariable("goodsId") long goodsId,Model model) {
		Goods goods = goodsService.getGoodsById(goodsId);
		HttpSession session = request.getSession();
		session.removeAttribute("goods");
		session.setAttribute("goods",goods);
		model.addAttribute("goods",goods);
		return "goodsDetail";
	}
	
	//购买
	@RequestMapping(value = "/{goodsId}/{userId}/buy",
	        method = RequestMethod.POST,
	        produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public int buy(@PathVariable("goodsId") long goodsId,@PathVariable("userId") int userId){
		int result = goodsService.updateGoodsUser(goodsId, userId);
		return result;
	}
	
	
	//我的
	@RequestMapping(value = "/{userId}/mine",method = RequestMethod.GET)
	public String mine(@PathVariable("userId") int userId,Model model){
	    List<Goods> list = goodsService.getGoodsByUserId(userId);
	    List<Goods> list2 = new ArrayList<>();
	    for(int i = 0; i < list.size(); i++){
	    	Goods goods = list.get(i);
	    	int buyerId = goods.getBuyerId();
	    	User user  = UserService.getUserById(buyerId);
	    	goods.setUser(user);
	    	list2.add(goods);
	    }
	    model.addAttribute("list2",list2);
		return "mine";
	}
	
	
	//确认交易
	@RequestMapping(value = "/{buyerId}/{userId}/{goodsId}/confirmTransaction",
	        method = RequestMethod.POST,
	        produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public int confirmTransaction(@PathVariable("buyerId")int buyerId,@PathVariable("userId") int userId,@PathVariable("goodsId") long goodsId){
		int result = goodsService.confirmTransaction(buyerId, userId, goodsId);
		return result;
	}
	
	
	//取消交易
	@RequestMapping(value = "/{goodsId}/cancelTransaction",
	        method = RequestMethod.POST,
	        produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public int cancelTransaction(@PathVariable("goodsId") long goodsId){
		int result = goodsService.cancelTransaction(goodsId);
		return result;
	}
	
	
	//增加物品
	@RequestMapping(value = "/insertGoods",
	        method = RequestMethod.POST,
	        produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String insertGoods(Model model){
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String goodsName = request.getParameter("goodsName");
		String goodsPriceStr = request.getParameter("goodsPrice");
		Double goodsPrice = Double.parseDouble(goodsPriceStr);
		String goodsDesc = request.getParameter("goodsDesc");
		String imgAddress = request.getParameter("inputfile");
		String userIdStr = request.getParameter("userId");
		int userId = Integer.parseInt(userIdStr);
		int result = goodsService.insertGoods(userId, goodsName, goodsPrice, goodsDesc, imgAddress);
		if(result == 1){
			return "goodsList";
		}else{
			return null;
		}
	}
	
	//删除物品
	@RequestMapping(value = "/{goodsId}/deleteGoods",method = RequestMethod.GET)
	@ResponseBody
	public int deleteGoods(@PathVariable("goodsId") long goodsId){
		int result = goodsService.deleteGoods(goodsId);
		return result;
	}
	
}
