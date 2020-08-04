<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	request.setAttribute("basePath", request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/"); 
	/*
	request.setAttribute("basePath", request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort() + "/");
	*/
%>
<!DOCTYPE >
<html>
<head>
<title>企业差旅管理平台</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="icon" href="${basePath }images/xyd_login.png" type="image/x-icon" />

<script type="text/javascript" src="${basePath }js/jquery/jquery.min.js"></script>
<script type="text/javascript" src="${basePath }bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${basePath }js/jquery/jquery.backstretch.min.js"></script>

<!--当前页面脚本-->
<script type="text/javascript" src="${basePath }js/login.js"></script>

<link rel="stylesheet" type="text/css" href="${basePath }bootstrap/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="${basePath }css/login.css" />

<!-- 验证插件 -->
<link rel="stylesheet" type="text/css" href="${basePath }verify-master/css/verify.css" />
<script type="text/javascript" src="${basePath }verify-master/js/verify.min.js"></script>

</head>
<body>
	<script type="text/javascript" src="${basePath }js/notie.js"></script>
	<script type="text/javascript" src="${basePath }js/notie_tips.js"></script>
	<!-- 信息提示标签 -->
	<input type="hidden" value="${errorMsg}" id="msg" />
	<div class="top-content" >
		<div class="inner-bgx">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 form-box">
						<div class="form-top" style="margin-top: 85px"> 
							<div class="form-top-left">
								<h3>信盈达&nbsp;&nbsp;&nbsp;企业差旅管理平台</h3>
							</div> 
							<div class="form-top-right">
								<i class="fa fa-lock"><img src="${basePath }images/login-lock.png"></i>
							</div>
						</div>
						<div class="form-bottom" >
							<form id="login" action="${basePath }login" role="form" method="post" class="form-horizontal">
								<div class="form-group" id="eidDiv">
									<div class="col-md-12">
										<!-- 定义表单输入组件 -->
										<input type="text" id="eid" name="eid" class="form-control" value="admin"
											placeholder="请输入登录帐号">
									</div>
								</div>
								<span style="color: red;">${requestScope.errorMsg.eidError}</span>
								<span style="color: red;">${requestScope.logMsg}</span>
								<br>
								<div class="form-group" id="passwordDiv">
									<div class="col-md-12">
										<!-- 定义表单输入组件 -->
										<input type="password" id="password" name="password" class="form-control" value="a123456"
											placeholder="请输入登录密码...">
									</div>
								</div>
							<span style="color: red;">${requestScope.errorMsg.passwordError}</span>
								<br> 
								<button type="button" id="loginBtn" class="btn btn-primary">登录系统</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 验证模态框 -->
	<div class="modal fade" id="validateModal" role="dialog" aria-labelledby="gridSystemModalLabel">
	  <div class="modal-dialog " role="document" style="width: 460px;height: 205px;">
	    <div class="modal-content">
	      <div class="modal-body" >
	        <div class="container-fluid">
	          	<div id="mpanel" style="margin-left:0px;">
        		</div>
	        </div>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
</body>
</html>
