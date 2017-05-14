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
										</div>
										<div class="clearfix"></div>

										<!-- menu profile quick info -->
										<div class="profile clearfix">
												<div class="profile_pic">
														<input id="userId" value="${sessionScope.User.userId}" hidden=""> 
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
																<li class="active"><a><i class="fa fa-home"></i> 个人信息管理 <span class="fa fa-chevron-down"></span></a>
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
																				<li><a href="<%=basePath%>views/manager/catalog-list.jsp">分类列表</a></li>
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

						<!-- page content -->
						<!-- /page content -->
						<div class="right_col" role="main">
						<div class="x_panel">
                  <div class="x_title">
                    <h2>修改个人信息 </h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <br />
                    <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">
                      <div class="form-group">
                        <label class="control-label col-md-4 col-sm-4 col-xs-12">姓名</label>
                        <div class="col-md-5 col-sm-5 col-xs-12">
                           <input type="text" class="form-control" value="" id="userName">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-4 col-sm-4 col-xs-12">电话</label>
                        <div class="col-md-5 col-sm-5 col-xs-12">
                           <input type="text" class="form-control" value="" id="mobile" onblur="javascript:mobileCheck();">
                           <div id="mobileCheck" hidden="">
																<div class="col-md-6 form-group has-error has-feedback">
																		<label id="mobileMessage" class="control-label" for="inputError2" style="color: red">电话号码已存在</label>
																</div>
														</div>
                        </div>
                      </div>
                     <div class="col-md-12 col-sm-12 col-xs-12">
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-12 col-sm-12 col-xs-12 col-md-offset-5">
                          <a type="button" class="btn btn-primary" href="<%=basePath%>views/manager/manager-index.jsp">取消</a>
                          <a class="btn btn-success" href="javascript:save();">提交</a>
                        </div>
                      </div>

                    </form>
                  </div>
                </div>
                </div>
						<!-- footer content -->
						<!-- /footer content -->
				</div>
		</div>
		<!-- Custom Theme Scripts -->
		<script src="<%=basePath%>resources/build/js/custom.js"></script>
		<script type="text/javascript">
		var createFlag =false;
		$(function userInfo(){
			var userId =$("#userId").val();
			$.ajax({
        type: "post",
        url: "<%=basePath%>user/getUserById?userId="+userId+"",
				data : {},
				dataType : "json",
				contentType : 'application/json;charset=utf-8', //设置请求头信息  
				success : function(data) {
					$("#userName").val(data.userName);
					$("#mobile").val(data.mobile);
			}
		});
		})
		function save(){
			if(!createFlag){
    		return;
    	}
    	var mobile = $("#mobile").val();
    	if(null == mobile || mobile==''){
    		$("#mobileMessage").text("电话号码不能为空");
    		$("#mobileCheck").show();
    		return;
    	}
			var userId =$("#userId").val();
			var datas = {"userId":userId,"userName":$("#userName").val(),"mobile":$("#mobile").val()}
			$.ajax({
        type: "post",
        url: "<%=basePath%>user/editUserInfo",
				data : JSON.stringify(datas),
				dataType : "json",
				contentType : 'application/json;charset=utf-8', //设置请求头信息  
				success : function(data) {
					console.log(data);
					if(data.falg =='1' ){
						alertMessage(data.message);
<%-- 						window.setTimeout("window.location.href='<%=basePath%>views/candidate/candidate-index.jsp'", 400); --%>
				} else {
					alertError(data.message);
				}
			}
		});
		}
		
		function mobileCheck(){
			var userId =$("#userId").val();
			var mobile = $("#mobile").val();
			if(null == mobile || mobile==''){
				$("#mobileCheck").show();
				$("#mobileMessage").text("电话号码不能为空");
				return;
			}
			$.ajax({
        type: "get",
        url: "<%=basePath%>user/mobileCheck?mobile="+mobile+"&userId="+userId+"",
				data : {},
				dataType : "json",
				contentType : 'application/json;charset=utf-8', //设置请求头信息  
				success : function(data) {
					if(data.flag=="1"){
						$("#mobileCheck").show();
						createFlag =false;
					}else{
						$("#mobileCheck").hide();
						createFlag=true;
					}
			}
		});
		}
		</script>
</body>
</html>
