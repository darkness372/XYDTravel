
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	//String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/";
	request.setAttribute("basePath", basePath);
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css"
	href="${basePath }bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="<%=basePath%>css/dashboard.css" rel="stylesheet">
<link href="<%=basePath%>css/easyui.css" rel="stylesheet">

<link href="<%=basePath%>css/muyu.css" rel="stylesheet">

<script src="${basePath}js/jedate/jedate.js"></script>
<script type="text/javascript" src="${basePath }js/jquery/jquery.min.js"></script>
<script type="text/javascript"
	src="${basePath }bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/jquery/jquery.easyui.min.js"></script>

<script type="text/javascript" src="<%=basePath%>js/loading.js"></script>
<script type="text/javascript" src="<%=basePath%>js/muyu.js"></script>
