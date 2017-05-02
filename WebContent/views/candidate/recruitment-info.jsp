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
<title>兼职人员!</title>
</head>
<body class="nav-sm">
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
														<input id="infoId" value="${param.id}" hidden=""> <input id="userId"
																value="${sessionScope.User.userId}" hidden=""> <img
																src="<%=basePath%>resources/production/images/img.jpg" alt="..." class="img-circle profile_img">
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
														<ul class="nav side-menu">
														<li><a href="<%=basePath%>views/candidate/candidate-index.jsp"><i class="fa fa-home"></i>首页 <span class="fa fa-chevron-down"></span></a></li>
																<li><a><i class="fa fa-edit"></i>个人信息管理</a>
																		<ul class="nav child_menu">
																				<li><a href="<%=basePath%>views/candidate/edit-personalInfo.jsp">修改个人信息</a></li>
																				<li><a href="<%=basePath%>views/candidate/edit-password.jsp">修改登录密码</a></li>
																		</ul></li>
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

						<!-- page content -->
						<div class="right_col" role="main">
								<div class="x_panel">
										<div class="x_title">
												<h2>招聘信息详情</h2>
												<div class="clearfix"></div>
										</div>
										<div class="x_content">
												<br />
												<form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">
														<div>
																<div class="form-group">
																		<div class="col-md-3 col-sm-3"></div>
																		<div class="col-md-4 col-sm-4 col-xs-12">
																				<h2 style="color: #333; font: bold 18px/22px 'Microsoft YaHei'" id="title"></h2>
																		</div>
																</div>
																<div class="form-group">
																		<div class="col-md-3 col-sm-3"></div>
																		<div class="col-md-5 col-sm-5 col-xs-12">
																				<h4 id="enterpriseName"></h4>
																		</div>
																</div>
																<div class="form-group">
																		<div class="control-label col-md-6 col-sm-6 col-xs-12">
																				<label id="wages" style="color: #FF8800"></label><i style="color: #FF5511; font-weight: bold;">|</i>
																				<label id="position">类型</label><i style="color: #FF5511; font-weight: bold;">|</i> <label
																						style="color: #FF3333" id="creatDate">发布时间:</label>
																		</div>
																		<div class="control-label col-md-4 col-sm-4 col-xs-12">
																				<a hidden="" id="signup" class="btn btn-success" href="javascript:signup();"
																						style="margin-bottom: 20px">报名兼职</a> <a hidden="" id="alreadySignup" class="btn btn-success"
																						disabled="true" style="margin-bottom: 20px">已报名</a> <a hidden="" id="hire" class="btn btn-success"
																						disabled="true" style="margin-bottom: 20px">已被录用</a> <a hidden="" id="refuse"
																						class="btn btn-success" disabled="true" style="margin-bottom: 20px">未录用</a>
																		</div>
																</div>
														</div>
														<div class="form-group">
																<div class="col-md-3 col-sm-3"></div>
																<div class="col-md-4 col-sm-4 col-xs-12">
																		<h4 id="recruitNum"></h4>
																		</h4>
																</div>
														</div>
														<div class="form-group">
																<div class="col-md-3 col-sm-3"></div>
																<div class="col-md-4 col-sm-4 col-xs-12">
																		<h4 id="workeDate"></h4>
																		</h4>
																</div>
														</div>
														<div class="form-group">
																<div class="col-md-3 col-sm-3"></div>
																<div class="col-md-4 col-sm-4 col-xs-12">
																		<h4 id="workArea"></h4>
																</div>
														</div>
														<div class="form-group">
																<div class="col-md-3 col-sm-3"></div>
																<div class="col-md-4 col-sm-4 col-xs-12">
																		<h4 id="workeTime"></h4>
																</div>
														</div>
														<div class="form-group">
																<div class="col-md-3 col-sm-3"></div>
																<div class="col-md-4 col-sm-4 col-xs-12">
																		<h2>
																				<i style="border-left: 4px solid #FF9F20"></i>&nbsp;工作描述:
																		</h2>
																</div>
														</div>
														<div class="form-group">
																<div class="col-md-3 col-sm-3"></div>
																<div class="col-md-4 col-sm-4 col-xs-12">
																		<div id="workDescribe"></div>
																</div>
														</div>
														<div class="col-md-12 col-sm-12 col-xs-12">
																<div class="ln_solid"></div>
																<div class="form-group">
																		<div class="col-md-12 col-sm-12 col-xs-12 col-md-offset-5">
																				<a type="button" class="btn btn-primary" href="<%=basePath%>views/candidate/candidate-index.jsp">返回</a>
																		</div>
																</div>
												</form>
										</div>
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
		$(function enterpriseInfo(){
			var infoId = $("#infoId").val();
			$.ajax({
        type: "get",
        url: "<%=basePath%>info/getInfoById?infoId="+infoId+"",
				data : {},
				dataType : "json",
				contentType : 'application/json;charset=utf-8', //设置请求头信息  
				success : function(data) {
					if(data !=null ){
							$("#title").text(data.title);
							$("#wages").text(data.wages);
							$("#creatDate").text("发布时间: "+data.creatDate);
							$("#workeDate").text("工作日期: "+data.startDate+"至"+data.endDate);
							$("#recruitNum").text("招聘人数: "+data.recruitNum+"人");
							$("#workeTime").text("上班时间: "+data.workStartTime+"-"+data.workEndTime)
							$("#workArea").text("工作地点: "+data.workArea);
							$("#workDescribe").html(data.workDescribe);
							$("#enterpriseName").text("公司: "+data.enterpriseName);
							$("#position").text(data.position);
				} else {
					alertError("加载信息失败!");
				}
			}
		});
			getRelation();
			
		})
		
		function getRelation(){
			
			var infoId =$("#infoId").val();
			var userId =$("#userId").val();
			if(userId == ''){
				$("#signup").show();
			}else{
			$.ajax({
        type: "get",
        url: "<%=basePath%>info/getRelation?infoId="+infoId+"&userId="+userId+"",
				data : {},
				dataType : "json",
				contentType : 'application/json;charset=utf-8', //设置请求头信息  
				success : function(data) {
					if(data.relationId==0){
						$("#signup").show();
				} else {
					if(data.status == 1){
						$("#alreadySignup").show();
					}else if(data.status == 2){
						$("#hire").show();
					}else if(data.status == 3){
						$("#refuse").show();
					}
				}
			}
		});
			}
			
		}
		
		function signup(){
			var infoId =$("#infoId").val();
			var userId =$("#userId").val();
			if(userId == ''){
				alertInfo("请先登录");
				window.setTimeout("window.location.href='<%=basePath%>views/login.jsp'", 400);
			}else{
			$.ajax({
        type: "get",
        url: "<%=basePath%>info/signup?infoId="+infoId+"&userId="+userId+"",
				data : {},
				dataType : "json",
				contentType : 'application/json;charset=utf-8', //设置请求头信息  
				success : function(data) {
					console.log(data);
					if(data.flag=='1'){
					alertMessage(data.message);
					window.setTimeout("window.location.href='<%=basePath%>views/candidate/candidate-index.jsp'", 400);
							} else {
								alertError(data.message);
							}
						}
					});
				}

			}
		</script>
</body>
</html>
