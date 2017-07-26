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
<title>我的</title>
</head>
<body>
    <div class="container">
       <%@include file="common/navbar.jsp" %>
       <%
        User user3 = (User)session.getAttribute("user");
        if(user3 != null){
       %>
        <div>
         <table id="goodsTable" class="table table-hover">
           <caption>我的信息</caption>
           <thead>
            <tr>
              <th>用户名</th>
              <th>密码</th>
            </tr>
           </thead>
           <tbody>
              <tr>
                <td style="vertical-align: middle !important;"><%=user3.getUsername() %></td>
                <td style="vertical-align: middle !important;"><%=user3.getPassword() %></td>
              </tr>
           </tbody>
         </table>
       </div>
       
       <div id="publishGoods" style="display:none;margin:0 auto; width:400px; height:500px;" >
          <div style="height:5px;background-color:#B8B8DC;margin-top:50px"></div>
          
          <form id="insertGoodsForm" method= "post" action="/secondHandTradingNetwork/secondHandTradingNetwork/insertGoods" style="margin-top:20px;margin-bottom:20px">
             <label class="label label-danger" id="message" style="display:none">输入有误</label>
             <div class="form-group">
              <label for="name">商品名称</label>
              <input type="text" class="form-control" name="goodsName" id="goodsName" placeholder="请输入名称" style="width:300px">
              <input type="hidden" name="userId" value=<%=user3.getUserId()%>>
             </div>
             <div class="form-group">
              <label for="name">商品价格</label>
              <input type="text" class="form-control" name="goodsPrice" id="goodsPrice" placeholder="请输入价格" style="width:300px">
             </div>
             <div class="form-group">
              <label for="name">商品介绍</label>
              <input type="text" class="form-control" name="goodsDesc" id="goodsDesc" placeholder="请输入简介" style="width:300px">
             </div>
             <div class="form-group">
              <label for="inputfile">图片选择</label>
              <input type="file" id="inputfile" name="inputfile">
             </div>
             <button type="button" class="btn btn-default" onclick="secondHandTradingNetwork.publishGoods()">上传</button>
          </form>
          
          <div style="height:5px;background-color:#B8B8DC;margin-bottom:50px""></div>
       </div>
       
       
       <div>
         <table id="goodsTable" class="table table-hover">
           <caption>
                                           我的物品 
            <button type="button" onclick="secondHandTradingNetwork.openPublishGoods()" class="btn btn-success">发布物品</button>
            <button type="button" style="display:none" onclick="secondHandTradingNetwork.cancelPublishGoods()" class="btn btn-info" id="cancelPublish">取消发布</button>
           </caption>
           <thead>
            <tr>
              <th>编号</th>
              <th>名称</th>
              <th>价格</th>
              <th>描述</th>
              <th>创建时间</th>
              <th>图片</th>
              <th>交易信息</th>
            </tr>
           </thead>
           <tbody>
            <c:forEach var="goods" items="${list2}">
              <tr>
                <td style="vertical-align: middle !important;">${goods.goodsId}</td>
                <td style="vertical-align: middle !important;">${goods.goodsName}</td>
                <td style="vertical-align: middle !important;">${goods.goodsPrice}</td>
                <td style="vertical-align: middle !important;">${goods.goodsDesc}</td>
                <td style="vertical-align: middle !important;">${goods.createTime}</td>
                <td style="vertical-align: middle !important;"><img id="goodsImg" src="../../resources/img/${goods.imgAddress}" style="width:60px;height:60px"class="img-rounded" alt="img"></td>
             <c:choose>
             <c:when test="${goods.goodsStatus == 1}">
                <td style="vertical-align: middle !important;">${goods.user.username}</td>
                <td style="vertical-align: middle !important;"><button type="button" onclick="secondHandTradingNetwork.confirmTransaction(${goods.buyerId},${goods.userId},${goods.goodsId })" class="btn btn-warning">确认交易</button></td>
                <td style="vertical-align: middle !important;"><button type="button" onclick="secondHandTradingNetwork.cancelTransaction(${goods.goodsId})" class="btn btn-warning">取消交易</button></td>
             </c:when>
             <c:otherwise>
                <td style="vertical-align: middle !important;">暂无信息</td>
             </c:otherwise> 
             </c:choose>
             <td style="vertical-align: middle !important;"><button type="button" onclick="secondHandTradingNetwork.deleteGoods(${goods.goodsId})" class="btn btn-danger">删除物品</button></td>   
              </tr>
            </c:forEach>  
           </tbody>
         </table>
       </div>
      <%
        }else{
      %>
       <div><p>请登录</p></div>
      <%
        }
      %>
       <%@include file="common/footer.jsp" %>
    </div>
</body>
</html>