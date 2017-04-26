<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Gentelella Alela! | </title>
    <!-- Bootstrap -->
    <link href="<%=basePath%>resources/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="<%=basePath%>resources/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="<%=basePath%>resources/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="<%=basePath%>resources/vendors/animate.css/animate.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="<%=basePath%>resources/build/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="login">
    <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>
      <a class="hiddenanchor" id="enterpriseSignup"></a>
      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
            <form>
              <h1>登录</h1>
              <div>
                <input type="text" class="form-control" placeholder="Mobile" required="" />
              </div>
              <div>
                <input type="password" class="form-control" placeholder="Password" required="" />
              </div>
              <div>
                <a class="btn btn-default submit" href="javascript:login();">登录</a>
                <a class="reset_pass" href="#">忘记密码?</a>
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">没有账号?
                  <a href="<%=basePath%>views/login.jsp#signup" class="to_register"> 创建个人账号 </a>
                  <a href="<%=basePath%>views/login.jsp#enterpriseSignup" class="to_register"> 创建企业账号 </a>
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
              <h1>创建账号</h1>
              <div>
                <input type="text" class="form-control" placeholder="Username" id="userName" required="" />
              </div>
              <div>
                <input type="mobile" class="form-control" placeholder="mobile" id="mobile" required="" />
              </div>
              <div>
                <input type="password" class="form-control" placeholder="Password" id="password"  required="" />
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
        <div id="register" class="animate form registration_form">
          <section class="login_content">
            <form>
              <h1>创建账号</h1>
              <div>
                <input type="text" class="form-control" placeholder="Username" id="userName" required="" />
              </div>
              <div>
                <input type="mobile" class="form-control" placeholder="mobile" id="mobile" required="" />
              </div>
              <div>
                <input type="password" class="form-control" placeholder="Password" id="password"  required="" />
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
<%--     	<script src="<%=basePath%>resources/js/bootstrap.min.js"></script> --%>
		<script type="text/javascript">
    function create(){
    	var mobile = $("#mobile").val();
    	var userName = $("#userName").val();
    	var password = $("#password").val();
    	var confirmPassword = $("#password").val();
    	var datas = {"mobile":mobile,"userName":userName,"password":password}
    	$.ajax({
            type: "post",
            url: "<%=basePath%>user/registerUser",
						data : JSON.stringify(datas),
						dataType : "json",
						success : function(data) {
							console.log(data);
						}
					});
			}
		</script>
  </body>
</html>
