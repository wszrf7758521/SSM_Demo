<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="common/tag.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="common/head.jsp" %>
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-cookie/1.4.0/jquery.cookie.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/script/secondHandTradingNetwork.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品列表</title>
</head>
<script>
$(function (){ 
	var username = cookie('username');
	var password = cookie('password');
	$('#username').val(username);
	$('#password').val(password);
}); 
</script>
<body>
    <div class="container">
       <%@include file="common/navbar.jsp" %>
       <form class="form-horizontal" id="loginForm" role="form" action="/secondHandTradingNetwork/secondHandTradingNetwork/goodsList">
       <div class="form-group">
         <label for="username" class="col-sm-2 control-label">用户名</label>
         <div class="col-sm-10">
          <input type="text" class="form-control" id="username" placeholder="请输入用户名">
         </div>
      </div>
      <div class="form-group">
      <label for="lastname" class="col-sm-2 control-label">密码</label>
       <div class="col-sm-10">
        <input type="text" class="form-control" id="password" placeholder="请输入密码">
       </div>
      </div>
      <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
          <div class="checkbox">
           <label>
            <input type="checkbox" id="checkbox1">请记住我
           </label>
          </div>
      </div>
     </div>
     <div class="form-group">
       <div class="col-sm-offset-2 col-sm-10">
        <button type="button" class="btn btn-default" onclick="secondHandTradingNetwork.login()">登录</button>
       </div>
     </div>
</form>
       
       
       <%@include file="common/footer.jsp" %>
    </div>
</body>
</html>