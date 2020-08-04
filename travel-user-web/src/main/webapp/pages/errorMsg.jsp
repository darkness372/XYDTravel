<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/pages/publicPage/head.jsp" />

<jsp:include page="/pages/publicPage/head_menu.jsp" />
<script src="${basePath}js/jquery/jquery.form.min.js"></script>

<!-- 内容主体区域 -->
<script src="${basePath}js/pages/emp/emp_add.js"></script>
<div class="layui-body" align="center" id="dataMain"
	style="background-image:url(${basePath }images/login_bgx.gif)">
	<div class="panel panel-success">
		<div class="panel-heading" align="center" style="height: 100px;">
			<h1 class="panel-title"
				style="color: red; font-size: 30px; font: '宋体'; margin-top: 16px;">
				<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
				&nbsp;错误提示：
			</h1>
		</div>
		<div class="panel-body" align="center">
			<br />
			<h1 style="color: #FF0080;font-size: 22px; font: '宋体';">${errorMessage}</h1>
			<br />
		</div>
		<div class="panel-footer" align="center">
			꧁༺๑ <span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
			๑༻꧂
		</div>
	</div>

</div>

<!-- 内容主体区域 -->

<jsp:include page="/pages/publicPage/menu.jsp" />

<jsp:include page="/pages/publicPage/foot.jsp" />