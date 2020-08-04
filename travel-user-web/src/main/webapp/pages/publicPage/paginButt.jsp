<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div align="center" style="font-size: 18px; margin-top: 20px;">
	<ul class="pagination" id="paginButt">
		<li><a href='javascript:goPage(1)'>首页</a></li>
		<li><a href='javascript:goPage(" + result.upPage + ")'>上一页</a></li>
		<li><a href='javascript:void()'>第【1】页/共【1】页 总记录数：【1】条</a></li>
		<li><a href='javascript:goPage(" + result.nextPage + ")'>下一页</a>
		</li>
		<li><a href='javascript:goPage(" + result.pageCount + ")'>尾页</a>
		</li>

	</ul>
</div>