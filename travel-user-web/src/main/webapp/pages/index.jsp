<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/pages/publicPage/head.jsp" />

<jsp:include page="/pages/publicPage/head_menu.jsp" />

<!-- 内容主体区域 -->

<div class="layui-body" align="center" id="dataMain"
	style="background-image:url(${basePath }images/login_bgx.gif)">

	<img alt="信盈达_企业差旅管理平台" src="${basePath }images/welcome_index.png"
		style="margin-top: 15px;">

</div>

<!-- 内容主体区域 -->

<jsp:include page="/pages/publicPage/menu.jsp">
	<jsp:param name="xydTravel" value="0" />
</jsp:include>

<jsp:include page="/pages/publicPage/foot.jsp" />