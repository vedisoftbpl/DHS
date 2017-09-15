 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="shortcut icon" type="image/x-icon" href="../../../DanishHousing/pages/photos/main_icon.jpg" />
<title>Danish Housing Society | Log in</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/dist/css/AdminLTE.min.css">
<!-- iCheck -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<a href="../../index2.html"><b>D</b>HS</a>
		</div>
		<!-- /.login-logo -->
		<div class="login-box-body">
			<p class="login-box-msg">Sign in to start your session</p>
			<div class="form-group" id="typeError">
				<label class="control-label" id="errorTop"></label>
			</div>
			<form
				action="${pageContext.request.contextPath}/admin/pages/UserVerification"
				method="post" onsubmit="return validateForm(this)">
				<div class="form-group" id="emailGroup">
					<label>Email</label> <label class="control-label" for="logEmail"
						id="emailTop"></label> <input type="email" name="logEmail"
						id="logEmail" class="form-control" placeholder="Email"> <span
						class="help-block" id="emailBottom"></span>
				</div>
				<div class="form-group" id="passGroup">
					<label>Password </label> <label class="control-label" for="logPass"
						id="passTop"></label> <input type="password" class="form-control"
						id="logPass" name="logPass" placeholder="Password"> <span
						class="help-block" id="passBottom"></span>
				</div>
				<div class="form-group" id="typeGroup">
					<label>User Type </label> <label class="control-label"
						for="logType" id="typeTop"></label> <select class="form-control"
						id="logType" name="logType">
						<option>Select User Type</option>
						<option>Administrator</option>
						<option>Accounts</option>
						<option>Reception</option>
						<option>Data Entry</option>
					</select> <span class="help-block" id="typeBottom"></span>
				</div>

				<div class="row">
					<div class="col-xs-8">
						<div class="checkbox icheck">
							<label> <input type="checkbox"> Remember Me
							</label>
						</div>
					</div>
					<!-- /.col -->
					<div class="col-xs-4">
						<button type="submit" class="btn btn-primary btn-block btn-flat">Sign
							In</button>
					</div>
					<!-- /.col -->
				</div>
			</form>
			<a href="#">I forgot my password</a><br>


		</div>
		<!-- /.login-box-body -->
	</div>
	<!-- /.login-box -->

	<!-- jQuery 2.2.3 -->
	<script
		src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script
		src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
	<!-- iCheck -->
	<script
		src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
	<script>
		<c:choose>
		<c:when test="${param.error=='1'}">
		$(document).ready(function() {
			$("#typeError").addClass("form-group has-error");
			$("#errorTop")
			.html(
					"<i class='fa fa-times-circle-o'></i> Invalid UserName/Password.");
		});
		</c:when>
		</c:choose>
		function validateForm(form) {
			var invalidEmail = false;
			var inputVal = $("#logEmail").val();
			if (inputVal == null || inputVal.trim().length == 0) {
				$("#emailGroup").addClass("form-group has-error");
				$("#emailTop")
						.html(
								"<i class='fa fa-times-circle-o'></i> Input with error.");
				$("#emailBottom").html("Email cannot be left blank.");
				invalidEmail = true;
			}

			var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
			if (!emailReg.test(inputVal)) {
				$("#emailGroup").addClass("form-group has-error");
				$("#emailTop")
						.html(
								"<i class='fa fa-times-circle-o'></i> Input with error.");
				$("#emailBottom").html("Not a valid Email Format.");
				invalidEmail = true;
			}

			if (invalidEmail == false) {
				$("#emailGroup").removeClass("form-group has-error");
				$("#emailGroup").addClass("form-group has-success");
				$("#emailTop").html(
						"<i class='fa fa-check'></i> Input with success");
				$("#emailBottom").html("Valid Email Id.");
			}

			var invalidPassword = false;
			inputVal = $("#logPass").val();
			if (inputVal == null || inputVal.trim().length == 0) {
				$("#passGroup").addClass("form-group has-error");
				$("#passTop")
						.html(
								"<i class='fa fa-times-circle-o'></i> Input with error.");
				$("#passBottom").html("Password cannot be left blank.");
				invalidPassword = true;
			}

			if (invalidPassword == false) {
				$("#passGroup").removeClass("form-group has-error");
				$("#passGroup").addClass("form-group has-success");
				$("#passTop").html(
						"<i class='fa fa-check'></i> Input with success");
				$("#passBottom").html("Valid Password.");
			}

			var invalidUserType = false;
			inputVal = $("#logType option:selected").index();
			if (inputVal == 0 || inputVal == -1) {
				$("#typeGroup").addClass("form-group has-error");
				$("#typeTop")
						.html(
								"<i class='fa fa-times-circle-o'></i> Input with error.");
				$("#typeBottom").html("Select the User Type.");
				invalidUserType = true;
			}

			if (invalidUserType == false) {
				$("#typeGroup").removeClass("form-group has-error");
				$("#typeGroup").addClass("form-group has-success");
				$("#typeTop").html(
						"<i class='fa fa-check'></i> Input with success");
				$("#typeBottom").html("Valid User Type.");
			}

			if (invalidEmail == false && invalidPassword == false
					&& invalidUserType == false)
				return true;

			return false;
		}
		$(function() {
			$('input').iCheck({
				checkboxClass : 'icheckbox_square-blue',
				radioClass : 'iradio_square-blue',
				increaseArea : '20%' // optional
			});
		});
	</script>
</body>
</html>
