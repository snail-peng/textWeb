
<%@ page pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();

request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>后台管理 - 易买网</title>
    
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css"/>
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
		<h2>修改商品</h2>
		<div class="manage">
			<form action="${path }/product/productAction!update.action" method="post">
			<input type="hidden" name="id" value="${requestScope.product.id}"/>
				<table class="form">
					<tbody><tr>
						<td class="field">商品名称：</td>
						<td><input type="text" class="text" name="productName" value="${requestScope.product.name}"/></td>
					</tr>
					<tr>
					<td><input type="hidden" name="methodname" value="update"/></td>
					</tr>
					<tr>
						<td class="field">商品价格：</td>
						<td><input type="text" class="text tiny" name="productPrice" value="${requestScope.product.price}"/>元</td>
					</tr>
					<tr>
						<td class="field">库存：</td>
						<td><input type="text" class="text tiny" name="stock" value = "${requestScope.product.stock}"/></td>
					</tr>
					<tr>
						<td class="field">分类壹：</td>
						<td><input type="text" class="text" name="productName1" value="${requestScope.product.categoryLevel1Id}"/></td>
					</tr>
					<tr>
						<td class="field">分类贰：</td>
						<td><input type="text" class="text" name="productName2" value="${requestScope.product.categoryLevel2Id}"/></td>
					</tr>
					<tr>
						<td class="field">分类叁：</td>
						<td><input type="text" class="text" name="productName3" value="${requestScope.product.categoryLevel3Id}"/></td>
					</tr>
					<tr>
						<td class="field">商品图片：</td>
						<td><input type="file" class="text" name="uploadImage" value = "${requestScope.product.fileName}"/></td>
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
