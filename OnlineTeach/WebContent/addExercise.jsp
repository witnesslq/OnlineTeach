<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html id="generateCoursePlan">
<head>
<meta charset="utf-8">
<title>添加题目</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css" />

</head>

<body>

	<jsp:include page="include/header.jsp" />
	<div class="container">
		<div class="subMainNav">
			<div class="currentLocation">
				<a href="main.jsp">在线教学</a>> <a href="#">教学排课</a>> <a href="#">学期课表生成</a>
			</div>
			<div class="subMainNavItem" id="subNavA" style="display: block;">
				<ul>
					<li><a href="generateCourseplan.jsp" onClick="return true;"
						class="subMainNavItemActive">学期课表生成</a></li>
					<li><a href="courseplanCateSearch.jsp" onClick="return true;">课表分类查询</a></li>
					<li><a href="courseplanExport.jsp" onClick="return true;">课表分类导出</a></li>
					<li><a href="courseplanUphold.jsp" onClick="return true;">课表分类维护</a></li>
				</ul>
			</div>
			<div class="subMainNavItem" id="subNavB">
				<ul>
					<li><a href="createWork.jsp" onClick="return true;">课堂练习创建</a></li>
					<li><a href="workReply.jsp" onClick="return true;">课堂练习作答</a></li>
					<li><a href="workCheck.jsp" onClick="return true;">训练结果考核</a></li>
					<li><a href="workUphold.jsp" onClick="return true;">课堂练习维护</a></li>
				</ul>
			</div>
			<div class="subMainNavItem" id="subNavC">
				<ul>
					<li><a href="teachplanUphold.jsp" onClick="return true;">教案制作维护</a></li>
					<li><a href="coursewareUp_Down.jsp" onClick="return true;">课件上传下载</a></li>
					<li><a href="homeWork.jsp" onClick="return true;">课外作业管理</a></li>
					<li><a href="teachSchedule.jsp" onClick="return true;">授课计划管理</a></li>
				</ul>
			</div>
			<div class="subMainNavItem" id="subNavD">
				<ul>
					<li><a href="attendance.jsp" onClick="return true;">在线考勤管理</a></li>
					<li><a href="projectReply.jsp" onClick="return true;">项目答辩考核</a></li>
					<li><a href="compositeCheck.jsp" onClick="return true;">课程综合考核</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="site">
		<div class="container">
			<h3 class="autoplantitle">添加学生</h3>
			<div class=" mainbox">
				<div>
					<form action="addStudent">
						<input type="text" name="stuName"/>
						<input type="submit" />
					</form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>
