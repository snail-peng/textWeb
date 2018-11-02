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
  <script type="text/javascript" src="js/jquery-1.4.1.js"></script>
		<script type="text/javascript" src="js/jquery.ztree.all-3.5.js"></script></head>
		
 <body>
<script type="text/javascript">

$(function(){
	 var zNodes;
	 	$.getJSON("${path}/productCategory/productCategoryAction!ztree.action", function(json){
	 		zNodes=json;
	   
	        });
	 	function  zTreeOnClick(event, treeId, treeNode){
			 
			   
			   //如何阻止事件向上传播
			   
			 event.stopPropagation();//阻止事件冒泡
			
			//事件冒泡
			    // console.info(treeId);
			       //console.info(treeNode.id);
			      // $("#rightDiv").attr("src","info.jsp?id="+treeNode.id);
			       
			       
			       
			
			}
			
			var setting = {
				data: {
					simpleData: {
						enable: true,
						idKey: "id",
				pIdKey: "pId",
				rootPId: 0,
					}
				},
				
				callback: {
			         onClick: zTreeOnClick
		        },
				
			  view: {
			showIcon: true,
			showLine: false
			
		}
			};
			
			
	$(function(){

		$.fn.zTree.init($(".ztree"), setting, zNodes);
		});
	 	});
		function del(id){
			if(confirm("你确认删除吗?")){
				location.href="${path}/ProductCategoryServlet?&methodname=delete&id="+id;
			}
		}	
		$(function(){
			$(".list tr:even").css("background","#ececec");
		});	
	</script>
		<!-- 头部 -->
		<%@ include file="/WEB-INF/manage/common/header.jsp"%>
		<!-- 中部 -->
		<div id="main" class="wrap">
			<%-- 左  --%>
			<%@ include file="/WEB-INF/manage/common/left.jsp"%>
			<%-- 右  --%>
			<div class="main">
		<h2>分类管理 
		<font color = "green">${sessionScope.flag}   
			<c:remove var="flag" scope="session"/></font>
		</h2>
		
		<div class="manage">
			<table class="list">
				<tbody>
					<tr>
						<th>ID</th>
						<th>分类名称</th>
						<th>操作</th>
					</tr>
					
					<c:forEach items="${requestScope.list1}" var="pro">
					<tr>
					<td class="first w4 c">${pro.id}</td>
					<td>${pro.name}</td>
					<td class="w1 c"><a href="${path}/ProductCategoryServlet?id=${pro.id}">编辑</a> <a href="javascript:del(${pro.id})">删除</a></td>
					</tr>
					<c:forEach items="${pro.list}" var="Twopro">
					<tr>
						<td class="first w4 c">${Twopro.id}</td>
						<td class="childClass">${Twopro.name}</td>
						<td class="w1 c"><a href="${path}/ProductCategoryServlet?id=${Twopro.id}">编辑</a> <a href="javascript:del(${Twopro.id})">删除</a></td>
					</tr>
					<c:forEach items="${Twopro.list}" var="Threepro">
					<tr>
						<td class="first w4 c">${Threepro.id}</td>
						<td class="childClasssd">${Threepro.name}</td>
						<td class="w1 c"><a href="${path}/ProductCategoryServlet?id=${Threepro.id}">编辑</a> <a href="javascript:del(${Threepro.id})">删除</a></td>	
					</tr>
					</c:forEach>
				    </c:forEach>
				    </c:forEach>
			</tbody></table>
		</div>
	</div>
			<div class="clear"></div>
		</div>
		<!-- 尾部 -->
		<%@ include file="/WEB-INF/manage/common/footer.jsp"%>
	</body>
</html>
