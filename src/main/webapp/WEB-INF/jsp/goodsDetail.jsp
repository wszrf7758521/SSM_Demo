<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="common/tag.jsp" %>
<%@ page import="com.secondHandTradingNetwork.entity.Goods" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="common/head.jsp" %>
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-cookie/1.4.0/jquery.cookie.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/script/secondHandTradingNetwork.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品详情</title>
</head>
<script>
$(function (){
	var name = "../../resources/img/${goods.imgAddress}"
    $("#goodsImg").attr('src',name)
})
</script>
<body>
    <div class="container">
       <%@include file="common/navbar.jsp" %>
 
          <div>
         <table id="goodsTable" class="table table-hover">
           <caption>商品详情</caption>
           <thead>
            <tr>
              <th>编号</th>
              <th>主人</th>
              <th>名称</th>
              <th>价格</th>
              <th>描述</th>
              <th>创建时间</th>
              <th>图片</th>
            </tr>
           </thead>
           <tbody>
              <tr>
                <td style="vertical-align: middle !important;">${goods.goodsId}</td>
                <td style="vertical-align: middle !important;">${goods.user.username}</td>
                <td style="vertical-align: middle !important;">${goods.goodsName}</td>
                <td style="vertical-align: middle !important;">${goods.goodsPrice}</td>
                <td style="vertical-align: middle !important;">${goods.goodsDesc}</td>
                <td style="vertical-align: middle !important;">${goods.createTime}</td>
                <td style="vertical-align: middle !important;"><img id="goodsImg" style="width:60px;height:60px"class="img-rounded" alt="img"></td>
                <%
                  User user2 = (User)session.getAttribute("user");
                  Goods goods = (Goods)session.getAttribute("goods");
                  if(user2 != null && goods !=null){
                	long userId = user2.getUserId();
                	long userId2 = goods.getUserId();
                	int goodsStatus = goods.getGoodsStatus();
                	int buyerId = goods.getBuyerId();
                	if(userId != userId2){
                		if(goodsStatus == 0){
                 %>
                 <td style="vertical-align: middle !important;"><button onclick="secondHandTradingNetwork.buy(${goods.goodsId},<%=user2.getUserId() %>)" type="button" class="btn btn-primary">购买</button></td>
                 <%
                		}else{
                 %>
                 <td style="vertical-align: middle !important;"><button type="button" class="btn btn-primary">交易中</button></td>
                 <%
                		}
                	}else{
                		if(buyerId == 0){
                 %>
                 <td style="vertical-align: middle !important;"><button type="button" class="btn btn-warning">不能购买自己的物品</button></td>
                 <%
                		}else{
                 %>
                 <td style="vertical-align: middle !important;"><button type="button" class="btn btn-warning">你的物品有人购买中</button></td>
                 <%
                		}
                	}
                  }else{
                 %>
                 <td style="vertical-align: middle !important;"><button type="button" class="btn btn-danger">请登录</button></td>
                 <%
                  }
                 %>
              </tr>
           </tbody>
         </table>
       </div>
       
       
       <%@include file="common/footer.jsp" %>
    </div>
</body>
</html>