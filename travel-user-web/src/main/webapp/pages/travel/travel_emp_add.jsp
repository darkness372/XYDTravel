<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/publicPage/head.jsp" />

<jsp:include page="/WEB-INF/publicPage/head_menu.jsp" />

<!-- 内容主体区域 -->
<script src="${basePath}js/pages/travel/travel_emp_add.js"></script>

<div class="layui-body" align="center" id="dataMain"
	style="background-image:url(${basePath }images/login_bgx.gif)">
	<div class="panel panel-success">
		<div class="panel-heading" align="center" style="height: 100px;">
			<h1 class="panel-title"
				style="color: deeppink; font-size: 30px; font: '宋体'; margin-top: 16px;">
				<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
				&nbsp;出差人员列表
			</h1>
		</div>
		<div class="panel-body">

			<div style="width: 100%; margin-top: 20px;">
				<button class="btn btn-danger btn-lg" id="addBtn">
					<span class="glyphicon glyphicon-plus-sign"></span>&nbsp;增加出差人员
				</button>
				<table class="table table-condensed" id="travelEmpTable">
					<thead>
						<tr>
							<th class="text-center"><strong>照片</strong></th>
							<th class="text-center"><strong>雇员编号</strong></th>
							<th class="text-center"><strong>姓名</strong></th>
							<th class="text-center"><strong>工资</strong></th>
							<th class="text-center"><strong>级别</strong></th>
							<th class="text-center"><strong>部门</strong></th>
							<th class="text-center"><strong>操作</strong></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${allEmps}" var="emp">
							<tr id="travel-${emp.eid}">
								<td class="text-center"><img
									src="upload/member/${emp.photo}" style="width: 20px;" /></td>
								<td class="text-center">${emp.eid}</td>
								<td class="text-center">${emp.ename}</td>
								<td class="text-center">￥${emp.sal}</td>
								<td class="text-center">${allLevels[emp.lid]}</td>
								<td class="text-center">${allDepts[emp.did]}</td>
								<td class="text-center">
									<button class="btn btn-danger btn-xs"
										id="remove-${emp.eid}-${param.tid}">
										<span class="glyphicon glyphicon-remove"></span>&nbsp;移除
									</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
		</div>
		<div class="panel-footer" align="center">
			꧁༺๑ <span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
			๑༻꧂
		</div>
	</div>

</div>


<!-- 内容主体区域 ↑-->
<div class="modal fade" id="empInfo" tabindex="-1"
	aria-labelledby="modalTitle" aria-hidden="true" data-keyboard="true">
	<div class="modal-dialog" style="width: 1000px">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" type="button" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<div class="form-group" id="didDiv">
					<!-- 定义表单提示文字 -->
					<label class="col-md-2 control-label" for="did">员工所在部门：</label>
					<div class="col-md-5">
						<select id="did" name="did" class="form-control">
							<c:forEach items="${allDepts}" var="me">
								<option value="${me.key}" ${emp.did==me.key ? "selected" : ""}>${me.value}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			<div class="modal-body">
				<div id="memberBasicInfo">
					<table class="table table-condensed table-hover" id="empTable">
						<thead>
							<tr>
								<th class="text-center"><strong>照片</strong></th>
								<th class="text-center"><strong>雇员编号</strong></th>
								<th class="text-center"><strong>姓名</strong></th>
								<th class="text-center"><strong>工资</strong></th>
								<th class="text-center"><strong>级别</strong></th>
								<th class="text-center"><strong>操作</strong></th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<div id="pageDiv" class="text-right">
					<ul class="pagination pagination-sm" id="pagecontrol"></ul>
				</div>
			</div>
			<div class="modal-footer">
				<input type="hidden" id="tid" value="${param.tid}">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭窗口</button>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/publicPage/menu.jsp">
	<jsp:param name="xydTravel" value="2" />
</jsp:include>
<jsp:include page="/WEB-INF/publicPage/foot.jsp" />