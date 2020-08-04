<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/pages/publicPage/head.jsp" />
<jsp:include page="/pages/publicPage/head_menu.jsp" />
<script src="${basePath}js/jquery/jquery.form.min.js"></script>
<!--引入页面脚本-->
<script src="${basePath}js/pages/emp/emp_add.js"></script>
<script src="${basePath}js/muyu.js"></script>
<!-- 内容主体区域 -->
<div class="layui-body" align="center" id="dataMain"
	style="background-image:url(${basePath }images/login_bgx.gif)">
	<div class="panel panel-success">
		<div class="panel-heading" align="center" style="height: 100px;">
			<h1 class="panel-title"
				style="color: deeppink; font-size: 30px; font: '宋体'; margin-top: 16px;">
				<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
				&nbsp;员工添加界面
			</h1>
			<h3 class="panel-title" style="font-size: 20px;font:'宋体'; margin-top: 20px;">${message}</h3>
		</div>
		<div class="panel-body">
			<div style="width: 80%; margin-top: 20px;">
				<form action="emp/addEmp" class="form-horizontal" id="addEmpForm" role="form"
					style="margin-left: 30%;" method="post"
					enctype="multipart/form-data">
					<!-- 员工ID -->
					<div class="form-group">
						<label for="firstname" class="col-sm-2 control-label">员工ID</label>
						<div class="col-sm-10" style="width: 600px;">
							<input type="text" class="form-control" name="eid"
								placeholder="请输入员工登陆ID！" value="123456">
						</div>
					</div>

					<!-- 登陆密码 -->
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">登陆密码</label>
						<div class="col-sm-10" style="width: 600px;">
							<input type="text" class="form-control" name="password"
								placeholder="请输入登陆密码！">
						</div>
					</div>

					<!-- 员工姓名 -->
					<div class="form-group">
						<label for="firstname" class="col-sm-2 control-label">员工姓名</label>
						<div class="col-sm-10" style="width: 600px;">
							<input type="text" class="form-control" name="ename"
								placeholder="请输入员工姓名！"value="刘川枫">
						</div>
					</div>

					<!-- 基本工资 -->
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">基本工资</label>
						<div class="col-sm-10" style="width: 600px;">
							<input type="text" class="form-control" name="sal"
								placeholder="请输入员工的月薪资！"value="8000">
						</div>
					</div>

					<!-- 联系电话 -->
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">联系电话</label>
						<div class="col-sm-10" style="width: 600px;">
							<input type="text" class="form-control" name="phone"
								placeholder="请输入员工联系电话！"value="1878878687">
						</div>
					</div>

					<!-- 所属部门 -->
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">所属部门</label>
						<div class="col-sm-10" style="width: 600px;">
							<select class="form-control" name="did" id="emp_add_dept"
								onchange="">
								<option>=======请选择该员工所在的部门=======</option>
							</select>
						</div>
					</div>

					<!-- 员工职位 -->
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">员工职位</label>
						<div class="col-sm-10" style="width: 600px;">
							<select class="form-control" name="lid" id="emp_add_level">
								<option>=======请选择该员工的职位=======</option>
							</select>
						</div>
					</div>

					<!-- 照片上传 -->
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">文件输入</label>
						<div class="col-sm-10" style="width: 600px;">
							<input type="file" id="file" name="file">
							上传文件的类型：bmp、png、jpg、gif --- 上传文件的大小：100KB。
						</div>
					</div>

					<!-- 备注信息 -->
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">备注信息</label>
						<div class="col-sm-10" style="width: 600px;">
							<textarea class="form-control" rows="6" name="note"></textarea>
						</div>
					</div>


					<div class="form-group col-sm-offset-2 col-sm-10"
						style="margin-left: 36%;">
						<button type="button" class="btn btn-default" onclick="addEmp()">提交</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="reset" class="btn btn-default">重置</button>
					</div>
				</form>
			</div>
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