<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="layui-layout layui-layout-admin">
	<div class="layui-header">
		<div class="layui-logo">
			<img alt="" src="${basePath}images/logo_1.png" style="width: 100%;">
		</div>
		<!-- 头部区域（可配合layui已有的水平导航） -->
		<ul class="layui-nav layui-layout-left">
			<li class="layui-nav-item"><a href="javascript:void();"">首 页</a></li>
			<li class="layui-nav-item"><a href="javascript:void();">控制台</a></li>
			<li class="layui-nav-item"><a href="javascript:void();">用户管理</a></li>
			<li class="layui-nav-item"><a href="javascript:void();">其它系统</a>
				<dl class="layui-nav-child">
					<dd>
						<a href="javascript:void();">邮件管理</a>
					</dd>
					<dd>
						<a href="javascript:void();">消息管理</a>
					</dd>
					<dd>
						<a href="javascript:void();">授权管理</a>
					</dd>
				</dl></li>
		</ul>
		<ul class="layui-nav layui-layout-right">
			<li class="layui-nav-item"><a href="javascript:void();"
				style="color: white;"> <!--显示用户名和相片--> <img
					src="${basePath }images/photo/${sessionScope.emp.photo}"
					class="layui-nav-img">
				${sessionScope.emp.eid}
			</a>
				<dl class="layui-nav-child">
					<dd>
						<a href="javascript:void();">基本资料</a>
					</dd>
					<dd>
						<a href="javascript:void();">安全设置</a>
					</dd>
				</dl></li>
			<li class="layui-nav-item"><a href="${basePath}logout.action" style="color: white;">【退出】</a></li>
		</ul>
	</div>