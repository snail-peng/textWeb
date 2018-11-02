<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Tpeople.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <!-- 头部 -->
<%@ include file="/WEB-INF/manage/common/footer.jsp"%>
	<!--中部 -->
<%@ include file="/WEB-INF/manage/common/header.jsp"%>
<!-- 左部 -->
<%@ include file="/WEB-INF/manage/common/left.jsp"%>

	<div class="main">
		<h2>留言管理
		<font color = "green">${sessionScope.flag}   
			<c:remove var="flag" scope="session"/></font>
		</h2>
		<div class="manage">
			<table class="list">
				<tbody><tr>
					<th>ID</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			
						<c:forEach items="${applictionScope.count}" var="message" varStatus="index">
						<tr>
							<td class="first w4 c">message</td>
							<td class="w1 c"><a href="${path}/MessageServlet?methodname=edit&id=${message.id}">踢除</a> </td>
						</tr>
						</c:forEach>
			
				
			</tbody></table>
			<div class="pager">
				<ul class="clearfix">	
					<c:if test="${requestScope.page.pageNo gt 1}"><li><a href="${path}/MessageServlet?methodname=findAll&pageNo=${requestScope.page.pageNo-1}">上一页</a></li></c:if>					
						<c:forEach var="aa" begin="1" end="${requestScope.page.pageCount}">
							<c:choose>
								  <c:when test="${aa eq  requestScope.page.pageNo}">
								  		<li class="current"><a href="${path}/MessageServlet?methodname=findAll&pageNo=${aa}">${aa}</a></li>
								  </c:when>
								  <c:otherwise>
								        <li><a href="${path}/MessageServlet?methodname=findAll&pageNo=${aa}">${aa}</a></li>
								  </c:otherwise>
							</c:choose>				   
						</c:forEach>	 							
					<c:if test="${requestScope.page.pageNo lt requestScope.page.pageCount}"><li><a href="${path}/MessageServlet?methodname=findAll&pageNo=${requestScope.page.pageNo+1}">下一页</a></li></c:if>
				</ul>
			</div>
		</div>
	</div>
			<div class="clear"></div>
		</div>



<!-- 尾部 -->
<%@ include file="/WEB-INF/manage/common/template.jsp"%>
  </body>
</html>
