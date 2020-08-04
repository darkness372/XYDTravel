var grid;

$(function () {
	//tatleInit ();
})

function tatleInit () {
	grid = BCGrid.create("#table", {
		url: 'http://localhost/user/emp/findEmpInfo',
		ajaxType:"get",	//Ajax请求默认是post
        columns: [
            {name: 'photo', display: '照片',render: function (item, index){
            	return '<img src="../../images/photo/' + item.photo + '" width="20px"  />';
            }},
            {name: 'eid', display: '登录ID'},
            {name: 'ename', display: '姓名'},
            {name: 'lid', display: '职务ID', hide: true},
            {name: 'tltie', display: '职务'},
            {name: 'did', display: '部门ID', hide: true},
            {name: 'dname', display: '部门'},
            {name: 'hiredate', display: '入职日期'},
            {name: 'sal', display: '基本工资'},
            {name: 'phone', display: '联系电话'},
            {name: 'action', display: '操作', render: function (item, index) {
                return '<button type="button" class="btn btn-info btn-xs">详情</button>&nbsp;&nbsp;&nbsp;'
                + '<button type="button" class="btn btn-danger btn-xs">删除</button>';
            }}

        ],
        rows: 'list', //数据源属性名，默认是rows
        pageParamName:"pageNum",		//设置分页查询的参数名，会自动填充相应的参数值
        pageSizeParamName: 'pageSize',  //默认就是pagesize
    	total: 'total', //数量问题，默认属性名就total  
        lang:'zh',
        serialNumWidth:5,	//序列号的列宽
        showTitle: true,
        showCheckbox: true,
        showSerialNum: true,
        pageSizeOptions: [5,10, 20, 30, 40, 50],
        pageSize:10,	//每页显示数量，默认是40条
	    loadingTip: '数据加载中ing...'//加载提示信息
    });
}

//设置请求参数重新加载数据
function reloadTableData () {
	//设置请求参数重新加载数据
	grid.set({'pageSize':4,'currPage':2});
	grid.reload();
}