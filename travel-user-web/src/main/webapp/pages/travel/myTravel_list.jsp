<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/publicPage/head.jsp" />

<jsp:include page="/WEB-INF/publicPage/head_menu.jsp" />

<!-- 内容主体区域 -->
<script src="${basePath}js/pages/travel/myTravel_list.js"></script>
<div class="layui-body" align="center" id="dataMain"
	style="background-image:url(${basePath }images/login_bgx.gif)">
	<div class="panel panel-success">
		<div class="panel-heading" align="center" style="height: 100px;">
			<h1 class="panel-title"
				style="color: deeppink; font-size: 30px; font: '宋体'; margin-top: 16px;">
				<span class="glyphicon glyphicon-list" aria-hidden="true"></span>
				&nbsp;我的出差申请列表
			</h1>
		</div>
		<div class="panel-body">
			<input type="hidden" value="${sessionScope.emp.eid}"
				id="MyTravel_eid" />
			<div style="width: 100%; margin-top: 20px;">
				<div class="col-md-5">
					<input type="text" name="kw" id="kw" value=""
						class="form-control input-sm" placeholder="请输入检索关键字">
				</div>
				<div class="col-md-2" style="margin-bottom: 15px;">
					<input type="button" value="查询" class="btn btn-primary">
				</div>
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
								<td class="text-center"><c:if test="${trv.audit==9}">
										<span class="text-primary"><span
											class="glyphicon glyphicon-flag"></span>&nbsp;待提交</span>
									</c:if> <c:if test="${trv.audit==0}">
										<span class="text-info"><span
											class="glyphicon glyphicon-flag"></span>&nbsp;审核中</span>
									</c:if> <c:if test="${trv.audit==1}">
										<span class="text-success"><span
											class="glyphicon glyphicon-flag"></span>&nbsp;进行中</span>
									</c:if> <c:if test="${trv.audit==2}">
										<span class="text-warning"><span
											class="glyphicon glyphicon-flag"></span>&nbsp;已拒绝</span>
									</c:if> <c:if test="${trv.audit==3}">
										<span class="text-danger"><span
											class="glyphicon glyphicon-flag"></span>&nbsp;已完成</span>
									</c:if></td>
								<td class="text-center"><span id="showBtn-${trv.tid}"
									onmouseover="this.style.cursor='hand'">${trv.title}</span></td>

								<td class="text-center">${trv.subdate}</td>
								<td class="text-center">${trv.sdate}</td>
								<td class="text-center">${trv.edate}</td>
								<td class="text-center">${trv.ecount}</td>
								<td class="text-center">￥${trv.total}</td>

								<td class="text-center"><c:if
										test="${trv.audit==9 || trv.audit==2}">
										<button class="btn btn-primary btn-xs" id="submit-${trv.tid}">
											<span class="glyphicon glyphicon-cloud-upload"></span>&nbsp;提交申请
										</button>

										<button class="btn btn-warning btn-xs" id="empAdd-${trv.tid}">
											<span class="glyphicon glyphicon-user"></span>&nbsp;出差人员
										</button>

										<button class="btn btn-warning btn-xs" id="costAdd-${trv.tid}">
											<span class="glyphicon glyphicon-credit-card"></span>&nbsp;出差费用
										</button>

										<button class="btn btn-info btn-xs" id="edit-${trv.tid}">
											<span class="glyphicon glyphicon-edit"></span>&nbsp;编辑
										</button>

										<button class="btn btn-danger btn-xs" id="delete-${trv.tid}">
											<span class="glyphicon glyphicon-remove"></span>&nbsp;删除
										</button>
									</c:if></td>
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
<jsp:include page="/WEB-INF/pages/info/modal_travelInfo_.jsp" />

<jsp:include page="/WEB-INF/publicPage/menu.jsp">
	<jsp:param name="xydTravel" value="2" />
</jsp:include>
<jsp:include page="/WEB-INF/publicPage/foot.jsp" />