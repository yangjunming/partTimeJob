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
    <!-- bootstrap-daterangepicker -->
    <script src="<%=basePath%>resources/vendors/moment/min/moment.min.js"></script>
    <script src="<%=basePath%>resources/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
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
    
     <script src="<%=basePath%>resources/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="<%=basePath%>resources/vendors/nprogress/nprogress.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="<%=basePath%>resources/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="<%=basePath%>resources/vendors/iCheck/icheck.min.js"></script>
    <!-- PNotify -->
    <script src="<%=basePath%>resources/vendors/pnotify/dist/pnotify.js"></script>
    <script src="<%=basePath%>resources/vendors/pnotify/dist/pnotify.buttons.js"></script>
    <script src="<%=basePath%>resources/vendors/pnotify/dist/pnotify.nonblock.js"></script>
<%--     <script src="<%=basePath%>resources/build/js/custom.js"></script> --%>
   
    <script type="text/javascript">
    function alertMessage(message){
      new PNotify({
         title: '操作成功',
         text: message,
         type: 'success',
         delay:200,
         styling: 'bootstrap3'
     });
       }
    function alertError(message){
      new PNotify({
         title: '系统错误',
         text: message,
         type: 'error',
         delay:200,
         styling: 'bootstrap3'
     });
       }
    </script>