<%@ page pageEncoding="UTF-8"%>
<div id="menu-mng" class="lefter">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
		<div class="box">
			<dl>
				<dt>用户管理</dt>
				<dd ${param.cssflag eq 5? "class=current":""}>
			
				<shiro:hasPermission name="easybuy:user:add">
				<em><a href="${path}/user/userAction!add.action?cssflag=5">新增</a></shiro:hasPermission></em>
				<shiro:hasPermission name="easybuy:user:list">
				<a href="${path}/user/userAction.action?cssflag=1">用户管理</a></shiro:hasPermission></dd>
				
				<dt>商品信息</dt>
				<dd ${param.cssflag eq 4? "class=current":""}><em>
				<shiro:hasPermission name="productcategory/ProductCategoryAction!save.action">
				<a href="${path}/manage/product/productCategory_add.jsp?cssflag=4">新增</a>
				</shiro:hasPermission></em>
				<shiro:hasPermission name="productcategory/ProductCategoryAction.action">
				<a href="${path}/productCategory/productCategoryAction.action?cssflag=4">分类管理</a>
				</shiro:hasPermission></dd>
				
				
				<dd ${param.cssflag eq 4? "class=current":""}><em><shiro:hasPermission name="product/ProductAction!input.action">
				<a href="${path}/product/productAction!add.action?cssflag=4">新增</a></shiro:hasPermission></em>
				<shiro:hasPermission name="product/ProductAction.action">
				<a href="${path}/product/productAction.action?cssflag=4">商品管理</a></shiro:hasPermission></dd>
				<dt>订单管理</dt>
				<dd ${param.cssflag eq 3? "class=current":""}>
				<shiro:hasPermission name="order/OrderAction!getPage.action">
				<a href="${path}/order/orderAction.action?cssflag=3">订单管理</a>
				</shiro:hasPermission></dd>
				<dt>留言管理</dt>
				<dd ${param.cssflag eq 2? "class=current":""}>
				<shiro:hasPermission name="comment/CommentAction!getPage.action">
				<a href="${path}/comment/commentAction.action?cssflag=2">留言管理</a>
				</shiro:hasPermission></dd>
				<dt>新闻管理</dt>
				<dd ${param.cssflag eq 1? "class=current":""}><em>
				<shiro:hasPermission name="news/NewsAction!add.action">
				<a href="${path}/news/newsa!add.action">新增</a></shiro:hasPermission></em>
				<shiro:hasPermission name="manage/t_news/news_list.jsp">
				<a href="${path}/news/newsa.action?cssflag=1">新闻管理</a></shiro:hasPermission></dd>
					
				<dt><a href="${path}/news/newsa.action">在线管理</a></dt>
				<dt><shiro:hasPermission name="login/loginAction!findAll.action"><a href="${path}/login/loginAction!findAll.action">登陆管理</a></shiro:hasPermission></dt>
				<dt><shiro:hasPermission name="role/roleAction.action"><a href="${path}/role/roleAction.action">权限管理</a></shiro:hasPermission></dt>
			</dl>
		</div>
	</div>
