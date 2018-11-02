<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理 - 易买网</title>

<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<link rel="stylesheet" type="text/css" href="${path}/css/style.css" />
<link rel="stylesheet" type="text/css" href="${path}/css/zTreeStyle/zTreeStyle.css" />
<script type="text/javascript" src="${path }/js/jquery-1.4.1.js"></script>
<script type="text/javascript" src="${path }/js/jquery.ztree.all-3.5.js"></script>
</head>



<body>
	<script type="text/javascript">
$(function(){
	var status=$(".id").val();
	alert(status);
	$.ajax({
		
		type: "POST",
		url: "${path}/func/funcAction!func.action?status="+status,
		dataType : "json",
		success : function(msg) {
			console.info(msg);
							
						
							var setting = {
								data : {
									simpleData : {
										enable : true,
										idKey : "id",
										pIdKey : "parentId",
										rootPId : 0,
									}
								},
								check : {
						            enable : true
						        },
								view: {
									showLine: false,
									selectedMulti: false
								}
							};
							

							$.fn.zTree.init($("#treeDemo"), setting, msg);
						}
					});
	
		
		});
function save(){
	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	var nodes = treeObj.getCheckedNodes(true);
	 var str = "";
	for(var i=0;i<nodes.length;i++){
		
		 str += nodes[i].id+ ",";	
	
	}
	
	
	$("#fid").val(str);
	alert($("#fid").val(str));
	$("#funcForm").submit();
	
	
}
	</script>
	<!-- 头部 -->
	<%@ include file="/WEB-INF/manage/common/header.jsp"%>
	<!-- 中部 -->
	<div id="main" class="wrap">
		<%-- 左  --%>
		<%@ include file="/WEB-INF/manage/common/left.jsp"%>
		<%-- 右  --%>
		<div class="main">
			<h2>
				权限管理 <font color="green">${sessionScope.flag} <c:remove
						var="flag" scope="session" /></font>
			</h2>
			
			<div class="manage">
				<ul id="treeDemo" class="ztree"></ul>
			
			</div>
			
			<form id="funcForm" theme="simple" action="func/funcAction!update.action" method="post">
			
			
			<input type="hidden" name="fid" id="fid"/>
			<input class="id" name="status"  type="hidden"  value="${requestScope.id }"></input>
			<input type="button" onclick="save();" value="修改"/>
			
			
			</form>
				
		</div>
		<div class="clear"></div>
	</div>
	<!-- 尾部 -->
	<%@ include file="/WEB-INF/manage/common/footer.jsp"%>
</body>
</html>
