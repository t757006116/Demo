<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户列表</title>
	<style type="text/css">
		*{
			margin: 0px;
			padding: 0px;
		}
		#Top{
			width: 100%;
			height: 80px;
			line-height: 80px;
			text-align: center;
			font-size: 24px;
			border-bottom: 3px solid #B1191A;
		}
		table {
			margin: 0px auto;
			margin-top: 20px;
		}
		table tr{
			height: 25px;
			line-height: 25px;
		}	
		table tr td{
			width: 100px;
		}
		table tr:nth-child(odd){
			background-color: #f1f1f1;
}
	</style>
</head>
<body>
	<div id="Top">京东用户列表</div>
	<table  cellpadding="0" cellspacing="0">
			<tr>
				<td>ID</td>
				<td>用户名</td>
				<td>密码</td>
				<td>邮箱</td>
				<td>操作</td>
			</tr>
			<c:forEach var="u" items="${users}">
				<tr>
					<td>${ u.uid }</td>
					<td>${ u.uname }</td>
					<td>${ u.upwd }</td>
					<td>${ u.uemail }</td>
					<td>
						<a href="Init?uid=${u.uid }">修改</a>
						<a href="Del?uid=${ u.uid }">删除</a>
					</td>
				</tr>
			</c:forEach>
	</table>
</body>
</html>