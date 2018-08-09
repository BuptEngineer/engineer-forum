<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>

<!--js css-->
<!-- <link rel="stylesheet" type="text/css"
	href="<c:url value='/resource/css/user/login.css'/>"> -->
<script src="<c:url value='/resource/js/lib/jquery.min.js'/>"></script>
<link href="<c:url value='/resource/css/lib/bootstrap.min.css'/>"
	rel="stylesheet" type="text/css">
<script src="<c:url value='/resource/js/lib/bootstrap.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/resource/js/user/login.js'/>"></script>

<script type="text/javascript">
	// alert notice about login
	var msg = "${msg}";
	if (msg != "") {
		alert(msg);
	}
</script>
<style>
	body{
	padding-top:7%;
	background: #f0f0f0;
	}
</style>
</head>
<!-- procession of login 
	1. When user firstly enter this page, verification code should show.
	2. After user inputed the email, it should check on its correction of formation
-->
<body>

<div style="background:white">
	<div class="container">
		<div class="raw">
			<div class="col-md-8">
				<img src="<c:url value='/resource/imgs/login-show.png'/>" width="100%">
			</div>
			<div class="col-md-4" style="padding-top:10%">
				<form class="form-horizontal" role="form" 
				action = "<c:url var="post_url" value="loginVerification" />"
				method="post">
							<!-- 当出错时，为 form-group div 添加 has-error class，并且添加 下面的 span 元素 -->
							<!--当需要提示的时候，class 去掉 hidden-->
							<!--可以通过 id 来找到每个输入标签对应的提示文本框-->
							<!-- <span class="help-block hidden">一个较长的帮助文本块，超过一行，
									需要扩展到下一行。本实例中的帮助文本总共有两行。</span> -->
					<div class="form-group">
						<label for="firstname" class="col-md-2 control-label">邮箱</label>
						<div class="col-md-10">
							<input type="text" id = "email" name = "u_email" value = "${form.u_email}"
							 class="form-control" id="firstname" placeholder="邮箱">
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-10">
							<input type="password" id = "password" name = "u_pwd" value = "${form.u_pwd}"
							class="form-control" id="lastname" placeholder="密码">
						</div>
					</div>
					<div class="form-group">
							<label for="lastname" class="col-md-2 control-label">验证</label>
							<div class="col-md-10">
								<input type="text" id = "verifyCode" name = "verifyCode"
								class="form-control" id="lastname" placeholder="验证码">
							</div>
						</div>
					<div class="form-group">
								<div class="col-sm-5 col-md-offset-2">
								<img id="vCode" src="<c:url value='verifyCode'/>" width="100%"/>
								</div>
								<a for="lastname" href="javascript:_change()" class="col-md-5 control-label text-left">看不清，换一张</a>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<div class="checkbox">
								<label>
									<input type="checkbox">请记住我
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-primary btn-lg btn-block">登录</button>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
								<a href="<c:url value='register'/>" >免费注册</a>/
								<a href="#" >忘记密码</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>



<!-- 
	<div class="login">
		<div class="login-img">
			<img src="<c:url value='/resource/imgs/login-show.png'/>"
				width="100%">
		</div>
		
		<form id="submitBtn" class="login-form" action="<c:url var="post_url" value="loginVerification" />"
			method="post" target="_top">
			<input type="hidden" name="method" value="login" />
			<div class="inputDiv">
				<label class="form-label">邮箱</label> 
				<input id="email" type="text"
					name="u_email" class="input" value="${form.u_email }"
					placeholder="邮箱:" />
				<div class="errorDiv">
					<span id="emailError" class="error">${errors.email }</span>
				</div>
			</div>

			<div class="inputDiv">
				<label class="form-label">密码</label> <input id="password"
					type="password" name="u_pwd" class="input" value="${form.u_pwd }"
					placeholder="密码:" />
				<div class="errorDiv">
					<span id="passwordError" class="error">${errors.password }</span>
				</div>
			</div>

			<div class="inputDiv">
				<label class="form-label">验证</label> 
				<input id="verifyCode"
					type="text" name="verifyCode" class="input" placeholder="验证码:" />
				<div class="errorDiv">
					<span id="verifyCodeError" class="error">${errors.verifyCode }</span>
				</div>
			</div>

			<div class="img-div">
				<img id="vCode" src="<c:url value='verifyCode'/>" />
				
				<a class="change" href="javascript:_change()">看不清，换一张</a>
			</div>

			<p>
				<input class="form-submit" type="submit" value="登录"></input>
			</p>
			<p class="more">
				<a href="<c:url value='register'/>">免费注册></a><br /> <a href="#">忘记密码？</a>
			</p>
		</form>

	</div>
	<h3 style="text-align: right">${msg}</h3>
	
	 -->
</body>
</html>