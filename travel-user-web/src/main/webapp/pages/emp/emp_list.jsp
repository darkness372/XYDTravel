<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/pages/publicPage/head.jsp" />
<jsp:include page="/pages/publicPage/head_menu.jsp" />
<script src="${basePath}bcgrid/bc.grid.min.js"></script>
<link rel="stylesheet" href="${basePath}bcgrid/css/bc.grid.min.css" />
<link rel="stylesheet" href="https://www.jq22.com/jquery/font-awesome.4.7.0.css">
<!-- 内容主体区域 -->
<script src="${basePath}js/pages/emp/emp_list.js"></script>
<style>
	th{
		text-align: center;
	}
</style>
<div class="layui-body" align="center" id="dataMain"
	style="background-image:url(${basePath }images/login_bgx.gif)">
	<div class="panel panel-success">
		<div class="panel-heading" align="center" style="height: 100px;">
			<h1 class="panel-title"
				style="color: deeppink; font-size: 30px; font: '宋体'; margin-top: 16px;">
				<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
				&nbsp;员工列表
			</h1>
		</div>
		<div class="panel-body">
			<div class="col-md-5" style="margin-top: 20px;">
				<input type="text" name="kw" id="kw" value=""
					class="form-control input-sm" placeholder="请输入检索关键字">
			</div>
			<div class="col-md-2" style="margin-bottom: 15px; margin-top: 18px;">
				<input type="button" value="查询" class="btn btn-primary">
			</div>
			<div class="col-md-2" style="margin-bottom: 15px; margin-top: 18px;">
				<button id="deleteBtn" class="btn btn-danger">删除所选雇员信息</button>
			</div>
			<div id="table"></div>
		</div>
		<div class="panel-footer" align="center">
			꧁༺๑ <span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
			๑༻꧂
		</div>
	</div>

</div>

<!-- 内容主体区域 -->

<jsp:include page="/pages/publicPage/menu.jsp">
	<jsp:param name="xydTravel" value="1" />
</jsp:include>
<jsp:include page="/pages/publicPage/foot.jsp" />