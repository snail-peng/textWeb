<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>后台管理 - 易买网</title>
    
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
	<link rel="stylesheet" type="text/css" href="${path}/css/style.css"/>
	<script type="text/javascript" src="${path}/js/My97DatePicker/WdatePicker.js"></script>
  </head>
  	
 <body>
		<!-- 头部 -->
		<%@ include file="/WEB-INF/manage/common/header.jsp"%>
		<!-- 中部 -->
		<div id="main" class="wrap">
			<%-- 左  --%>
			<%@ include file="/WEB-INF/manage/common/left.jsp"%>
			<s:debug></s:debug>
			<%-- 右  --%>
			<div class="main">
		<h2>订单管理</h2>
		<div class="manage">
			<div class="search">
				<form action="${path}/OrderServlet?methodname=findAll" method="post">
					开始时间：<input type="text" class="text" name="orderId" onclick="WdatePicker()" readonly="readonly" value="${param.orderId}" />
					结束时间：<input type="text" class="text" name="userName" onclick="WdatePicker()" readonly="readonly" value = "${param.userName}"/>
					<label class="ui-blue"><input type="submit" name="submit" value="查询"/></label>
				</form>
			</div>
			<div class="spacer"></div>
			<table class="list">
				<tbody><tr>
					<th>ID</th>
					<th>姓名</th>
					<th>发货地址</th>
					<th>状态</th>
					<th>操作</th>
					</tr>
					<c:choose>
						<c:when test="${empty requestScope.page.list}">
					<tr >
						<td colspan="5" align="center">		
						 <font color="red" size="3px">没有数据</font>
						</td>
					</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${requestScope.page.list}" var="order" varStatus="index">
						<tr>
							<td class="first w4 c">${index.count}</td>
							<td class="w1 c">${order.loginname}</td>
							<td>${order.useraddress}</td>
							<td class="w1 c">${order.status}</td>
							<td class="w1 c"><a href="order-modify.html">详细</a> <a href="javascript:Delete(1);">配货</a></td>
						</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>		
			</tbody></table>
			<div class="pager">
				<ul class="clearfix">	
					<c:if test="${requestScope.page.pageNo gt 1}"><li><a href="${path}/order/orderAction.action?methodname=findAll&pageNo=${requestScope.page.pageNo-1}&orderId=${param.orderId}&userName=${param.userName}">上一页</a></li></c:if>					
						<c:forEach var="aa" begin="1" end="${requestScope.page.pageCount}">
							<c:choose>
								  <c:when test="${aa eq  requestScope.page.pageNo}">
								  		<li class="current"><a href="${path}/order/orderAction.action?methodname=findAll&pageNo=${aa}&orderId=${param.orderId}&userName=${param.userName}">${aa}</a></li>
								  </c:when>
								  <c:otherwise>
								        <li><a href="${path}/order/orderAction.action?methodname=findAll&pageNo=${aa}&orderId=${param.orderId}&userName=${param.userName}">${aa}</a></li>
								  </c:otherwise>
							</c:choose>				   
						</c:forEach>	 							
					<c:if test="${requestScope.page.pageNo lt requestScope.page.pageCount}"><li><a href="${path}/order/orderAction.action?methodname=findAll&pageNo=${requestScope.page.pageNo+1}&orderId=${param.orderId}&userName=${param.userName}">下一页</a></li></c:if>
				</ul>
			</div>
		</div>
	</div>
			<div class="clear"></div>
		</div>
		<!-- 尾部 -->
		<%@ include file="/WEB-INF/manage/common/footer.jsp"%>
	</body>
</html>
