<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户注册</title>
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
	</style>
</head>
<body>
	<div id="Top">京东用户信息修改</div>
	<form action="Update"method="post">
		<table>
			<tr>
				<td>Id：</td>
				<td><input type="text" name="uid" value="${user.uid}" readonly="readonly"/></td>
			</tr>
			<tr>
				<td>用户名：</td>
				<td><input type="text" name="uname" value="${user.uname }"/></td>
			</tr>
			<tr>
				<td>密码：</td>
				<td><input type="password" name="upwd" value="${ user.upwd }"/></td>
			</tr>
			<tr>
				<td>邮箱：</td>
				<td><input type="text" name="uemail" value="${user.uemail }"/></td>
			</tr>
			<tr>
				<td colspan="2"align="center">
					<input type="submit" value="提交"/>
				
					<input type="reset"/>
				</td>
				
			</tr>
		</table>
	</form>
</body>
</html>