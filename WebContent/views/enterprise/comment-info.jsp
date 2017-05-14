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
<title>企业用户!</title>
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
																				<li><a href="<%=basePath%>views/enterprise/edit-personalInfo.jsp">修改个人信息</a></li>
																				<li><a href="<%=basePath%>views/enterprise/edit-password.jsp">修改登录密码</a></li>
																		</ul></li>
																<li><a><i class="fa fa-edit"></i> 招聘信息 <span class="fa fa-chevron-down"></span></a>
																		<ul class="nav child_menu">
																				<li class="active"><a href="<%=basePath%>views/enterprise/myrecruitment-info.jsp">我的招聘信息</a></li>
																				<li><a href="<%=basePath%>views/enterprise/addrecruitment-info.jsp">发布招聘信息</a></li>
																				<!-- <li><a href="form_validation.html">Form Validation</a></li> -->
																		</ul></li>
																		<li><a><i class="fa fa-clone"></i>系统公告<span class="fa fa-chevron-down"></span></a>
																		<ul class="nav child_menu">
																				<li><a href="<%=basePath%>views/enterprise/system-infolist.jsp">系统公告</a></li>
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
						<div class="right_col" role="main">
								<div class="x_panel">
										<div class="x_title">
												<h2>招聘信息详情</h2>
												<div class="clearfix"></div>
										</div>
										<div class="x_content">
												<br />
												<form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">
														<div class="form-group">
																<div class="col-md-3 col-sm-3"></div>
																<div class="col-md-4 col-sm-4 col-xs-12">
																<label id="content"></label>
																</div>
														</div>
														<div class="form-group">
																<div class="col-md-3 col-sm-3"></div>
																<div class="col-md-4 col-sm-4 col-xs-12">
																<textarea rows="3" cols="1350" style="margin: 0px; width: 369px; height: 79px;" id="reply"></textarea>
																<label id="hasReply"></label>
																</div>
																</div>
														<div class="form-group" id="replyButton">
																		<div class="col-md-12 col-sm-12 col-xs-12 col-md-offset-5">
																				<a type="button" class="btn btn-primary" href="javascript:reply();">提交回复</a>
																		</div>
														</div>
<!-- 														<div class="col-md-12 col-sm-12 col-xs-12"> -->
																<div class="ln_solid"></div>
																<div class="form-group">
																		<div class="col-md-12 col-sm-12 col-xs-12 col-md-offset-5">
																				<a type="button" class="btn btn-primary" href="javascript:back();">返回</a>
																		</div>
																</div>
												</form>
										</div>
								</div>
						</div>
										<input id="commentId" value="${param.id}" hidden="">
										<input id="infoId" value="${param.infoId}" hidden="">
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
			commentInfo();
		});
		
		function commentInfo(){
			 var commentId = $("#commentId").val();
	  	 $.ajax({
	       type: "get",
	       url: "<%=basePath%>info/commentInfo?commentId="+commentId+"",
					data : {},
					dataType : "json",
					contentType : 'application/json;charset=utf-8', //设置请求头信息  
					success : function(data) {
						console.log(data);
						if(data!=null){
							$("#content").text("评论:"+data.content);
							console.log(data.commentStatus);
							if(data.commentStatus==2){
								$("#reply").hide();
								$("#replyButton").hide();
								$("#hasReply").text("回复:"+data.reply);
							}else{
								$("#hasReply").hide();
							}
							
						}
							}
			});
		}
		
		function reply(){
			 var commentId = $("#commentId").val();
			 var reply = $("#reply").val();
			 var infoId = $("#infoId").val();
	     var datas = {"commentStatus":2,"commentId":commentId,"reply":reply}
	  	 $.ajax({
	       type: "post",
	       url: "<%=basePath%>info/updateComment",
					data : JSON.stringify(datas),
					dataType : "json",
					contentType : 'application/json;charset=utf-8', //设置请求头信息  
					success : function(data) {
						console.log(data);
						if(data.flag==1){
							alertMessage(data.message);
							window.setTimeout("window.location.href='<%=basePath%>views/enterprise/comment-list.jsp?id="+infoId+"'", 400);
						} else {
							alertError(data.message);
						}
							}
			});
		}
		
		function back(){
			var infoId = $("#infoId").val();
			window.location.href="<%=basePath%>views/enterprise/comment-list.jsp?id="+infoId+"";
		}
		</script>
</body>
</html>
