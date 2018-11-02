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
	 <script type="text/javascript" src="${path }/js/jquery-1.4.1.js"></script>
	 <script>
	 $(function(){
		
		var id=$("input").val();
	
		 if(id!=""){
		
			 $("form").attr("action","${path}/news/newsa!update.action"); 
		 }else{

			 $("form").attr("action","${path}/news/newsa!save.action"); 
			 $("h2").html("新增新闻");
			 $("#bq").val("新增");
		
		 }
		
	 });	
	 </script>
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
		<h2>修改新闻</h2>
		<div class="manage">
			<form action="/news/manage/news/newsa!update.action" method="post" theme="simple">
			<input type="hidden" name="id" value="${requestScope.news.id }">
				<table class="form">
					<tbody><tr>
						<td class="field">新闻标题：</td>
						<td> <s:textfield name="title"></s:textfield><s:fielderror fieldName="titleError" cssClass="color:red"/></td>	
					</tr>
					<tr>
						<td class="field">新闻内容：</td>
						<td><s:textarea name="content"></s:textarea><s:fielderror fieldName="contentError" cssClass="color:red"/></td>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-blue"> <s:submit id="bq" value="修改"></s:submit></label></td>
					</tr>
				</tbody></table>
			<form>
		</div>
	</div>
			<div class="clear"></div>
		</div>
		<!-- 尾部 -->
		<%@ include file="/WEB-INF/manage/common/footer.jsp"%>
	</body>
</html>
  	