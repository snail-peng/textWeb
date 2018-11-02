<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="header" class="wrap">
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
	<div id="logo"><img src="${path}/images/logo.gif"></div>
	<div class="help"><a href="${path}/LogoutServlet">退出</a></div>
	<div class="help"><a href="${path }/reception/common/Homepage.jsp">返回前台页面</a></div>
	<div class="navbar">
		<ul class="clearfix">
			<li ${param.cssflag eq 6? "class=current":""}><a href="${path}/manage/index/index.jsp?cssflag=6">首页</a></li>
			<li ${param.cssflag eq 5? "class=current":""}><a href="${path}/UserServlet?methodname=findAll&cssflag=5">用户</a></li>
			<li ${param.cssflag eq 4? "class=current":""}><a href="${path}/ProductServlet?methodname=findAll&cssflag=4">商品</a></li>
			<li ${param.cssflag eq 3? "class=current":""}><a href="${path}/OrderServlet?methodname=findAll&cssflag=3">订单</a></li>
			<li ${param.cssflag eq 2? "class=current":""}><a href="${path}/MessageServlet?methodname=findAll&cssflag=2">留言</a></li>
			<li ${param.cssflag eq 1? "class=current":""}><a href="${path}/NewsServlet?methodname=findAll&cssflag=1">新闻</a></li>
		</ul>
	</div>
</div>
<div id="childNav">
<script type="text/javascript">
	function text(){
  			var today=new Date();
  			var yy=today.getFullYear();//当前年份
  			var MM=today.getMonth();//当前月份
  			var dd=today.getDate();//当前天数
  			var hh=today.getHours();//当前小时
  			var mm=today.getMinutes();//当前分钟
  			var ss=today.getSeconds();//当前秒
  			var week=today.getDay();//当前星期
  			var arry=["星期天","星期一","星期二","星期三","星期四","星期五","星期六"];
  			document.getElementById("myclock").innerHTML=yy+"年"+MM+"月"+dd+"日"+"&nbsp;&nbsp"+hh+":"+mm+":"+ss+"&nbsp;&nbsp"+arry[week];
   			}  			
   			var myTime=setInterval("text()",1000);
   			
</script>
<%-- <c:if test="${empty sessionScope.user}"> --%>
<%--       <c:redirect url="/manage/login/login.jsp"></c:redirect> --%>
<%--   </c:if> --%>
	<div class="welcome wrap">
		管理员${sessionScope.user.username}您好，今天是<span id="myclock"></span>，欢迎回到管理后台。
	</div>
</div>
<div id="position" class="wrap">
	您现在的位置：<a href="index.html">易买网</a> &gt; 管理后台
</div>