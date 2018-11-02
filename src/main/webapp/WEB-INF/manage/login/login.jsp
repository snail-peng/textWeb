<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<link rel="stylesheet" type="text/css" href="${path}/css/style.css"/>

	<script>
	   function genrateImg(targetImg){      
	      targetImg.src="${path}/CheckImgServlet?u=" + new Date().getTime();
	   }
	
	</script>

<body>
<div id="header" class="wrap">
	<div id="logo"><img src="${path}/images/logo.gif"></div>
	<div class="help"><a href="#" class="shopping">购物车</a><a href="login.html">登录</a><a href="register.html">注册</a><a href="guestbook.html">留言</a></div>
	<div class="navbar">
		<ul class="clearfix">
			<li class="current"><a href="#">首页</a></li>
			<li><a href="#">图书</a></li>
			<li><a href="#">百货</a></li>
			<li><a href="#">品牌</a></li>
			<li><a href="#">促销</a></li>
		</ul>
	</div>
</div>
<div id="childNav">
	<div class="wrap">
		<ul class="clearfix">
			<li class="first"><a href="#">音乐</a></li>
			<li><a href="#">影视</a></li>
			<li><a href="#">少儿</a></li>
			<li><a href="#">动漫</a></li>
			<li><a href="#">小说</a></li>
			<li><a href="#">外语</a></li>
			<li><a href="#">数码相机</a></li>
			<li><a href="#">笔记本</a></li>
			<li><a href="#">羽绒服</a></li>
			<li><a href="#">秋冬靴</a></li>
			<li><a href="#">运动鞋</a></li>
			<li><a href="#">美容护肤</a></li>
			<li><a href="#">家纺用品</a></li>
			<li><a href="#">婴幼奶粉</a></li>
			<li><a href="#">饰品</a></li>
			<li class="last"><a href="#">Investor Relations</a></li>
		</ul>
	</div>
</div>
<div id="register" class="wrap">
	<div class="shadow">
		<em class="corner lb"></em>
		<em class="corner rt"></em>
		<div class="box">
			<h1>欢迎回到易买网
			
			<font color = "green">${sessionScope.flag}   
			<c:remove var="flag" scope="session"/></font>
			</h1>
			<form action="${path}/login/loginAction.action" method = "post">
				<table>
					<tbody><tr>
					
						<td class="field">用户名：</td>
						<td><input class="text" type="text" name="loginname" onfocus="FocusItem(this)" onblur="CheckItem(this);" value="${sessionScope.name}"><span></span></td>
					</tr>
					<tr>
						<td class="field">登录密码：</td>
						<td><input class="text" type="password" id="passWord" value="${sessionScope.password}" name="password" onfocus="FocusItem(this)" onblur="CheckItem(this);"><span></span></td>
					</tr>
					<tr>
							<td class="field">验证码：</td>
							<td><input class="text verycode" type="text" name="veryCode"
								 /><img width="120" height="30"
								id="veryCode" src="${path}/checkImg/checkImgAction.action" onclick="genrateImg(this)"/><span></span>
							</td>
						</tr>
					<tr>
						<td></td>
						<td><label class="ui-green"><input type="submit" name="submit" value="立即登录"></label></td>
					</tr>
				</tbody></table>
			</form>
		</div>
	</div>
	<div class="clear"></div>
</div>
<div id="footer">
	Copyright © 2010 北大青鸟 All Rights Reserved. 京ICP证1000001号
</div>


<div id="chater" style="left: 1256px; top: 949px;"><dl><dt></dt><dd><a href="#">在线聊天</a></dd></dl></div></body>

