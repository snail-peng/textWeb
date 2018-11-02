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
 </head>
  
 <body>
 
		<!-- 头部 -->
		<%@ include file="/WEB-INF/manage/common/header.jsp"%>
		<!-- 中部 -->
		<div id="main" class="wrap">
			<%-- 左  --%>
			<%@ include file="/WEB-INF/manage/common/left.jsp"%>
			<%-- 右  --%>
			<div class="main">
		<h2>用户管理
		<font color = "green">${sessionScope.flag}   
			<c:remove var="flag" scope="session"/></font>
		</h2>
	
		<div class="manage">
			<table class="list">
				<tbody>
				<tr>
						
					<th>编号</th>
					<th>姓名</th>
					<th>操作</th>
				</tr>
				<c:choose>
					<c:when test="${empty requestScope.page.list}">
					<tr >
						<td colspan="6" align="center">		
						 <font color="red" size="3px">没有数据</font>
						</td>
					</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${requestScope.page.list}" var="user" varStatus="index">
						<tr>
							<td class="first w4 c"><input type="checkbox" name="List_Selected"/>&nbsp;&nbsp;${index.count}</td>
							<td class="w1 c">${user.roleName}</td>
						
							<td class="w1 c"><a href="${path}/func/funcAction.action?id=${user.id}">编辑</a> 
							</td>
						</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>	
			</tbody>
			</table>
<!-- 			<div class="pager"> -->
<!-- 					<ul class="clearfix"> -->
<%-- 						<c:if test="${page.pageNo gt 1}"> --%>
<!-- 							<li><a -->
<%-- 								href="${path}/user/userAction.action?cssflag=1&pageNo=${requestScope.page.pageNo-1}">上一页</a> --%>
<!-- 							</li> -->
<%-- 						</c:if> --%>
<%-- 						<c:forEach var="num" begin="1" end="${requestScope.page.pageCount}"> --%>
<%-- 							<c:choose> --%>
<%-- 								<c:when test="${num eq requestScope.page.pageNo}"> --%>
<!-- 									<li class="current1"><a -->
<%-- 										href="${path}/user/userAction.action?cssflag=1&pageNo=${num}">${num}</a> --%>
<!-- 									</li> -->
<%-- 								</c:when> --%>
<%-- 								<c:otherwise> --%>
<!-- 									<li><a -->
<%-- 										href="${path}/user/userAction.action?cssflag=1&pageNo=${num}">${num}</a> --%>
<!-- 									</li> -->
<%-- 								</c:otherwise> --%>
<%-- 							</c:choose> --%>
<%-- 						</c:forEach> --%>
<%-- 						<c:if test="${requestScope.page.pageNo lt requestScope.page.pageCount}"> --%>
<!-- 							<li><a -->
<%-- 								href="${path}/user/userAction.action?cssflag=1&pageNo=${requestScope.page.pageNo+1}">下一页</a> --%>
<!-- 							</li> -->
<%-- 						</c:if> --%>
<!-- 					</ul> -->
<!-- 				</div> -->
<!-- 		</div> -->
	</div>
			<div class="clear"></div>
		</div>
		<!-- 尾部 -->
		<%@ include file="/WEB-INF/manage/common/footer.jsp"%>
	</body>
</html>
