<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>注册登录</title>
</head>

<body class="login">
		<div>
				<a class="hiddenanchor" id="signup"></a> <a class="hiddenanchor" id="signin"></a>
				<div class="login_wrapper">
						<div class="animate form login_form">
								<section class="login_content">
										<form>
												<h1>登录</h1>
												<div>
														<input type="text" class="form-control" placeholder="电话" id="loginMobile" required="" />
												</div>
												<div>
														<input type="password" class="form-control" placeholder="密码" id="loginPassword" required="" />
												</div>
												<div>
														<input type="text" class="form-control" placeholder="验证码" id="code" required="" /> 
														<img id="img" src="<%=basePath%>user/checkJpg" onclick="javascript:refreshs()">
												</div>
												<div>
														<a class="btn btn-default submit" href="javascript:login();">登录</a>
														<!--                 <a class="reset_pass" href="#">忘记密码?</a> -->
												</div>

												<div class="clearfix"></div>

												<div class="separator">
														<p class="change_link">
																没有账号? <a href="<%=basePath%>views/login.jsp#signup" class="to_register"> 注册账号 </a>
														</p>
														<div class="clearfix"></div>
														<br />
												</div>
										</form>
								</section>
						</div>
						<div id="register" class="animate form registration_form">
								<section class="login_content">
										<form>
												<h1>注册账号</h1>
												<div style="margin-bottom: 15px">
														<select id="heard" class="form-control" required onchange="javascript:change();">
																<option value="3">个人账号</option>
																<option value="2">企业账号</option>
														</select>
												</div>
												<div>
														<input type="text" class="form-control" placeholder="姓名" id="userName" required="" />
												</div>
												<div>
														<input type="text" class="form-control" placeholder="电话" id="mobile" required="" onblur="javascript:mobileCheck();"/>
														<div id="mobileCheck" hidden="">
																<div class="col-md-6 form-group has-error has-feedback">
																		<label id="mobileMessage" class="control-label" for="inputError2" style="color: red">电话号码已存在</label>
																</div>
														</div>
												</div>
												<div>
														<input type="password" class="form-control" placeholder="密码" id="password" required="" onblur="javascript:passwordCheck();"/>
														<div id="passwordCheck" hidden="">
																<div class="col-md-6 form-group has-error has-feedback">
																		<label id="passwordMessage" class="control-label" for="inputError2" style="color: red">密码不能为空</label>
																</div>
														</div>
												</div>
												<div style="margin-bottom: 15px" id="genderDiv">
														<select class="form-control" id="gender">
																<option value="1">男</option>
																<option value="2">女</option>
																<option value="3">保密</option>
														</select>
												</div>
												<div id="ageDiv">
														<input type="text" class="form-control" placeholder="年龄" id="age" required="" />
												</div>
												<div id="educationDiv">
														<input type="text" class="form-control" placeholder="学历" id="education" required="" />
												</div>
												<div id="enterpriseNameDiv" hidden="">
														<input type="text" class="form-control" placeholder="公司名称" id=enterpriseName required="" />
												</div>
												<div id="addressDiv" hidden="">
														<input type="text" class="form-control" placeholder="公司地址" id="address" required="" />
												</div>
												<div id="describeDiv">
														<textarea class="form-control" placeholder="描述" id="describe"></textarea>
												</div>
												<div>
														<a class="btn btn-default submit" href="javascript:create();">提交</a>
												</div>

												<div class="clearfix"></div>

												<div class="separator">
														<p class="change_link">
																已经有账号 ? <a href="<%=basePath%>views/login.jsp#signin" class="to_register"> 登录 </a>
														</p>
														<div class="clearfix"></div>
														<br />
												</div>
										</form>
								</section>
						</div>
				</div>
		</div>
		<script type="text/javascript">
		var createFlag = false;
    function create(){
    	if(!createFlag){
    		return;
    	}
    	var mobile = $("#mobile").val();
    	var userName = $("#userName").val();
    	var password = $("#password").val();
    	if(null == password || password==''){
    		$("#passwordCheck").show();
    		return;
    	}
    	if(null == mobile || mobile==''){
    		$("#mobileMessage").text("电话号码不能为空");
    		$("#mobileCheck").show();
    		return;
    	}
    	var confirmPassword = $("#password").val();
    	var enterpriseName = $("#enterpriseName").val();
    	var address = $("#address").val();
    	var type = $("#heard").val();
    	var age = $("#age").val();
    	var education = $("#education").val();
    	var gender = $("#gender").val();
    	var describe = $("#describe").val();
    	var datas = {"mobile":mobile,"userName":userName,"password":password,
    			"enterpriseName":enterpriseName,"address":address,"type":type,
    			"age":age,"gender":gender,"describe":describe,"education":education}
    	$.ajax({
            type: "post",
            url: "<%=basePath%>user/registerUser",
						data : JSON.stringify(datas),
						dataType : "json",
						contentType : 'application/json;charset=utf-8', //设置请求头信息  
						success : function(data) {
							if(data){
							alertMessage("注册成功!");
							window.location.href="<%=basePath%>views/login.jsp#signin";
						} else {
							alertError("注册失败!");
						}
					}
				});
			}
    
    
    function login(){
    	var mobile = $("#loginMobile").val();
    	var password = $("#loginPassword").val();
    	var datas = {"mobile":mobile,"password":password,"code":$("#code").val()}
    	$.ajax({
            type: "post",
            url: "<%=basePath%>user/login",
						data : JSON.stringify(datas),
						dataType : "json",
						contentType : 'application/json;charset=utf-8', //设置请求头信息  
						success : function(data) {
							console.log(data);
							if(null != data){
								if(data.flag=="0"){
									alertError(data.message);
								}else{
								if(data.type==1){
									window.location.href="<%=basePath%>views/manager/manager-index.jsp";
								}else if(data.type==2){
									window.location.href="<%=basePath%>views/enterprise/enterprise-index.jsp";
								}else if(data.type==3){
									window.location.href="<%=basePath%>views/candidate/candidate-index.jsp";
								}
							}
						} else {
							alertError("登录失败!");
						}
					}
				});
			}

			function change() {
				var s = $("#heard").val();
				if (s == 3) {
					$("#enterpriseNameDiv").hide();
					$("#addressDiv").hide();

					$("#genderDiv").show();
					$("#ageDiv").show();
					$("#educationDiv").show();
				} else if (s == 2) {
					$("#enterpriseNameDiv").show();
					$("#addressDiv").show();

					$("#genderDiv").hide();
					$("#ageDiv").hide();
					$("#educationDiv").hide();
				}
			}
			function refreshs() {
				var url = "user/checkJpg?number=" + Math.random();
				$("#img").attr("src", url);
			}
			
			function mobileCheck(){
				var mobile = $("#mobile").val();
				if(null == mobile || mobile==''){
					$("#mobileCheck").show();
					$("#mobileMessage").text("电话号码不能为空");
					return;
				}
				$.ajax({
          type: "get",
          url: "<%=basePath%>user/mobileCheck?mobile="+mobile+"&userId=0",
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
			function passwordCheck(){
				var password = $("#password").val();
	    	if(null == password || password==''){
	    		$("#passwordCheck").show();
	    		return;
	    	}else{
	    		$("#passwordCheck").hide();
	    	}
			}
		</script>
</body>
</html>
