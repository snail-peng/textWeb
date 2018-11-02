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
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css"/>
  	<script type="text/javascript" src="${path}/js/My97DatePicker/WdatePicker.js"></script>
  <script type="text/javascript" src="../../js/jquery-1.4.1.js"></script></head>
  	
 <body>
 <script>
 	$(function(){
 		$("#userName").blur(function(){
 			var loginNameValue=$(this).val();
 			$.ajax({
 				type: "POST",
   				url: "${path}/UserServlet",
   				data: "methodname=findUserByLoginName&loginName="+loginNameValue,
   				success: function(msg){
    				// alert( "Data Saved: " + msg );
    				console.info(msg);
      				 $("#userNameId").html(msg).css("color","green");
      				 if($("#userNameId").html()=="该用户名已存在"){    				 
            		 	$("#userName").val("");
            		 	$("#userName").focus();
            		 	
      				 }
   				}
 			});
 		});
 	
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
		<h2>新增用户</h2>
		<div class="manage">
			<form action="${path}/user/userAction!save.action" method="post">
				<table class="form">
					<tbody><tr>
						<td class="field">用户名：</td>
						<td><input type="text" class="text" name="username" value="" id="userName"/><span id="userNameId"></span></td>
					</tr>
					<tr>
					<td><input type="hidden" name="methodname" value="save"/></td>
					</tr>
					<tr>
						<td class="field">姓名：</td>
						<td><input type="text" class="text" name="loginname" value=""/></td>
					</tr>
					
					<tr>
						<td class="field">密码：</td>
						<td><input type="password" class="text" name="password" value=""/></td>
					</tr>
					<tr>
								<td class="field">
									用户类型：
								</td>
								<td>
									<select name="status">

										<option value="0">
											管理员
										</option>
									
										<option value="1" >
											审核员
										</option>
										<option value="2" >
											配货员
										</option>
										<option value="3" >
											送货员
										</option>
										
										
									</select>
								</td>
							</tr>
					<tr>
						<td class="field">性别：</td>
						<td><input type="radio" name="sex" value="1" checked="checked"/>男 <input type="radio" name="sex" value="0"/>女</td>
					</tr>
					<tr>
						<td class="field">出生日期：</td>
						<td><input type="text" class="text" name="startDate"  onclick="WdatePicker()" readonly="readonly"/></td>
					</tr>
					<tr>
						<td class="field">身份证号：</td>
						<td><input type="text" class="text" name="identityCode" value=""/></td>
					</tr>
					<tr>
						<td class="field">邮箱：</td>
						<td><input type="text" class="text" name="email" value=""/></td>
					</tr>
					<tr>
						<td class="field">手机号码：</td>
						<td><input type="text" class="text" name="mobile" value=""/></td>
					</tr>
					<tr>
						<td class="field">送货地址：</td>
						<td><input type="text" class="text" name="address" value=""/></td>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-blue"><input type="submit" name="submit" value="添加"/></label></td>
					</tr>
				</tbody></table>
			</form>
		</div>
	</div>
			<div class="clear"></div>
		</div>
		<!-- 尾部 -->
		<%@ include file="/WEB-INF/manage/common/footer.jsp"%>
	</body>
</html>
