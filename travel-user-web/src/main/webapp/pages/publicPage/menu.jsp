<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="layui-side layui-bg-black">
	<div class="layui-side-scroll">

		<div class="panel-heading">

			<span style="margin-left: 12px;">企业差旅管理平台</span>
		</div>

		<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
		<ul class="layui-nav layui-nav-tree" lay-filter="test">
			<li
				class="layui-nav-item  ${param.xydTravel==1 ? 'layui-nav-itemed' : ''}">

				<a class="" href="javascript:void();" >员工管理</a>
				<dl class="layui-nav-child">
					<dd>
						<a href="${basePath }pages/dept/dept_list.jsp">部门列表</a>
					</dd>

					<dd>
						<a href="${basePath }pages/emp/emp_add.jsp">添加员工</a>
					</dd>

					<dd>
						<a href="${basePath }pages/emp/emp_list.jsp" >员工列表</a>
					</dd>
				</dl> 

			</li>

			<li
				class="layui-nav-item ${param.xydTravel==2 ? 'layui-nav-itemed' : ''}">
				<a class="" href="javascript:void();">差旅安排</a>
				<dl class="layui-nav-child ">

					<dd>
						<a href="javascript:void();" >出差申请</a>
					</dd>
					<dd>
						<a href="javascript:void();" >我的申请</a>
					</dd>

					<dd>
						<a href="javascript:void();" >我的出差</a>
					</dd>
				</dl>
			</li>
			<li
				class="layui-nav-item ${param.xydTravel==3 ? 'layui-nav-itemed' : ''}">
				<a href="javascript:void();">差旅审核</a>
				<dl class="layui-nav-child">
					<dd>
						<a href="javascript:void();" >待审核差旅申请</a>
					</dd>
					<dd>
						<a href="javascript:void();" >申请列表</a>
					</dd>
				</dl>
			</li>

		</ul>
	</div>
</div>