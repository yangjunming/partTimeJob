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
														<input id="userId" value="${sessionScope.User.userId}" hidden=""> <img
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
														<!-- 														<h3>General</h3> -->
														<ul class="nav side-menu">
																<li><a><i class="fa fa-home"></i> 个人信息管理 <span class="fa fa-chevron-down"></span></a>
																		<ul class="nav child_menu">
																				<li><a href="<%=basePath%>views/enterprise/eidt-personalInfo.jsp">修改个人信息</a></li>
																				<li><a href="<%=basePath%>views/enterprise/eidt-password.jsp">修改登录密码</a></li>
																		</ul></li>
																<li><a><i class="fa fa-edit"></i> 招聘信息 <span class="fa fa-chevron-down"></span></a>
																		<ul class="nav child_menu">
																				<li><a href="<%=basePath%>views/enterprise/myrecruitment-info.jsp">我的招聘信息</a></li>
																				<li class="active"><a href="<%=basePath%>views/enterprise/addrecruitment-info.jsp">发布招聘信息</a></li>
																				<!-- <li><a href="form_validation.html">Form Validation</a></li> -->
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
						<div></div>
						<!-- /page content -->
						<div class="right_col" role="main">
						<div class="col-md-2 col-xs-3">
						</div>
						 <div class="col-md-8 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>添加招聘 </h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <br />
                    <form class="form-horizontal form-label-left">
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">标题</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" class="form-control" placeholder="标题" id="title">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">工资</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" class="form-control" placeholder="*元/天,或者*元/小时" id="wages">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">招聘人数</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" class="form-control" placeholder="招聘人数" id="recruitNum">
                        </div>
                      </div>
                       <div class="control-group">
                       <label class="control-label col-md-3 col-sm-3 col-xs-12">工作开始日期</label>
                              <div class="col-md-9 col-sm-9 col-xs-12 xdisplay_inputx form-group has-feedback">
                                <input type="text" class="form-control has-feedback-left" id="single_cal4" placeholder="First Name" aria-describedby="inputSuccess2Status4">
                                <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
                                <span id="inputSuccess2Status4" class="sr-only">(success)</span>
                              </div>
                          </div>
                          <div class="control-group">
                       <label class="control-label col-md-3 col-sm-3 col-xs-12">工作结束日期</label>
                              <div class="col-md-9 col-sm-9 col-xs-12 xdisplay_inputx form-group has-feedback">
                                <input type="text" class="form-control has-feedback-left" id="single_cal3" placeholder="First Name" aria-describedby="inputSuccess2Status4">
                                <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
                                <span id="inputSuccess2Status4" class="sr-only">(success)</span>
                              </div>
                          </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">工作开始时间</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" class="form-control" id="workStartTime" placeholder="工作开始时间:8:00" >
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">工作结束时间</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" class="form-control" placeholder="工作结束时间:17:30" id="workEndTime">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">工作地址</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" class="form-control" placeholder="工作地址" id="workArea">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">行业分类</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <select class="form-control" id="catalogId">
                            <option>Choose option</option>
                            <option>Option one</option>
                            <option>Option two</option>
                            <option>Option three</option>
                            <option>Option four</option>
                          </select>
                        </div>
                      </div>
              <div class="x_panel">
                <div class="x_title">
                <h2>工作描述</h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <div id="alerts"></div>
                  <div class="btn-toolbar editor" data-role="editor-toolbar" data-target="#editor-one">
                    <div class="btn-group">
                      <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font"><i class="fa fa-font"></i><b class="caret"></b></a>
                      <ul class="dropdown-menu">
                      </ul>
                    </div>
                    <div class="btn-group">
                      <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font Size"><i class="fa fa-text-height"></i>&nbsp;<b class="caret"></b></a>
                      <ul class="dropdown-menu">
                        <li>
                          <a data-edit="fontSize 5">
                            <p style="font-size:17px">Huge</p>
                          </a>
                        </li>
                        <li>
                          <a data-edit="fontSize 3">
                            <p style="font-size:14px">Normal</p>
                          </a>
                        </li>
                        <li>
                          <a data-edit="fontSize 1">
                            <p style="font-size:11px">Small</p>
                          </a>
                        </li>
                      </ul>
                    </div>

                    <div class="btn-group">
                      <a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i class="fa fa-bold"></i></a>
                      <a class="btn" data-edit="italic" title="Italic (Ctrl/Cmd+I)"><i class="fa fa-italic"></i></a>
                      <a class="btn" data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i class="fa fa-underline"></i></a>
                    </div>

                    <div class="btn-group">
                      <a class="btn" data-edit="insertunorderedlist" title="Bullet list"><i class="fa fa-list-ul"></i></a>
                      <a class="btn" data-edit="insertorderedlist" title="Number list"><i class="fa fa-list-ol"></i></a>
                      <a class="btn" data-edit="outdent" title="Reduce indent (Shift+Tab)"><i class="fa fa-dedent"></i></a>
                      <a class="btn" data-edit="indent" title="Indent (Tab)"><i class="fa fa-indent"></i></a>
                    </div>

                    <div class="btn-group">
                      <a class="btn" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)"><i class="fa fa-align-left"></i></a>
                      <a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i class="fa fa-align-center"></i></a>
                      <a class="btn" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i class="fa fa-align-right"></i></a>
                      <a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i class="fa fa-align-justify"></i></a>
                    </div>
                  </div>
                  <div id="editor-one" class="editor-wrapper placeholderText" contenteditable="true">
                  <textarea name="descr" id="descr" style="display:none;"></textarea>
                </div>
              </div>
            </div>
            <div class="col-md-12 col-sm-12 col-xs-12">
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                          <button type="button" class="btn btn-primary">取消</button>
                          <button type="reset" class="btn btn-primary">重置</button>
                          <button type="submit" class="btn btn-success">提交</button>
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
		function logout(){
			$.ajax({
        type: "get",
        url: "<%=basePath%>user/logout",
				data : {},
				dataType : "json",
				contentType : 'application/json;charset=utf-8', //设置请求头信息  
				success : function(data) {
					if(data){
						alertMessage("退出成功")
						window.setTimeout("window.location.href='<%=basePath%>views/login.jsp'", 400);
						} else {
							alertError("登录失败!");
						}
					}
				});
			}
		</script>
</body>
</html>
