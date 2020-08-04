<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/publicPage/head.jsp" />

<jsp:include page="/WEB-INF/publicPage/head_menu.jsp" />

<!-- 内容主体区域 -->
<script src="${basePath}js/pages/travel/travel_edit.js"></script>

<div class="layui-body" align="center" id="dataMain"
	style="background-image:url(${basePath }images/login_bgx.gif)">
	<div class="panel panel-success">
		<div class="panel-heading" align="center" style="height: 100px;">
			<h1 class="panel-title"
				style="color: deeppink; font-size: 30px; font: '宋体'; margin-top: 16px;">
				<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
				&nbsp;出差申请单
			</h1>
		</div>
		<div class="panel-body">
			<div style="width: 80%; margin-top: 20px; margin-left: 18%;">
				<form class="form-horizontal" action="" id="addTravel_form"
					method="post" onsubmit="return addTravel_form()">
					<input type="hidden" name="seid" value="${sessionScope.emp.eid}" />

					<fieldset>
						<!-- 定义输入表单样式，其中id主要用于设置颜色样式 -->
						<div class="form-group" id="titleDiv">
							<!-- 定义表单提示文字 -->
							<label class="col-md-3 control-label" for="title">申请标题：</label>
							<div class="col-md-5">
								<!-- 定义表单输入组件 -->
								<input type="text" id="title" name="title" class="form-control"
									placeholder="请输入出差申请标题">
							</div>
							<!-- 定义表单错误提示显示元素 -->
							<div class="col-md-4 text-danger" id="titleMsg">${errors['title']}</div>
							<!--成功提示-->
							<div class="col-md-4" style="color: red;" id="titleSuccessMsg"></div>
						</div>
						<!-- 定义输入表单样式，其中id主要用于设置颜色样式 -->
						<div class="form-group" id="destDiv">
							<!-- 定义表单提示文字 -->
							<label class="col-md-3 control-label" for="dest">出差目的地：</label>
							<div class="col-md-5">
								<!-- 定义表单输入组件 -->
								<input type="text" id="dest" name="dest" class="form-control"
									placeholder="请输入出差目的地">
							</div>
							<!-- 定义表单错误提示显示元素 -->
							<div class="col-md-4 text-danger" id="destMsg">${errors['dest']}</div>
						</div>
						<div class="form-group" id="iidDiv">
							<!-- 定义表单提示文字 -->
							<label class="col-md-3 control-label" for="iid">出差类型：</label>
							<div class="col-md-5">
								<select id="travel_add_iid" name="iid" class="form-control">
									<option value="">====== 请选择外出类型 ======</option>
								</select>
							</div>
							<!-- 定义表单错误提示显示元素 -->
							<div class="col-md-4 text-danger" id="iidMsg">${errors['iid']}</div>
						</div>
						<div class="form-group" id="sdateDiv">
							<!-- 定义表单提示文字 -->
							<label class="col-md-3 control-label" for="sdate">出差开始日期：</label>
							<div class="col-md-5">
								<!-- 定义表单输入组件 -->
								<input type="text" id="sdate" name="sdate" class="form-control"
									placeholder="请选择出差开始时间">
							</div>
							<!-- 定义表单错误提示显示元素 -->
							<div class="col-md-4 text-danger" id="sdateMsg">
								${errors['sdate']}${errors['dateError']}</div>
						</div>
						<div class="form-group" id="edateDiv">
							<!-- 定义表单提示文字 -->
							<label class="col-md-3 control-label" for="edate">出差结束日期：</label>
							<div class="col-md-5">
								<!-- 定义表单输入组件 -->
								<input type="text" id="edate" name="edate" class="form-control"
									placeholder="请选择出差结束时间">
							</div>
							<!-- 定义表单错误提示显示元素 -->
							<div class="col-md-4 text-danger" id="edateMsg">${errors['edate']}</div>
						</div>
						<!-- 定义输入表单样式，其中id主要用于设置颜色样式 -->
						<div class="form-group" id="noteDiv">
							<!-- 定义表单提示文字 -->
							<label class="col-md-3 control-label" for="note">出差事由：</label>
							<div class="col-md-5">
								<!-- 定义表单输入组件 -->
								<textarea id="note" name="note" class="form-control"
									placeholder="请输入本次出差要处理的业务详情" rows="10"></textarea>
							</div>
							<!-- 定义表单错误提示显示元素 -->
							<div class="col-md-4 text-danger" id="noteMsg">${errors['note']}</div>
						</div>
						<div class="form-group">
							<div class="col-md-5 col-md-offset-3" align="center">
								<input type="hidden" name="tid" id="tid" value="${travel.tid}">
								<button type="submit" class="btn btn-primary">修改</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="reset" class="btn btn-warning">重置</button>
							</div>
						</div>
					</fieldset>
				</form>

			</div>
		</div>
		<div class="panel-footer" align="center">
			꧁༺๑ <span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
			๑༻꧂
		</div>
	</div>

</div>

<script type="text/javascript">
	jeDate({
		dateCell: "#sdate",
		format: "YYYY-MM-DD",
		isinitVal: true,
		minDate: "2014-09-19",
		choosefun: function(val) { //选中日期后的回调

		},
		okfun: function(val) {
			alert(val)
		}
	})
	jeDate({
		dateCell: "#edate",
		format: "YYYY-MM-DD",
		isinitVal: true,
		minDate: "2014-09-19",
		choosefun: function(val) { //选中日期后的回调

		},
		okfun: function(val) {
			alert(val)
		}
	})
</script>

<!-- 内容主体区域 -->

<jsp:include page="/WEB-INF/publicPage/menu.jsp">
	<jsp:param name="xydTravel" value="2" />
</jsp:include>
<jsp:include page="/WEB-INF/publicPage/foot.jsp" />