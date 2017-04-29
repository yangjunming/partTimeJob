<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
   
    <!-- Bootstrap -->
    <link href="<%=basePath%>resources/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="<%=basePath%>resources/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="<%=basePath%>resources/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="<%=basePath%>resources/vendors/animate.css/animate.min.css" rel="stylesheet">
    
    <link href="<%=basePath%>resources/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- bootstrap-wysiwyg -->
    <link href="<%=basePath%>resources/vendors/google-code-prettify/bin/prettify.min.css" rel="stylesheet">
    <!-- Select2 -->
    <link href="<%=basePath%>resources/vendors/select2/dist/css/select2.min.css" rel="stylesheet">
    <!-- Switchery -->
    <link href="<%=basePath%>resources/vendors/switchery/dist/switchery.min.css" rel="stylesheet">
    <!-- starrr -->
    <link href="<%=basePath%>resources/vendors/starrr/dist/starrr.css" rel="stylesheet">
    <!-- bootstrap-progressbar -->
    <link href="<%=basePath%>resources/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="<%=basePath%>resources/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="<%=basePath%>resources/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    <!-- PNotify -->
    <link href="<%=basePath%>resources/vendors/pnotify/dist/pnotify.css" rel="stylesheet">
    <link href="<%=basePath%>resources/vendors/pnotify/dist/pnotify.buttons.css" rel="stylesheet">
    <link href="<%=basePath%>resources/vendors/pnotify/dist/pnotify.nonblock.css" rel="stylesheet">
     <!-- Ion.RangeSlider -->
    <link href="<%=basePath%>resources/vendors/normalize-css/normalize.css" rel="stylesheet">
    <link href="<%=basePath%>resources/vendors/ion.rangeSlider/css/ion.rangeSlider.css" rel="stylesheet">
    <link href="<%=basePath%>resources/vendors/ion.rangeSlider/css/ion.rangeSlider.skinFlat.css" rel="stylesheet">
    <!-- Bootstrap Colorpicker -->
    <link href="<%=basePath%>resources/vendors/mjolnic-bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css" rel="stylesheet">

    <link href="<%=basePath%>resources/vendors/cropper/dist/cropper.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="<%=basePath%>resources/build/css/custom.min.css" rel="stylesheet">
    
    <!-- jQuery -->
    <script src="<%=basePath%>resources/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="<%=basePath%>resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
     <script src="<%=basePath%>resources/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="<%=basePath%>resources/vendors/nprogress/nprogress.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="<%=basePath%>resources/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="<%=basePath%>resources/vendors/iCheck/icheck.min.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="<%=basePath%>resources/vendors/moment/min/moment.min.js"></script>
    <script src="<%=basePath%>resources/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    
     <!-- bootstrap-wysiwyg -->
    <script src="<%=basePath%>resources/vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
    <script src="<%=basePath%>resources/vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
    <script src="<%=basePath%>resources/vendors/google-code-prettify/src/prettify.js"></script>
    <!-- jQuery Tags Input -->
    <script src="<%=basePath%>resources/vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
    <!-- Switchery -->
    <script src="<%=basePath%>resources/vendors/switchery/dist/switchery.min.js"></script>
    <!-- Select2 -->
    <script src="<%=basePath%>resources/vendors/select2/dist/js/select2.full.min.js"></script>
    <!-- Parsley -->
    <script src="<%=basePath%>resources/vendors/parsleyjs/dist/parsley.min.js"></script>
    <!-- Autosize -->
    <script src="<%=basePath%>resources/vendors/autosize/dist/autosize.min.js"></script>
    <!-- jQuery autocomplete -->
    <script src="<%=basePath%>resources/vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
    <!-- starrr -->
    <script src="<%=basePath%>resources/vendors/starrr/dist/starrr.js"></script>
    
    <!-- Ion.RangeSlider -->
    <script src="<%=basePath%>resources/vendors/ion.rangeSlider/js/ion.rangeSlider.min.js"></script>
    <!-- Bootstrap Colorpicker -->
    <script src="<%=basePath%>resources/vendors/mjolnic-bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
    <!-- jquery.inputmask -->
    <script src="<%=basePath%>resources/vendors/jquery.inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
    <!-- jQuery Knob -->
    <script src="<%=basePath%>resources/vendors/jquery-knob/dist/jquery.knob.min.js"></script>
    <!-- Cropper -->
    <script src="<%=basePath%>resources/vendors/cropper/dist/cropper.min.js"></script>
    <!-- PNotify -->
    <script src="<%=basePath%>resources/vendors/pnotify/dist/pnotify.js"></script>
    <script src="<%=basePath%>resources/vendors/pnotify/dist/pnotify.buttons.js"></script>
<%--     <script src="<%=basePath%>resources/build/js/custom.js"></script> --%>
   
    <script type="text/javascript">
    function alertMessage(message){
      new PNotify({
         title: '操作成功',
         text: message,
         type: 'success',
         delay:1000,
         styling: 'bootstrap3'
     });
       }
    function alertError(message){
      new PNotify({
         title: '系统错误',
         text: message,
         type: 'error',
         delay:1000,
         styling: 'bootstrap3'
     });
       }
    function alertInfo(message){
      new PNotify({
         title: '系统消息',
         text: message,
         type: 'info',
         delay:1000,
         styling: 'bootstrap3'
     });
       }
    
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
    
    // 返回格式 2017-03-03
    function formatDates(time) {
      var data = new Date(time);  
      console.log(data);
      var year = data.getFullYear();  //获取年
      var month = data.getMonth() + 1;    //获取月
      if(month<10){
     	 month = "0"+month;
      }
      var day = data.getDate(); //获取日
      if(day<10){
     	 day = "0"+day;
      }
      var hours = data.getHours(); 
      var minutes = data.getMinutes();
      time = year + "-" + month + "-" + day ;
      return time;
   }
    </script>