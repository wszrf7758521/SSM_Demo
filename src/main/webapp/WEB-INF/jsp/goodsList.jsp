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
</script>
<body>
    <div class="container">
       <%@include file="common/navbar.jsp" %>
       <div>
         <table class="table table-hover">
           <caption>全部商品</caption>
           <thead>
            <tr>
              <th>编号</th>
              <th>主人</th>
              <th>名称</th>
            </tr>
           </thead>
           <tbody  id="goodsTable">
            <c:forEach var="goods" items="${list}">
              <tr>
                <td>${goods.goodsId}</td>
                <td>${goods.user.username}</td>
                <td>${goods.goodsName}</td>
              </tr>
            </c:forEach>
           </tbody>
         </table>
       </div>
       
       <%@include file="common/footer.jsp" %>
    </div>
</body>
<script>
$(function (){
	secondHandTradingNetwork.detail();
})
</script>
</html>