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
    <link href="<%=basePath%>resources/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="<%=basePath%>resources/vendors/animate.css/animate.min.css" rel="stylesheet">
     <link href="<%=basePath%>resources/vendors/pnotify/dist/pnotify.css" rel="stylesheet">
    <link href="<%=basePath%>resources/vendors/pnotify/dist/pnotify.buttons.css" rel="stylesheet">
    <link href="<%=basePath%>resources/vendors/pnotify/dist/pnotify.nonblock.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="<%=basePath%>resources/build/css/custom.min.css" rel="stylesheet">
    <script src="<%=basePath%>resources/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="<%=basePath%>resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- PNotify -->
    <script src="<%=basePath%>resources/vendors/pnotify/dist/pnotify.js"></script>
    <script src="<%=basePath%>resources/vendors/pnotify/dist/pnotify.buttons.js"></script>
    <script src="<%=basePath%>resources/vendors/pnotify/dist/pnotify.nonblock.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="<%=basePath%>resources/build/js/custom.js"></script>
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