<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/publicPage/head.jsp" />

<jsp:include page="/WEB-INF/publicPage/head_menu.jsp" />
<script src="${basePath}js/jquery/jquery.form.min.js"></script>

<!-- 内容主体区域 -->
<%-- <script src="${basePath}js/pages/emp/emp_add.js"></script> --%>

<div class="layui-body" align="center" id="dataMain"
	style="background-image:url(${basePath }images/login_bgx.gif)">
	<div class="panel panel-success">
		<div class="panel-heading" align="center" style="height: 100px;">
			<h1 class="panel-title"
				style="color: deeppink; font-size: 30px; font: '宋体'; margin-top: 16px;">
				<span class="glyphicon glyphicon-retweet" aria-hidden="true"></span>
				&nbsp;审核提交的出差申请
			</h1>
		</div>
		<div class="panel-body">

			<div style="width: 100%; margin-top: 20px;">
				<form action="" method="post" class="form-group">
					<div class="form-group">
						<div class="col-md-3" style="width: 250px;">
							<select id="col" name="col" class="form-control">
								<option>申请标题</option>
								<option>状态</option>
								<option>申请日期</option>
								<option>开始日期</option>
							</select>
						</div>
						<div class="col-md-5" style="width: 250px;">
							<input type="text" name="kw" id="kw" value=""
								class="form-control input-sm" placeholder="请输入检索关键字">
						</div>
						<div class="col-md-2" style="margin-bottom: 15px;">
							<input type="button" value="查询" class="btn btn-primary">
						</div>
					</div>
				</form>
				<table class="table table-condensed">
					<thead>
						<tr>
							<th class="text-center"><strong>状态</strong></th>
							<th class="text-center"><strong>申请标题</strong></th>
							<th class="text-center"><strong>申请日期</strong></th>
							<th class="text-center"><strong>开始日期</strong></th>
							<th class="text-center"><strong>结束日期</strong></th>
							<th class="text-center"><strong>出差人数</strong></th>
							<th class="text-center"><strong>差旅费用</strong></th>
							<th class="text-center"><strong>操作</strong></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${allTravels}" var="trv">
							<tr id="travel-${trv.tid}">
								<td class="text-center"><span class="text-warning"><span
										class="glyphicon glyphicon-flag"></span>&nbsp;待审核</span></td>
								<td class="text-center">${trv.title}</td>
								<td class="text-center"><fmt:formatDate
										value="${trv.subdate}" pattern="yyyy-MM-dd" /></td>
								<td class="text-center"><fmt:formatDate
										value="${trv.sdate}" pattern="yyyy-MM-dd" /></td>
								<td class="text-center"><fmt:formatDate
										value="${trv.edate}" pattern="yyyy-MM-dd" /></td>
								<td class="text-center">${trv.ecount}人</td>
								<td class="text-center">￥${trv.total}</td>
								<td class="text-center"><a type="button"
									class="btn btn-primary btn-xs" href=""> <span
										class="glyphicon glyphicon-cloud-upload"></span>&nbsp;处理申请
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<jsp:include page="/WEB-INF/publicPage/paginButt.jsp" />
			</div>
		</div>
		<div class="panel-footer" align="center">
			꧁༺๑ <span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
			๑༻꧂
		</div>
	</div>

</div>

<!-- 内容主体区域 -->

<jsp:include page="/WEB-INF/publicPage/menu.jsp">
	<jsp:param name="xydTravel" value="3" />
</jsp:include>
<jsp:include page="/WEB-INF/publicPage/foot.jsp" />