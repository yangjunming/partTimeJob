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
														<input id="userId" value="${sessionScope.User.userId}" hidden="">
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
																		<li id="myJob"><a><i class="fa fa-desktop"></i>报名信息<span class="fa fa-chevron-down"></span></a>
																		<ul class="nav child_menu">
																				<li><a href="<%=basePath%>views/candidate/my-job.jsp">我报名的兼职</a></li>
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
						<div class="right_col" role="main">
						<div>
						<div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>兼职信息表</h2>
                    <div class="col-md-8"></div>
                    <div class="text-right"">
                    <div class="col-md-2">
                    <input class="form-control" id="search">
                    </div>
                    <a class="btn btn-success" href="javascript:infoList();">搜索</a>
                    </div>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                      <thead>
                        <tr>
                          <th>序号</th>
                          <th>标题</th>
                          <th>企业名称</th>
                          <th>工资</th>
                          <th>招聘人数</th>
                          <th>开始日期</th>
                          <th>结束日期</th>
                          <th>工作地址</th>
                          <th>发布时间</th>
                          <th>操作</th>
                        </tr>
                      </thead>
                      <tbody id="infoList">
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
						</div>
						<!-- /page content -->
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
		$(function candidateIndex(){
			infoList();
		})
		
   function infoList(){
  	 $("#infoList tr").remove();
  	 var search = $("#search").val();
  	 var userId = $("#userId").val();
  	 if(null ==userId || userId == ''){
				alertInfo("用户登录信息过期,请重新登录");
				return;
			}
  	 $.ajax({
       type: "get",
       url: "<%=basePath%>info/getInfoListByCandidate?userId="+userId+"&search="+search+"",
				data : {},
				dataType : "json",
				contentType : 'application/json;charset=utf-8', //设置请求头信息  
				success : function(data) {
				if (data.length>0) {
					var tr = "";
					for (var i = 0; i < data.length; i++) {
						var j = Number(i)+Number(1);
						tr += "<tr>";
						tr += "<td>" + j + "</td>";
						tr += "<td>" + data[i].title + "</td>";
						tr += "<td>" + data[i].enterpriseName + "</td>";
						tr += "<td>" + data[i].wages + "</td>";
						tr += "<td>" + data[i].recruitNum + "</td>";
						tr += "<td>" + data[i].startDate + "</td>";
						tr += "<td>" + data[i].endDate + "</td>";
						tr += "<td>" + data[i].workArea + "</td>";
						tr += "<td>" + data[i].creatDate + "</td>";
						tr += "<td><a class='remove btn btn-primary input-xs' href=${pageContext.request.contextPath}/views/candidate/recruitment-info.jsp?id=" +  data[i].infoId + "&flag=1>详情</a></td>";
						tr += "</tr>";
					}
					$("#infoList").append(tr);
				} else {
					alertError("没有招聘信息!");
				}
			}
		});
		}
		</script>
</body>
</html>
