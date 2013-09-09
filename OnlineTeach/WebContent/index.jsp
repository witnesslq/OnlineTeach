<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html id="generateCoursePlan">
<head>
<meta charset="utf-8">
<title>主页</title>
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" />
<base href='http://<%=request.getServerName()+":"+request.getLocalPort()+request.getContextPath()+request.getServletPath()%>' />
</head>

<body>

	<jsp:include page="include/header.jsp" />
	<div class="container">
		<div class="subMainNav">
			<div class="currentLocation">
				<a href="main.jsp">在线教学</a>> <a href="#">教学排课</a>> <a href="#">学期课表生成</a>
			</div>
			<jsp:include page="include/menu2.jsp"></jsp:include>
		</div>
	</div>
	<div class="site">
		<div class="container">
			<div class="indexMainbox"></div>
		</div>
	</div>
	<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>
