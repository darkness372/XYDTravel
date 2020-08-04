<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/publicPage/head.jsp" />
<jsp:include page="/WEB-INF/publicPage/head_menu.jsp" />

<!-- 内容主体区域 -->
<script src="${basePath}js/pages/dept/dept_list.js"></script>
<div class="layui-body" align="center" id="dataMain"
	style="background-image:url(${basePath }images/login_bgx.gif)">
	<div class="panel panel-success">
		<div class="panel-heading" align="center" style="height: 100px;">
			<h1 class="panel-title"
				style="color: deeppink; font-size: 30px; font: '宋体'; margin-top: 16px;">
				<span class="glyphicon glyphicon-list" aria-hidden="true"></span>
				&nbsp;部门列表
			</h1>
		</div>
		<div class="panel-body">

			<div style="width: 80%; margin-top: 20px; margin-left: 10%">
				<table class="table table-condensed">
					<thead>
						<tr>
							<th class="text-center">部门名称</th>
							<th class="text-center">领导姓名</th>
							<th class="text-center">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${allDepts}" var="dept">
							<tr>
								<td class="text-center"><input type="text"
									id="dname-${dept.did}" class="form-control"
									value="${dept.dname}"></td>
								<td class="text-center" id="mgr-${dept.did}"><span
									id="eid-${dept.eid}" style="cursor: pointer;" alt="${dept.did}">${empMap[dept.eid]}</span>
								</td>
								<td class="text-center">
									<button id="edit-${dept.did}" class="btn btn-warning">
										<span class="glyphicon glyphicon-edit"></span>&nbsp;编辑
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

<!-- 内容主体区域 -->
<jsp:include page="/WEB-INF/pages/info/modal_empInfo.jsp" />

<jsp:include page="/WEB-INF/publicPage/menu.jsp">
	<jsp:param name="xydTravel" value="1" />
</jsp:include>

<jsp:include page="/WEB-INF/publicPage/foot.jsp" />