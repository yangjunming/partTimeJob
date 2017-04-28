<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
    <title>注册登录 </title>
  </head>

  <body class="login">
    <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>
      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
            <form>
              <h1>登录</h1>
              <div>
                <input type="text" class="form-control" placeholder="电话" required="" />
              </div>
              <div>
                <input type="password" class="form-control" placeholder="密码" required="" />
              </div>
              <div>
                <a class="btn btn-default submit" href="javascript:login();">登录</a>
                <a class="reset_pass" href="#">忘记密码?</a>
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">没有账号?
                  <a href="<%=basePath%>views/login.jsp#signup" class="to_register"> 注册账号 </a>
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
                            <option value="3">个人注册</option>
                            <option value="2">企业注册</option>
                          </select>
              </div>
              <div>
                <input type="text" class="form-control" placeholder="姓名" id="userName" required="" />
              </div>
              <div>
                <input type="text" class="form-control" placeholder="电话" id="mobile" required="" />
              </div>
              <div>
                <input type="password" class="form-control" placeholder="密码" id="password" required="" />
              </div>
              <div id="enterpriseNameDiv" hidden="">
                <input type="text" class="form-control" placeholder="公司名称" id=enterpriseName required="" />
              </div>
              <div id="addressDiv" hidden="">
                <input type="text" class="form-control" placeholder="公司地址" id="address" required="" />
              </div>
              <div>
                <a class="btn btn-default submit" href="javascript:create();">提交</a>
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">已经有账号 ?
                  <a href="<%=basePath%>views/login.jsp#signin" class="to_register"> 登录 </a>
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
    function create(){
    	var mobile = $("#mobile").val();
    	var userName = $("#userName").val();
    	var password = $("#password").val();
    	var confirmPassword = $("#password").val();
    	var enterpriseName = $("#enterpriseName").val();
    	var address = $("#address").val();
    	var type = $("#heard").val();
    	var datas = {"mobile":mobile,"userName":userName,"password":password,"enterpriseName":enterpriseName,"address":address,"type":type}
    	console.log(datas);
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
							}else{
								alertError("注册失败!");
							}
						}
					});
			}
    function change(){
    	var s = $("#heard").val();
    	if(s==3){
    		$("#enterpriseNameDiv").hide();
    		$("#addressDiv").hide();
    	}else if(s==2){
    		$("#enterpriseNameDiv").show();
    		$("#addressDiv").show();
    	}
    }
		</script>
  </body>
</html>
