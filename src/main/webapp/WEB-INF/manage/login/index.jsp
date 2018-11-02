<%@ page pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'index.jsp' starting page</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet"
			href="<%=basePath%>css/zTreeStyle/zTreeStyle.css" type="text/css"></link>
		<script type="text/javascript"
			src="<%=basePath%>/js/jquery-1.4.1.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>/js/jquery.ztree.all-3.5.js"></script>
		<script type="text/javascript">
		
		function  zTreeOnClick(event, treeId, treeNode){
		 
		   
		   //如何阻止事件向上传播
		   
		 event.stopPropagation();//阻止事件冒泡
		
		//事件冒泡
		    // console.info(treeId);
		       //console.info(treeNode.id);
		      // $("#rightDiv").attr("src","info.jsp?id="+treeNode.id);
		       
		       
		       
		
		}
		var zNodes =[
		 			
		 			
		 			{ id:111, pId:11, name:"叶子节点111"},
		 			{ id:112, pId:11, name:"叶子节点112"},
		 			{ id:113, pId:11, name:"叶子节点113"},
		 			{ id:114, pId:11, name:"叶子节点114"},
		 		
		 			{ id:121, pId:12, name:"叶子节点121"},
		 			{ id:122, pId:12, name:"叶子节点122"},
		 			{ id:11, pId:1, name:"父节点11 - 折叠"},
		 			{ id:123, pId:12, name:"叶子节点123"},
		 			{ id:124, pId:1222, name:"叶子节点124"},
		 			{ id:12, pId:1, name:"父节点12 - 折叠"},
		 			{ id:13, pId:1, name:"父节点13 - 没有子节点", isParent:true},
		 			{ id:1, pId:0, name:"父节点1 - 展开", open:true, iconOpen:"/images/leaf.gif", iconClose:"/images/folder.gif"}
		 		];
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

</script>

	</head>

	<body >
		<div>
			<ul id="treeDemo" class="ztree"></ul>
		</div>&nbsp; 
		<iframe src="" id="rightDiv"></iframe>
	</body>
</html>
