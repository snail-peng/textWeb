<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理 - 易买网</title>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style.css" />
<script type="text/javascript"
	src="${path}/js/My97DatePicker/WdatePicker.js"></script>
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
			<h2>修改用户</h2>
			<div class="manage">
				<form action="/user/manage/user/userAction!update.action" method="post">

					<input type="hidden" name="id" value="${requestScope.id}" />
					<table class="form">
						<tbody>
							<tr>
								<td><input type="hidden" name="methodname" value="update" />
								</td>
							</tr>
							<tr>
								<td class="field">登录名：</td>
								<td><input name="loginname" value="${requestScope.id}"></input>
								</td>
							</tr>
							<tr>
								<td class="field">姓名：</td>
								<td><input name="username" value="${requestScope.username}"></input>
								</td>
							</tr>
							<tr>
								<td class="field">密码：</td>
								<td><input name="password"></input>
								</td>
							</tr>
							<tr>
								<td class="field">用户类型：</td>
								<td><select name="status">

										<option value="0">管理员</option>

										<option value="1" ${requestScope.status eq 1?"selected":""}>
											审核员</option>
										<option value="2" ${requestScope.status eq 2?"selected":""}>
											配货员</option>
										<option value="3" ${requestScope.status eq 3?"selected":""} >
											送货员</option>
								</select></td>
							</tr>
							<tr>
								<td class="field">性别：</td>

								<td><input type="radio" name="sex" value="1"
									${requestScope.sex eq 1?"checked":""}/>男 <input
									type="radio" name="sex" value="0" ${requestScope.sex eq 0?"checked":""}/>女</td>
							</tr>
						
							<tr>
								<td class="field">身份证号：</td>
								<td><input name="identityCode"></input>
								</td>
							</tr>
							<tr>
								<td class="field">邮箱：</td>
								<td><input name="email"></input>
								</td>
							</tr>
							<tr>
								<td class="field">手机号码：</td>
								<td><input name="mobile"></input>
								</td>
							</tr>
							<tr>
								<td class="field">送货地址：</td>
								<td><input name="address"></input>
								</td>
							</tr>
							<tr>
								<td></td>
								<td><label class="ui-blue"><input name="identityCode" type="submit"></input>
								</label>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<!-- 尾部 -->
	<%@ include file="/WEB-INF/manage/common/footer.jsp"%>
</body>
</html>
