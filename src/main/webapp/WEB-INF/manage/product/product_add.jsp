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
 <script>
 	$(function(){
 		//取一级分类
 		$.getJSON("${path}/ProductServlet?methodname=selectOne&csstype=4","parentId=0", function(json){
  		  console.info(json);
  		  var context="";
  		  $(json).each(function(){
  		    context+="<option  value='"+this.id+ "'>" + this.name +"</option>";
  		  
  		  });
  		  
  		  $("select#categoryLevel1Id").html(context);
   
        });
         //取二级分类
        $("select#categoryLevel1Id").change(function(){
        	$.getJSON("${path}/ProductServlet?methodname=selectOne&csstype=4","parentId="+$(this).val(), function(json){
  		  console.info(json);
  		  var context="";
  		  $(json).each(function(){
  		    context+="<option  value='"+this.id+ "'>" + this.name +"</option>";
  		  
  		  });
  		  
  		  $("select#categoryLevel2Id").html(context);
   
        	});
        });
        
        //取三级分类
        $("select#categoryLevel2Id").change(function(){
        	$.getJSON("${path}/ProductServlet?methodname=selectOne&csstype=4","parentId="+$(this).val(), function(json){
  		  console.info(json);
  		  var context="";
  		  $(json).each(function(){
  		    context+="<option  value='"+this.id+ "'>" + this.name +"</option>";
  		  
  		  });
  		  
  		  $("select#categoryLevel3Id").html(context);
   
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
		<h2>添加商品</h2>
		<div class="manage">
			<form action="${path}/product/productAction!save.action" method="post" enctype="multipart/form-data">
				<table class="form">
					<tbody><tr>
						<td class="field">商品名称：</td>
						<td><input type="text" class="text" name="name" value=""/></td>
					</tr>
					<tr>
						<td class="field">商品价格：</td>
						<td><input type="text" class="text tiny" name="price"/> 元</td>
					</tr>
					<tr>
						<td class="field">库存：</td>
						<td><input type="text" class="text tiny" name="stock"/></td>
					</tr>
					<tr>
						<td class="field">1级分类：</td>
						<td>
							<select name="categoryLevel1Id"   id="categoryLevel1Id">
							
							</select>
						</td>
					</tr>
					<tr>
						<td class="field">2级分类：</td>
						<td>
							<select name="categoryLevel2Id" id="categoryLevel2Id">
							
							</select>
						</td>
					</tr>
					<tr>
						<td class="field">3级分类：</td>
						<td>
							<select name="categoryLevel3Id" id="categoryLevel3Id">
							
							</select>
						</td>
					</tr>
					<tr>
						<td class="field">商品图片：</td>
						<td><input type="file" class="text" name="uploadImage"/></td>
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
