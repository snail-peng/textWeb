<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>
<form action="${path}/emp/empAction.action" method="post">
    <label>员工姓名
    <input type="text" name="ename" id="textfield">
</label>
    <label>雇用起始时间
    <input type="text" name="strasttime" id="textfield2">
    </label>
  <label></label>
  至
    <input type="text" name="endtime" id="textfield3">
    <label>部门
    <select name="dept.dname" id="select">
      <option value="-1">请选择部门</option>
      <option value="10">部门1</option>
       <option value="20">部门2</option>
        <option value="30">部门3</option>
         <option value="40">部门4</option>
    </select>
    </label>
    <label>
    <input type="submit" name="button" id="button" value="查询">
    </label>
  </p>
  <table width="1196" border="1">
    <tbody><tr>
      <td width="509"><div align="center">员工姓名（ENAME）</div></td>
      <td width="147"><div align="center">sal</div></td>
      <td width="282"><div align="center">hiredate</div></td>
      <td width="139"><div align="center">mgr</div></td>
      <td width="97"><div align="center">部门名称</div></td>
    </tr>
    <c:forEach items="${requestScope.list}" var="news"
									varStatus="newsid">
    <tr>
      <td>news.ename</td>
      <td>news.sal</td>
      <td>news.hiredate</td>
      <td>news.mgr</td>
      <td>news.dept.dname</td>
    </tr>
    </c:forEach>
  </tbody></table>
  </form>
</body>
</html>