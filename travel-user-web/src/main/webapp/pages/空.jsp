<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/pages/publicPage/head.jsp" />

<jsp:include page="/pages/publicPage/head_menu.jsp" />
<script src="${basePath}js/jquery/jquery.form.min.js"></script>

<!-- 内容主体区域 -->
<%-- <script src="${basePath}js/pages/emp/emp_add.js"></script> --%>

<div class="layui-body" align="center" id="dataMain"
	style="background-image:url(${basePath }images/login_bgx.gif)">
	<div class="panel panel-success">
		<div class="panel-heading" align="center" style="height: 100px;">
			<h1 class="panel-title"
				style="color: deeppink; font-size: 30px; font: '宋体'; margin-top: 16px;">
				<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
				&nbsp;员工添加界面
			</h1>
		</div>
		<div class="panel-body">

			<div style="width: 100%; margin-top: 20px;"></div>
		</div>
		<div class="panel-footer" align="center">
			꧁༺๑ <span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
			๑༻꧂
		</div>
	</div>

</div>

<!-- 内容主体区域 -->

<jsp:include page="/pages/publicPage/menu.jsp">
	<jsp:param name="xydTravel" value="3" />
</jsp:include>
<jsp:include page="/pages/publicPage/foot.jsp" />