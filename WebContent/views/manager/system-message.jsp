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
																	<li class="active"><a><i class="fa fa-desktop"></i>系统管理 <span class="fa fa-chevron-down"></span></a>
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
																		<li><a href="javascript:logout()"><i class="fa fa-sign-out pull-right"></i> 退出</a></li>
																</ul></li>
												</ul>
										</nav>
								</div>
						</div>
						<!-- /top navigation -->
						<div class="right_col" role="main">
								<div class="x_panel">
										<div class="x_title">
												<h2>公告列表</h2>
												<div class="col-md-6"></div>
												<div class="col-md-5">
														<div class="col-md-5">
																<select class="form-control" id="type">
																		<option value="0">全部</option>
																		<option value="1">所有人可见</option>
																		<option value="2">企业用户可见</option>
																		<option value="3">求职用户可见</option>
																</select>
														</div>
														<div class="col-md-3">
																<select class="form-control" id="infoStatus">
																		<option value="0">全部</option>
																		<option value="1">正常</option>
																		<option value="2">已删除</option>
																</select>
														</div>
														<a class="btn btn-success" href="javascript:systemInfo();">搜索</a>
														<a class="btn btn-success" href="<%=basePath%>views/manager/add-systemInfo.jsp">新增</a>
												</div>
												<div class="clearfix"></div>
										</div>
										<div class="x_content">
												<table class="table">
														<thead>
																<tr>
																		<th>#</th>
																		<th>标题</th>
																		<th>内容</th>
																		<th>类型</th>
																		<th>创建时间</th>
																		<th>状态</th>
																		<th>操作</th>
																</tr>
														</thead>
														<tbody id="systemMessage">
														</tbody>
												</table>
										</div>
								</div>
						</div>
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
		$(function list(){
			systemInfo();
		});
		
		function systemInfo(){
			 $("#systemMessage tr").remove();
			 var type = $("#type").val();
			 var infoStatus = $("#infoStatus").val();
			 var datas = {"type":type,"status":infoStatus};
	  	 $.ajax({
	       type: "post",
	       url: "<%=basePath%>manager/getMessageList",
					data : JSON.stringify(datas),
					dataType : "json",
					contentType : 'application/json;charset=utf-8', //设置请求头信息  
					success : function(data) {
						console.log(data);
						if (data.length > 0) {
							var tr = "";
							for (var i = 0; i < data.length; i++) {
								var status = "";
								if (data[i].status == "1") {
									status = "正常";
								} else if (data[i].status == "2") {
									status = "已删除";
								}
								var type="";
								if(data[i].type==1){
									type = "所有人可见"
								}else if(data[i].type==2){
									type="企业用户可见";
								}else if(data[i].type==3){
									type="求职人员可见";
								}
								var content = "";
								if(data[i].content.length>10){
									content=data[i].content.substring(0,10);
								}else{
									content = data[i].content;
								}
								var j = Number(i) + Number(1);
								tr += "<tr>";
								tr += "<td>" + j + "</td>";
								tr += "<td>" + data[i].title + "</td>";
								tr += "<td>" + content + "</td>";
								tr += "<td>" + type + "</td>"
								tr += "<td>" + data[i].createDate + "</td>";
								tr += "<td>" + status + "</td>";
								if (data[i].status == 1) {
									tr += "<td><a class='remove btn btn-primary input-xs' href=${pageContext.request.contextPath}/views/manager/edit-systemInfo.jsp?id="+data[i].messageId+">详情</a>"+
									"<a class='remove btn btn-primary input-xs' href='javascript:deletSysteInfo("+data[i].messageId+")'>删除</a></td>";
								}else{
									tr += "<td><a class='remove btn btn-primary input-xs' href=${pageContext.request.contextPath}/views/manager/edit-systemInfo.jsp?id="+data[i].messageId+">详情</a></td>";
								}

								tr += "</tr>";
							}
							$("#systemMessage").append(tr);
							}
				}
			});
			
		}
				function deletSysteInfo(messageId){
					var datas = {"messageId":messageId,"status":2}
					$.ajax({
		        type: "post",
		        url: "<%=basePath%>manager/updateSysteInfo",
					data : JSON.stringify(datas),
					dataType : "json",
					contentType : 'application/json;charset=utf-8', //设置请求头信息  
					success : function(data) {
						console.log(data);
						if (data.flag == "1") {
							alertMessage("删除成功");
							systemInfo();
						} else {
							alertError("删除失败");
						}
					}
				});
			}
		</script>
</body>
</html>
