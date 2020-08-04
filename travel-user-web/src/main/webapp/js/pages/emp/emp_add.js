$(function() {
	//加载部门数据
	getDept();
	getLevel();
})

function getDept() {
	requestUrl = "/dept/findDept";
	$.when(ajaxRequest()).done(function(resultData) {
		//清空源有的数据
		$("#emp_add_dept").html("");
		$("#emp_add_dept").append("<option>=======请选择该员工所在的部门=======</option>");

		//把查询到的数据进行遍历添加到选项中
		$.each(resultData.data, function(i, dept) {
			$("#emp_add_dept").append('<option value="' + dept.did + '">' + dept.dname + '</option>');
		});
	});
}
function getLevel() {
	requestUrl = "/level/findLevel";
	$.when(ajaxRequest()).done(function(resultData) {
		//清空源有的数据
		$("#emp_add_level").html("");
		$("#emp_add_level").append("<option>=======请选择该员工职位=======</option>");

		//把查询到的数据进行遍历添加到选项中
		$.each(resultData.data, function(i, level) {
			$("#emp_add_level").append('<option value="' + level.lid + '">' + level.title + '</option>');
		});
	});
}
function addEmp() {
	//使用插件进行数据的验证
	notie.confirm(
		"是否提交当前表单数据？", '确认', '取消',
		function() {
			$("#addEmpForm")[0].submit();
		});
}