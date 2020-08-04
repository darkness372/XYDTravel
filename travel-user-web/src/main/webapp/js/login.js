//页面加载完成之后触发的事件，页面加载事件
$(function() {
	
	//设置背景图片
	$.backstretch("images/login_back.jpg");
	
	$("#loginBtn").click(function() {
		
		//数据验证，验证通过就打开拼图验证模态框
		
		$("#validateModal").modal("show");
	});
	
	$('#mpanel').slideVerify({
	    type : 2,		//类型
 		vOffset : 5,	//误差量，根据需求自行调整
        vSpace : 5,	//间隔
        imgUrl : 'verify-master/images/',	//设置加载图片前缀
        imgName : ['1.jpg', '2.jpg'],
        imgSize : {				//图片大小
        	width: '400px',
        	height: '200px',
        },
        blockSize : {			//验证块大小
        	width: '40px',
        	height: '40px',
        },
        barSize : {				//滑块大小
        	width : '400px',
        	height : '40px',
        },
        ready : function() {		//验证模块加载事件
        	
    	},
        success : function() {		//验证通过
        	success("验证成功，正在登陆中...");
        	$("#validateModal").modal("hide");
        	
        	slide.init();
        	
        	$("#loginBtn").attr('disabled',true).text("登陆中...");;
        	
        	//数据验证，用户名和密码OK就发出登陆请求
        	$("#login")[0].submit();
        },
        error : function() {		//验证失败
        	error("登陆验证失败，请重新验证！");
        }
    });
});