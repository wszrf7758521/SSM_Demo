//页面js
var cookie = ($.cookie);
var secondHandTradingNetwork = {
		
		validateLoginString : function(username,password){
			if(username != '' && password != ''){
				return true;
			}else{
				return false;
			}
		},
		login: function(){
			var username = $('#username').val();
			var password = $('#password').val();
			if(secondHandTradingNetwork.validateLoginString(username,password)){
				$.post('/secondHandTradingNetwork/secondHandTradingNetwork/'+username+'/'+password+'/doLogin',{},function(user){
					if(user){
						if ($('#checkbox1').is(':checked')) {
							cookie('username',username,{expires:7});
							cookie('password',password,{expires:7});
			            }else {
			            	cookie('username','');
							cookie('password','');
			            }
					    $('#loginForm').submit();
					}else{
						alert("用户名或密码错误")
					}
				})
			}else{
				alert("输入有误")
			}
		}, 
		
		exit : function() {
			$.get('/secondHandTradingNetwork/secondHandTradingNetwork/exit',{},function(){
				window.location.href = '/secondHandTradingNetwork/secondHandTradingNetwork/login'
			})
		},
		
		mine : function(userId){
			window.location.href = '/secondHandTradingNetwork/secondHandTradingNetwork/'+userId+'/mine'
		},
		
		detail : function(){
			$('#goodsTable tr').click(function(){
			    var goodsId = $(this).find('td').html();
				window.location.href = '/secondHandTradingNetwork/secondHandTradingNetwork/'+goodsId+'/goodsDetail'
			})
	    },
	    
	    buy: function(goodsId,userId){
	    	$.post('/secondHandTradingNetwork/secondHandTradingNetwork/'+goodsId+'/'+userId+'/buy',{},function(result){
	    		if(result == 1){
	    			alert("购买成功,等待对方同意")
	    			window.location.reload();
	    		}else{
	    			alert("购买失败")
	    		}
			   
			})
	    },
	    confirmTransaction: function(buyerId,userId,goodsId){
	    	$.post('/secondHandTradingNetwork/secondHandTradingNetwork/'+buyerId+'/'+userId+'/'+goodsId+'/confirmTransaction',{},function(result){
	    		if(result == 1){
	    			alert("交易成功")
	    			window.location.reload();
	    		}else{
	    			alert("交易失败")
	    		}
			})
	    },
	    cancelTransaction: function(goodsId){
	    	$.post('/secondHandTradingNetwork/secondHandTradingNetwork/'+goodsId+'/cancelTransaction',{},function(result){
	    		if(result == 1){
	    			alert("取消成功")
	    			window.location.reload();
	    		}else{
	    			alert("取消失败")
	    		}
			})
	    },
	    openPublishGoods: function(){
	      $('#publishGoods').show();
	      $('#cancelPublish').show();
	    },
	    cancelPublishGoods: function(){
	      $('#publishGoods').hide();
		  $('#cancelPublish').hide();
	    },
	    
	    publishGoods: function(){
	    	$('#message').hide();
	    	var goodsName = $('#goodsName').val();
			var goodsPrice = $('#goodsPrice').val();
			var goodsDesc = $('#goodsDesc').val();
			var imgAddress = $('#inputfile').val();
			if(goodsName == '' || goodsPrice == '' || goodsDesc == '' || imgAddress == ''){
				$('#message').show();
				return;
			}
			$('#insertGoodsForm').submit();
		},
		
		
		deleteGoods: function(goodsId){
			$.get('/secondHandTradingNetwork/secondHandTradingNetwork/'+goodsId+'/deleteGoods',{},function(result){
				if(result == 1){
					alert("删除成功")
					window.location.reload();
				}else{
					alert("删除失败")
				}
			})
			
		}
}
