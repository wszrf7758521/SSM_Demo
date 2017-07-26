<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="tag.jsp" %>
<%@ page import="com.secondHandTradingNetwork.entity.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="head.jsp" %>
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-cookie/1.4.0/jquery.cookie.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/script/secondHandTradingNetwork.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>导航栏</title>
</head>
<body onload="xx()">
   <div class="navbar navbar-default" role="navigation">
 　        <div class="navbar-header">
 　            <a href="/secondHandTradingNetwork/secondHandTradingNetwork/goodsList" class="navbar-brand">二手物品交易网</a>
 　        </div>
    <form action="##" class="navbar-form navbar-left" rol="search">
      <div class="form-group">
        <input type="text" class="form-control" placeholder="请输入关键词" />
      </div>
      <button type="submit" class="btn btn-default">搜索</button>
    </form>
    <%
       User user = (User)session.getAttribute("user");
       String username = null;
       if(user!= null){
    	 username = user.getUsername();  
    %>
      <span id="userSpan"><%=username %></span>
      <button id="messageBtn"  type="button" class="btn btn-default" onclick="secondHandTradingNetwork.mine(<%=user.getUserId() %>)">我的</button>
      <button id="exitBtn"  type="button" class="btn btn-default" onclick="secondHandTradingNetwork.exit()">退出</button>
    <%
       }else{
    %>
      <a id="login" href="/secondHandTradingNetwork/secondHandTradingNetwork/login">登陆</a>
      <a id="register" href="/secondHandTradingNetwork/secondHandTradingNetwork/regiser">注册</a>
    <%
       }
    %>
   </div>
</body>
</html>