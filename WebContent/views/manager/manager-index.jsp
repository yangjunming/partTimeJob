<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>管理员!</title>
</head>
<body class="nav-md">
		<div class="container body">
				<div class="main_container">
						<div class="col-md-3 left_col">
								<div class="left_col scroll-view">
										<div class="navbar nav_title" style="border: 0;">
												<!--               <a href="index.html" class="site_title"><i class="fa fa-paw"></i> <span>Gentelella Alela!</span></a> -->
										</div>

										<div class="clearfix"></div>

										<!-- menu profile quick info -->
										<div class="profile clearfix">
												<div class="profile_pic">
														<img src="<%=basePath%>resources/production/images/img.jpg" alt="..." class="img-circle profile_img">
												</div>
												<div class="profile_info">
														<span>欢迎,</span>
														<h2>${sessionScope.User.userName}</h2>
												</div>
										</div>
										<!-- /menu profile quick info -->
										<br />
										<!-- sidebar menu -->
										<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
												<div class="menu_section">
<!-- 														<h3>General</h3> -->
														<ul class="nav side-menu">
																<li><a><i class="fa fa-home"></i> 个人信息管理 <span class="fa fa-chevron-down"></span></a>
																		<ul class="nav child_menu">
																				<li><a href="<%=basePath%>views/manager/edit-personalInfo.jsp">修改个人信息</a></li>
																				<li><a href="<%=basePath%>views/manager/edit-password.jsp">修改登录密码</a></li>
																		</ul>
																	</li>
																	<li><a><i class="fa fa-edit"></i>人员管理 <span class="fa fa-chevron-down"></span></a>
																		<ul class="nav child_menu">
																				<li><a href="<%=basePath%>views/manager/user-list.jsp">人员列表</a></li>
																		</ul>
																	</li>
																	<li><a><i class="fa fa-desktop"></i>系统管理 <span class="fa fa-chevron-down"></span></a>
																		<ul class="nav child_menu">
																				<li><a href="<%=basePath%>views/manager/system-message.jsp">系统公告</a></li>
																				<li><a href="<%=basePath%>views/manager/info-list.jsp">兼职信息管理</a></li>
																		</ul>
																	</li>
														</ul>
												</div>
										</div>
										<!-- /sidebar menu -->
										<!-- /menu footer buttons -->
										<!-- /menu footer buttons -->
								</div>
						</div>
						<!-- top navigation -->
						<div class="top_nav">
								<div class="nav_menu">
										<nav>
												<div class="nav toggle">
														<a id="menu_toggle"><i class="fa fa-bars"></i></a>
												</div>

												<ul class="nav navbar-nav navbar-right">
														<li class=""><a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown"
																aria-expanded="false"> <img src="<%=basePath%>resources/production/images/img.jpg" alt="">${sessionScope.User.userName}
																		<span class=" fa fa-angle-down"></span>
														</a>
																<ul class="dropdown-menu dropdown-usermenu pull-right">
<!-- 																		<li><a href="javascript:;"> 修改个人信息</a></li> -->
																		<li><a href="javascript:logout()"><i class="fa fa-sign-out pull-right"></i> 退出</a></li>
																</ul></li>
												</ul>
										</nav>
								</div>
						</div>
						<!-- /top navigation -->

						<!-- page content -->
						<div></div>
						<!-- /page content -->
						<div class="right_col" role="main"></div>
						<!-- footer content -->
						<footer>
								<div class="clearfix"></div>
						</footer>
						<!-- /footer content -->
				</div>
		</div>
		<!-- Custom Theme Scripts -->
		<script src="<%=basePath%>resources/build/js/custom.js"></script>
		<script type="text/javascript">
		</script>
</body>
</html>
