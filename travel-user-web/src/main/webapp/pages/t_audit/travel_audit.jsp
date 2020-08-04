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
				<span class="glyphicon glyphicon-check" aria-hidden="true"></span>
				&nbsp;出差申请审核
			</h1>
		</div>
		<div class="panel-body">
			<div style="width: 80%; margin-top: 20px; margin-left: 10%;">
				<div>
					<table class="table table-striped table-bordered table-hover">
						<tr>
							<td style="width: 150px;">申请标题：</td>
							<td>${travel.title}</td>
						</tr>
						<tr>
							<td>出差类型：</td>
							<td>${allItems[travel.iid]}</td>
						</tr>
						<tr>
							<td>总费用：</td>
							<td>￥${travel.total}</td>
						</tr>
						<tr>
							<td>总人数：</td>
							<td>${travel.ecount}人</td>
						</tr>
						<tr>
							<td>申请日期：</td>
							<td><fmt:formatDate value="${travel.subdate}"
									pattern="yyyy-MM-dd" /></td>
						</tr>
						<tr>
							<td>出发日期：</td>
							<td><fmt:formatDate value="${travel.sdate}"
									pattern="yyyy-MM-dd" /></td>
						</tr>
						<tr>
							<td>返回日期：</td>
							<td><fmt:formatDate value="${travel.edate}"
									pattern="yyyy-MM-dd" /></td>
						</tr>
						<tr>
							<td>目的地：</td>
							<td>${travel.dest}</td>
						</tr>
					</table>
				</div>
				<div>
					<form class="form-horizontal" action="" id="myform" method="post">
						<fieldset>
							<div class="form-group" id="auditDiv">
								<!-- 定义表单提示文字 -->
								<label class="col-md-3 control-label" for="audit">审核结论：</label>
								<div class="col-md-5">
									<div class="radio-inline">
										<label><input type="radio" id="audit" name="audit"
											value="2" checked> &nbsp;<span class="text-danger">拒绝</span></label>
									</div>
									<div class="radio-inline">
										<label><input type="radio" id="audit" name="audit"
											value="1"> &nbsp;<span class="text-success">通过</span></label>
									</div>
								</div>
								<!-- 定义表单错误提示显示元素 -->
								<div class="col-md-4" id="auditMsg"></div>
							</div>
							<!-- 定义输入表单样式，其中id主要用于设置颜色样式 -->
							<div class="form-group" id="noteDiv">
								<!-- 定义表单提示文字 -->
								<label class="col-md-3 control-label" for="anote">审核备注：</label>
								<div class="col-md-5">
									<!-- 定义表单输入组件 -->
									<textarea id="anote" name="anote" rows="5" class="form-control"
										placeholder="请输入审核所给出的意见信息" rows="10"></textarea>
								</div>
								<!-- 定义表单错误提示显示元素 -->
								<div class="col-md-4" id="anoteMsg"></div>
							</div>
							<div class="form-group">
								<div class="col-md-5 col-md-offset-3">
									<input type="hidden" name="tid" id="tid" value="${param.tid}">
									<button type="submit" class="btn btn-primary">审核处理</button>
									<button type="reset" class="btn btn-warning">重置</button>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
				<div class="panel-group" id="news">
					<div class="panel panel-info">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="news" href="#contentOne">
									<span class="glyphicon glyphicon-user"></span>&nbsp;出差人员安排（总人数：${travel.ecount}）
								</a>
							</h4>
						</div>
						<div id="contentOne" class="panel-collapse collapse">
							<div class="panel-body">
								<table class="table table-condensed">
									<thead>
										<tr>
											<th class="text-center">照片</th>
											<th class="text-center">姓名</th>
											<th class="text-center">联系电话</th>
											<th class="text-center">工资</th>
											<th class="text-center">级别</th>
											<th class="text-center">雇佣日期</th>
											<th class="text-center">部门</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${allEmps}" var="emp">
											<tr id="travelEmp-${emp.eid}">
												<td class="text-center"><img
													src="images/photo/${emp.photo}" style="width: 20px;" /></td>
												<td class="text-center">${emp.eid}</td>
												<td class="text-center">${emp.ename}</td>
												<td class="text-center">￥${emp.sal}</td>
												<td class="text-center">${allLevels[emp.lid]}</td>
												<td class="text-center">${allDepts[emp.did]}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="news" href="#contentTwo">
									<span class="glyphicon glyphicon-list-alt"></span>&nbsp;出差费用支出项（总费用￥<span
									id="allPrice" class="text-danger h2">${travel.total}</span>）
								</a>
							</h4>
						</div>
						<div id="contentTwo" class="panel-collapse collapse">
							<div class="panel-body">
								<table class="table table-condensed">
									<thead>
										<tr>
											<th class="text-center">支出类型</th>
											<th class="text-center">费用</th>
											<th class="text-center">用途</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${allCosts}" var="cost">
											<tr id="travelCost-${cost.tcid}">
												<td class="text-center">${allTypes[cost.tpid]}</td>
												<td class="text-center">￥<span id="price-${cost.tcid}">${cost.price}</span></td>
												<td class="text-center">${cost.title}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

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