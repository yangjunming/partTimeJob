<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=basePath%>resources/page/HP/css/public.css">
    <link rel="stylesheet" href="<%=basePath%>resources/page/HP/css/css.css">
    <link rel="stylesheet" href="<%=basePath%>resources/page/css/swiper.min.css">
    <script src="<%=basePath%>resources/page/js/jquery.min.js"></script>
    <script src="<%=basePath%>resources/page/js/swiper.min.js"></script>
    <title>养生会馆|最好的美容,spa,按摩,观影足疗养生馆</title>
    <meta name="description" content="养生会馆是以互联网思维为基础的养生会所，结合了台湾精品酒店的主题式装修风格，并将精油SPA、红酒及音乐融为一体。完全颠覆了以往的养生行业经营模式，全部运用互联网营销，线上预约，不推销，不卖产品。让客人能在一个全无压力的环境下，享受前所未有的放松体验。"/>
    <meta name="keywords" content="养生会馆|天津最好的美容馆,天津最好的spa,天津按摩,天津观影足疗,养生馆"/>
</head>
<body>
<header>
    <div class="header banner1">
        <div class="box">
            <div class="logo fl"><span style="">养生会馆欢迎您</span></div>
            <div class="nav-tog">
                <span></span>
                <span></span>
                <span></span>
            </div>
            <ul class="nav fr navmobile">
                <li class="on"><a href="<%=basePath%>views/index.jsp">会馆世界</a></li>
                <li><a href="<%=basePath%>views/index_technician.jsp" title="">技师风采</a></li>
                <li><a href="<%=basePath%>reserveIndex" title="">预约登录</a></li>
            </ul>
        </div>
    </div>
</header>
<section class="index">
    <div class="jianjie">
        <h2 class="tit">养生会馆简介<b></b><span>CLUB PROFILE</span></h2>
        <div class="box">
            <p><b></b>养生会馆是以互联网消费升级概念为基础的新生代SPA，经营方式完全颠覆了传统养生行业固有的模式: 不推销、不诊断、不妄言，同时注入了影院及主题式装修等娱乐元素。</p>
            <p><b></b>并且透过线上预约、线下体验的模式，提供高性价比的价格，让客户能以平民的价格享受高端SPA服务。</p>
            <ul class="ulimg">
                <li><img src="<%=basePath%>resources/page/HP/images/1.jpg" alt=""><p>亚特兰蒂斯</p></li>
                <li><img src="<%=basePath%>resources/page/HP/images/2.jpg" alt=""><p>第五大道</p></li>
                <li><img src="<%=basePath%>resources/page/HP/images/3.jpg" alt=""><p>满天星</p></li>
                <li><img src="<%=basePath%>resources/page/HP/images/4.jpg" alt=""><p>异朽阁</p></li>
                <li><img src="<%=basePath%>resources/page/HP/images/5.jpg" alt=""><p>柯伊特塔</p></li>
                <li><img src="<%=basePath%>resources/page/HP/images/6.jpg" alt=""><p>科伯克谷</p></li>
                <li><img src="<%=basePath%>resources/page/HP/images/7.jpg" alt=""><p>梅萨维德</p></li>
                <li><img src="<%=basePath%>resources/page/HP/images/8.jpg" alt=""><p>瑞尼尔</p></li>
                <li><img src="<%=basePath%>resources/page/HP/images/9.jpg" alt=""><p>仙纳度</p></li>
                <li><img src="<%=basePath%>resources/page/HP/images/11.jpg" alt=""><p>阿卡迪亚</p></li>                   
            </ul>
        </div>
    </div>
</section>
<footer>
    <div class="adress">
        <div class="box">
            <ul>
                <li><h4>地址</h4><p>天津市康庄大道康庄大厦<br/>A座666室</p></li>
                <li><h4>营业时间</h4><p>12:00AM～24:00PM</p></li>
                <li><h4>电话</h4><p>Tel：400-123-4567<br/>Email：support@admin.com</p></li>
            </ul>
        </div>
    </div>
    
</footer>
<script>
    var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        paginationClickable: true
    });
</script>
<script src="<%=basePath%>resources/page/HP/js/common.js"></script>
</body>
</html>