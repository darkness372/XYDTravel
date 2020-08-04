
var resuestType = "get";		//请求方式
var requestData = "";			//请求参数
var requestUrl = "";			//请求地址

//通用Ajax请求
function ajaxRequest() {
	//使用$.Deferred()和$.when().done(）把异常请求变成同步请求
	//只有这样在同时多个Ajax请求的时候才能保存数据不会窜
	
	//deferred对象是一个延迟对象，意思是函数延迟到某个点才开始执行，
	//改变执行状态的方法有两个（成功：resolve和失败：reject），
	//分别对应$.when()的两种执行回调（成功回调函数：done和失败回调函数fail）
	
	//启动加载动画
	showLoading();
	
	var defer = $.Deferred();
	
	$.ajax({
		type:resuestType,
		dataType:"json",
		url:getRootPath() + requestUrl,
		data:requestData,
		success:function (resultData) {
			//console.log("通用Ajax请求："+JSON.stringify(resultData));
			//无登陆
			if (resultData.statusCode.status == 401) {
				error(resultData.statusCode.message +"<br> 3秒后跳转到登陆页面！<br> 无法跳转请点击：<a onclick='goLogin()'>登陆</a>");
				setTimeout("goLogin()",3000);
				
				//关闭动画
				closeLoading();
			//数据验证失败
			}else if (resultData.statusCode.status == 406) {
				var errorMsg = "";
				
				if(null != resultData.statusCode.message) {
					errorMsg = resultData.statusCode.message + "</br>";
				}
				
				if(resultData.data != null){
					$.each(resultData.data, function(key,value) {
						errorMsg += value + "</br>"
					});
				}
				error(errorMsg);
			
				//关闭动画
				closeLoading();
			//无权限和操作失败
			}else if (resultData.statusCode.status == 403 || resultData.status == 1000) {
				error(resultData.statusCode.message);
				
				//关闭动画
				closeLoading();
			}else {	//请求成功，没有错误
				/*if(null != resultData.message && "" != resultData.message) {
					success(resultData.message);
				}*/
				
				//延迟延时成功后把数据传递给$.when(Deferred).done(function(resultData){})
				defer.resolve(resultData);
				
				//关闭动画
				closeLoading();
			}
		},
		error:function () {
			error("网络出现异常，请稍后再试！");
			//关闭动画
			closeLoading();
		}
	});
	
	return defer;	//返回延迟对象
	 
	//谁调用ajaxRequest()函数，就使用下面这个方式来获取请求成功的数据
	/*
	$.when(ajaxRequest()).done(function (resultData) {
 
		//在这里处理业务
			        
	});
	*/
	
}

//跳转到登陆页面
function goLogin() {
	window.location.href = "http://localhost/login.jsp"
}

//获取请求基本地址
function getRootPath() {
	// 获取当前网址，如： http://localhost:80/xyd/index.jsp
	var curPath = window.document.location.href;
	
	// 获取主机地址之后的目录，如： xyd/index.jsp
	var pathName = window.document.location.pathname;
	var pos = curPath.indexOf(pathName);
	
	// 获取主机地址，如： http://localhost:80
	var localhostPaht = curPath.substring(0, pos);
	
	// 获取带"/"的项目名，如：/xyd
	var projectName = pathName
		.substring(0, pathName.substr(1).indexOf('/') + 1);
		
	// return(localhostPaht+projectName);
	return localhostPaht + projectName;
}

//生成单号
function getDanhao (elID,targetEL,flag) {
	$("#" + elID).val(
		flag
		//替换的使用，默认只替换一次，如果要全部替换，要使用g
		+ $("#" + targetEL).val().replace(/-/g,"").replace(/ /g,"").replace(/:/g,"")
		+ "-" + uuid(5,10)
	);
}

//len:生成几位数据的UUID 	radix：进制位，如2进制，10进制，
function uuid(len, radix) {
	var chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'.split('');
	var uuid = [],
		i;
	radix = radix || chars.length;

	if(len) {
		for(i = 0; i < len; i++) uuid[i] = chars[0 | Math.random() * radix];
	} else {
		var r;

		uuid[8] = uuid[13] = uuid[18] = uuid[23] = '-';
		uuid[14] = '4';

		for(i = 0; i < 36; i++) {
			if(!uuid[i]) {
				r = 0 | Math.random() * 16;
				uuid[i] = chars[(i == 19) ? (r & 0x3) | 0x8 : r];
			}
		}
	}

	return uuid.join('');
}

//键盘事件，获取相应的拼音首字母
function getPinYin (xyd,id,value) {
	$("#" + id).val(xyd + makePy(value.trim())[0]);
}


//Loading动画
function showLoading() {
	if(!isOpen) {
		$('body').loading({
			loadingWidth:250,
			title:'请稍等',
			name:'xydLoading',
			discription:'数据加载中......',
			direction:'column',
			type:'origin',
			//originBg:'#71EA71',	//小圆点颜色
			originDivWidth:40,
			originDivHeight:40,
			originWidth:6,
			originHeight:6,
			smallLoading:false,
			titleColor: 'rgba(255,255,255,1)',//title信息字体颜色
			titleSize:	'18px',					//title信息字体大小
			discColor:'rgba(255,255,255,1)',			//discription信息字体颜色
			discSize:'18px',							//discription信息字体大小
			loadingBg: 'rgba(0, 0, 0, 0.4)',  	//弹出层颜色
			loadingMaskBg:'rgba(0,0,0,0.2)'		//遮罩层颜色
		});
	}
}

function closeLoading() {
	removeLoading('xydLoading');
	isOpen=false;
}