<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    	当前的SessionId：${sessionScope.loginSessionId}
    	<hr />
    	<button onclick="test()">请求测试</button>
    	<script>
    		function test() {
    			$.ajax({
    				type:"get",
    				url:"localhost:8079/test",
    				//在发送请求前设置请求头
    				/*beforeSend:function (request) {
    					request.setRequestHeader("xydLoginToke","475466a8-9ab1-4bb5-a6e4-7b780d15459e");
    				}*/
    				headers:{
    					"xydLoginToke":"7b50f630-6b62-499a-9659-efb7f7fdfeb0"
    				},
    				success:function () {
    					alert("请求成功！");
    				},
    				error:function () {
    					alert("请求失败！");
    				}
    			});
    		}

    	</script>
 	</body>
</html>