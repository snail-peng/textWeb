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
<script type="text/javascript" src="../../js/jquery-1.4.1.js"></script></head>
  	
 <body>


		<!-- 头部 -->
		<%@ include file="/WEB-INF/manage/common/header.jsp"%>
		<!-- 中部 -->
		<div id="main" class="wrap">
			<%-- 左  --%>
			<%@ include file="/WEB-INF/manage/common/left.jsp"%>
			<%-- 右  --%>
			<div class="main">
			<h2>
				登陆管理 <font color="red"> ${sessionScope.flag } <c:remove
						var="flag" scope="session" /> </font>
			</h2>
			<div class="manage">
				<table class="list">
					<tbody>
						<tr>
							<th>序号</th>
							<th>登录名</th>
							<th>IP地址</th>
							<th>登陆时间</th>
							<th>登陆情况</th>
							<th>操作</th>
							
						</tr>
						<c:choose>
							<c:when test="${empty requestScope.page.list}">
								<tr>
									<td colspan="6" align="center"><font color="red">没有数据</font>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${requestScope.page.list}" var="news"
									varStatus="newsid">
									<tr>
										<td class="first w4 c">${newsid.count+(requestScope.page.pageNo-1)*requestScope.page.pageSize}</td>
										<td class="first w4 c">${news.username}</td>
										<td class="first w4 c">${news.logintime}</td>
										<td>${news.ip }</td>
										<td>${news.type}</td>
										<td class="w1 c">
											<a href="easybuy-web/manage/news/newsa!delete.action?id=${news.id}" id="delete" name="${news.id}">删除</a></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<div class="pager">
					<ul class="clearfix">
						<c:if test="${requestScope.page.pageNo gt 1}">
							<li><a
								href="${ctx}/easybuy-web/news/newsa.action?cssflag=1&pageNo=${requestScope.page.pageNo-1}">上一页</a>
							</li>
						</c:if>
						<c:forEach var="num" begin="1" end="${requestScope.page.pageCount}">
							<c:choose>
								<c:when test="${num eq requestScope.page.pageNo}">
									<li class="current1"><a
										href="${ctx}/easybuy-web/news/newsa.action?cssflag=1&pageNo=${num}">${num}</a>
									</li>
								</c:when>
								<c:otherwise>
									<li><a
										href="${ctx}/easybuy-web/news/newsa.action?cssflag=1&pageNo=${num}">${num}</a>
									</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${requestScope.page.pageNo lt requestScope.page.pageCount}">
							<li><a
								href="${ctx}/easybuy-web/news/newsa.action?cssflag=1&pageNo=${requestScope.page.pageNo+1}">下一页</a>
							</li>
						</c:if>
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
