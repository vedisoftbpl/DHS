<!-- Date Range Picker -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" href="../../plugins/datepicker/datepicker3.css">

<%@ include file="../design/Top.jsp"%>
<body class="hold-transition skin-blue sidebar-mini" onload="formin();">
	<!-- Site wrapper -->
	<div class="wrapper">
		<jsp:include page="../design/Header.jsp" flush="true" />
		<!-- =============================================== -->
		<!-- Left side column. contains the sidebar -->
		<jsp:include page="../design/AdminMenu.jsp" flush="true" />
		<!-- =============================================== -->
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>User View</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Master Data</a></li>
					<li class="active">User View</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<!-- Default box -->
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">User View Form</h3>
						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool"
								data-widget="collapse" data-toggle="tooltip" title="Collapse">
								<i class="fa fa-minus"></i>
							</button>
							<button type="button" class="btn btn-box-tool"
								data-widget="remove" data-toggle="tooltip" title="Remove">
								<i class="fa fa-times"></i>
							</button>
						</div>
					</div>

					<!-- User Form -->
					

					<form
						action="${pageContext.request.contextPath}/admin/pages/UserFormController"
						method="post" name="userEditForm" id="userEditForm"
						enctype="multipart/form-data" onsubmit="return validateForm(this)">
						<div class="box-body">
							<div class="row">
								<div class="col-md-6">

									<!-- Profile Image -->
									<div class="box box-primary">
										<div class="box-body box-profile">
											<img class="profile-user-img img-responsive img-circle"
												src="../../pages/photos/${requestScope.user.photo}"
												alt="User profile picture">

											<h3 class="profile-username text-center">${requestScope.user.name}</h3>

										</div>
										<!-- /.box-body -->
									</div>
									<!-- /.box -->

									<input type="hidden" class="form-control" id="showId"
										name="showId" value="${requestScope.user.userId}" />

									<!--  form-group -->
									<!-- Full Name -->
									<div class="form-group" id="divUserFormName">
										<label>Full Name</label>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-user"></i></span>
											<input type="text" class="form-control"
												placeholder="Full Name" id="userFullName"
												name="userFullName" value="${requestScope.user.name}" />
										</div>
										<p id="errorFullName"></p>
									</div>
									<!-- End Full Name -->
									<!-- /.form-group -->


									<!--  form group -->
									<div class="form-group" id="divUserFormEmail">
										<label>Email</label>
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-envelope"></i></span> <input type="email"
												class="form-control" placeholder="example@email.com"
												id="userEmail" name="userEmail"
												value="${requestScope.user.email}" />
										</div>
										<p id="errorEmail"></p>
									</div>
									<!-- /. form-group -->


									<!--  form-group -->

									<!-- Password -->
									<div class="form-group" id="divUserFormPassword">
										<label>Password</label>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-lock"></i></span>
											<input type="password" class="form-control"
												placeholder="Password" id="userPassword" name="userPassword"
												value="${requestScope.user.password}">
										</div>
										<p id="errorPassword"></p>
									</div>

									<!-- End Password -->

									<!-- /.form-group -->

									<!-- form group -->
									<!-- Phone -->
									<div class="form-group" id="divUserFormMobile">
										<label> Mobile:</label>

										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-mobile"></i>
											</div>
											<input type="text" class="form-control"
												data-inputmask='"mask": "(+91) 99999-99999"' data-mask
												id="userMobile" name="userMobile"
												placeholder="(+91) 99999-99999"
												value="${requestScope.user.mobile}" />
										</div>
										<p id="errorMobile"></p>
										<!-- /.input group -->
									</div>

									<!-- End Phone -->
									<!-- /.form group -->

									<!-- form group -->
									<!-- Date of Birth -->
									<div class="form-group" id="divFormUserDateOfBirth">
										<label>Date Of Birth :</label>

										<div class="input-group date">
											<div class="input-group-addon">
												<i class="fa fa-calendar"></i>
											</div>
											<span id="formattedDate1" name="formattedDate1"
												style="display: none;"><fmt:formatDate type="date"
													pattern="dd/MM/yyyy" value="${requestScope.user.dob}" /></span> <input
												type="text" class="form-control pull-right" id="datepicker1"
												name="datepicker1" required />
										</div>
										<p id="errorUserDateOfBirth"></p>
										<!-- /.input group -->
									</div>
									<!--End Date of Birth -->
									<!-- /.form group -->

									<!-- form group -->

									<!-- Date of Joining -->

									<div class="form-group" id="divFormUserDateOfJoin">
										<label>Date Of Joining :</label>

										<div class="input-group date">
											<div class="input-group-addon">
												<i class="fa fa-calendar"></i>
											</div>
											<span id="formattedDate2" name="formattedDate2"
												style="display: none;"><fmt:formatDate type="date"
													pattern="dd/MM/yyyy" value="${requestScope.user.doj}" /></span>
											<input type="text" class="form-control pull-right"
												id="datepicker2" name="datepicker2"
												value="${requestScope.user.doj}" required />
										</div>
										<p id="errorUserDateOfJoin"></p>
										<!-- /.input group -->
									</div>
									<!--End Date of Join -->
									<!-- /.form group -->

									<!-- form group -->
									<!-- Designation -->
									<div class="form-group" id="divUserFormDesignation">
										<label>Designation</label>
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-black-tie"></i></span> <input type="text"
												class="form-control" placeholder="Designation"
												id="userDesignation" name="userDesignation"
												value="${requestScope.user.designation}">
										</div>
										<p id="errorDesignation"></p>
									</div>

									<!--End Designation -->
									<!-- /.form group -->
								</div>
								<!-- /.col -->
								<div class="col-md-6">


									<!-- Profile Image -->
									<div class="box box-primary">
										<div class="box-body box-profile">




											<ul class="list-group list-group-unbordered">
												<li class="list-group-item"><b>Authorization Level</b>
													<a class="pull-right">${requestScope.user.userType}</a></li>
												<li class="list-group-item"><b>Email</b> <a
													class="pull-right">${requestScope.user.email}</a></li>

											</ul>
											<br>
											<br>
										</div>
										<!-- /.box-body -->
									</div>
									<!-- /.box -->
									<!-- form group -->
									<!-- Created By -->
									<div class="form-group" id="divUserFormCreatedBy">
										<label>Created By</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa  fa-user-plus"></i>
											</div>
											<input type="text" class="form-control"
												value="${requestScope.user.createdBy}" id="userCreatedBy"
												name="userCreatedBy" readonly="readonly">

										</div>
									</div>
									<!-- End Created By -->

									<!-- /.form group -->


									<!--  form-group -->

									<!-- Address-->
									<div class="form-group" id="divUserFormAddress">
										<label>Address</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-map-marker"></i>
											</div>
											<textarea class="form-control" rows="8"
												placeholder="Enter your Address" id="userAddress"
												name="userFormAddress">${requestScope.user.address}</textarea>
										</div>
										<p id="errorUserAddress"></p>
									</div>
									<!-- End Address -->

									<!-- /.form group -->


									<!-- form group -->
									<div class="form-group" id="divUserFormUserType">
										<label>User Type</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa  fa-user-plus"></i>
											</div>
											<select class="form-control select2" id="userType"
												name="userType" style="width: 100%;">
												<option value="Administrator" ${requestScope.user.userType eq 'Administrator' ? 'selected' : ''} >Administrator</option>
												<option value="Accounts" ${requestScope.user.userType eq 'Accounts' ? 'selected' : ''} >Accounts</option>
												<option value="Reception" ${requestScope.user.userType eq 'Reception' ? 'selected' : ''} >Reception</option>
												<option value="Data Entry" ${requestScope.user.userType eq 'Data Entry' ? 'selected' : ''} >Data Entry</option>
											</select>
										</div>
									</div>
									<!-- Status -->
									<div class="form-group" id="divUserFormStatus">
										<label>Status</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa  fa-user-plus"></i>
											</div>
											<select class="form-control select2" id="userStatus"
												name="userStatus" style="width: 100%;">
												<option  value="Active" ${requestScope.user.status eq 'Active' ? 'selected' : ''}>Active</option>
												<option value="Inactive" ${requestScope.user.status eq 'Inactive' ? 'selected' : ''}>Inactive</option>
											</select>
										</div>
									</div>
									<!-- End Status -->
									<!-- /.form group -->

									<!-- form group -->

									<!-- Upload Photo -->
									<div class="form-group" id="divUserFormPhoto">
										<label for="exampleInputFile">Upload Photo</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-photo"></i>
											</div>
											<input type="file" id="userPhoto" name="userPhoto"
												class="btn btn-block btn-default btn"
												/>
										</div>
										<p id="errorPhoto"></p>
									</div>
									<!-- End Upload Photo -->

									<!-- /.form group -->

									<input type="hidden" class="form-control" id="operation"
										name="operation" value="edit" />


									<!-- form group -->
									<br>
									<div class="col-xs-4" align="center">
										<button type="button" id="editbtn" value="edit" name="editbtn"
											onclick="editfxn();"
											class="btn btn-primary btn-block btn-flat">Edit User</button>
									</div>
									<div class="col-xs-4" align="center">
										<button type="reset" value="cancel" name="cancel" id="cancel"
											class="btn btn-block btn-danger">Cancel</button>
									</div>

									<!-- / .form group -->
								</div>
								<!-- /.box-body -->
							</div>
							<!-- /.box -->
						</div>
						<!-- /.col -->
					</form>
				</div>


				<!-- User Form -->

				<!-- /.box-body -->
				<div class="box-footer">User Detail</div>

			</section>
			<!-- /.box-footer-->
		</div>
		<!-- /.box -->


		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->
	<%@ include file="../design/Footer.jsp"%>
	<!-- Control Sidebar -->
	<jsp:include page="../design/SideBar.jsp" flush="true" />

	<!-- ./wrapper -->
	<%@ include file="../design/Bottom.jsp"%>
	<script src="../../plugins/datepicker/bootstrap-datepicker.js"></script>
	<!-- iCheck -->
	<!-- jQuery 2.2.3 -->
	<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>

	<script>
	

		function formin() {
			var form = document.getElementById("userEditForm");
			var elements = form.elements;
			for (var i = 0, len = elements.length; i < len; ++i) {
				elements[i].disabled = true;
			}
			document.getElementById("editbtn").disabled = false;
			document.getElementById("cancel").disabled = false;
			//Set formatted date in input fields
			document.getElementById("datepicker1").value = document.getElementById("formattedDate1").innerHTML;
			document.getElementById("datepicker2").value = document.getElementById("formattedDate2").innerHTML;
		}

		function editfxn() {
			if (document.getElementById("editbtn").value == "edit") {
				document.getElementById("editbtn").innerHTML = "Update";
				document.getElementById("editbtn").value = "update";
				var form = document.getElementById("userEditForm");
				var elements = form.elements;
				for (var i = 0, len = elements.length; i < len; ++i) {
					elements[i].disabled = false;
				}
			} else if (document.getElementById("editbtn").value == "update"
					&& validateForm(form)) {
				document.userEditForm.submit();
			}

		}

		function validateForm(form) {
			error = "Please fill this field .";

			//Full Name Validation
			var name = document.getElementById("userFullName").value;
			if (name == null || name === "") {
				document.getElementById("errorFullName").innerHTML = error;
				document.getElementById("divUserFormName").className = 'alert alert-danger alert-dismissible';
				return false;
			}

			if (!(name == null || name === "")) {
				var nameValid = /^[a-zA-Z-. ]+$/;
				if (!nameValid.test(name)) {
					document.getElementById("errorFullName").innerHTML = 'Invalid Name';
					document.getElementById("divUserFormName").className = 'alert alert-danger alert-dismissible';
					return false;
				}
				document.getElementById("errorFullName").innerHTML = "";
				document.getElementById("divUserFormName").className = 'form-group has-success';
			}

			//End Full Name Validation

			//Email Validation
			var email = document.getElementById("userEmail").value;

			if (email == null || email === "") {
				document.getElementById("errorEmail").innerHTML = error;
				document.getElementById("divUserFormEmail").className = 'alert alert-danger alert-dismissible';
				return false;

			}

			if (!(email == null || email === "")) {
				var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;

				if (!emailReg.test(email)) {
					document.getElementById("errorEmail").innerHTML = "Invaild Email Id ";
					document.getElementById("divUserFormEmail").className = 'alert alert-warning alert-dismissible';
					return false;
				}
				document.getElementById("errorEmail").innerHTML = "";
				document.getElementById("divUserFormEmail").className = 'form-group has-success';
			}
			//End Email Validation

			//Password Validation
			var pass = document.getElementById("userPassword").value;
			if (pass == null || pass === "") {
				document.getElementById("errorPassword").innerHTML = error;
				document.getElementById("divUserFormPassword").className = 'alert alert-danger alert-dismissible';
				return false;
			}

			if (pass.length < 8) {
				document.getElementById("errorPassword").innerHTML = 'Password should be atleast 8 character';
				document.getElementById("divUserFormPassword").className = 'alert alert-danger alert-dismissible';
				return false;
			}
			document.getElementById("errorPassword").innerHTML = "";
			document.getElementById("divUserFormPassword").className = 'form-group has-success';
			//End Password Validation

			//Mobile Validation
			var phone = document.getElementById("userMobile").value;
			if (phone == null || phone === "") {

				document.getElementById("errorMobile").innerHTML = error;
				document.getElementById("divUserFormMobile").className = 'alert alert-danger alert-dismissible';
				return false;

			}

			if (!(phone == null || phone === "")) {
				var phoneno = /^\d{10}$/;
				if (!(phone.match(phoneno))) {
					document.getElementById("errorMobile").innerHTML = "Invalid Mobile Number";
					document.getElementById("divUserFormMobile").className = 'alert alert-warning alert-dismissible';
					return false;
				}
				document.getElementById("errorMobile").innerHTML = "";
				document.getElementById("divUserFormMobile").className = 'form-group has-success';
			}
			//End Mobile Validation

			//Date of Birth Validation
			var dob = document.getElementById("datepicker1").value;
			//document.getElementById("errorUserDateOfBirth").innerHTML = 'vALUE = ' + dob;
			if (dob == null || dob === "") {
				document.getElementById("errorUserDateOfBirth").innerHTML = error;
				document.getElementById("divFormUserDateOfBirth").className = 'alert alert-danger alert-dismissible';
				return false;
			}
			document.getElementById("errorUserDateOfBirth").innerHTML = "";
			document.getElementById("divFormUserDateOfBirth").className = 'form-group has-success';
			//End Date of Birth Validation

			//Date of Join Validation
			var doj = document.getElementById("datepicker2").value;
			if (doj == null || doj === "") {
				document.getElementById("errorUserDateOfJoin").innerHTML = error;
				document.getElementById("divFormUserDateOfJoin").className = 'alert alert-danger alert-dismissible';
				return false;
			}
			document.getElementById("errorUserDateOfJoin").innerHTML = "";
			document.getElementById("divFormUserDateOfJoin").className = 'form-group has-success';
			//End Date of Join Validation

			//Designation Validation
			var desig = document.getElementById("userDesignation").value;
			if (desig == null || desig === "") {
				document.getElementById("errorDesignation").innerHTML = error;
				document.getElementById("divUserFormDesignation").className = 'alert alert-danger alert-dismissible';
				return false;

			}
			document.getElementById("errorDesignation").innerHTML = "";
			document.getElementById("divUserFormDesignation").className = 'form-group has-success';
			//End Designation Validation

			//Address Validation
			var add = document.getElementById("userAddress").value;
			if (add == null || add === "") {
				document.getElementById("errorUserAddress").innerHTML = error;
				document.getElementById("divUserFormAddress").className = 'alert alert-danger alert-dismissible';
				return false;

			}
			document.getElementById("errorUserAddress").innerHTML = "";
			document.getElementById("divUserFormAddress").className = 'form-group has-success';
			//End Address Validation

			//Photo Validation
		//	var photo = document.getElementById("userPhoto").value;
		//	if (photo == null || photo === "") {
		//		document.getElementById("errorPhoto").innerHTML = error;
		//		document.getElementById("divUserFormPhoto").className = 'alert alert-danger alert-dismissible';
		//		return false;

		//	}
			//	document.getElementById("errorPhoto").innerHTML = "";
		//	document.getElementById("divUserFormPhoto").className = 'form-group has-success';
			//End Photo Validation

			return true;
		}
		$(function() {
			$('#datepicker1').datepicker({
				format : 'dd/mm/yyyy',
				autoclose : true
			});
			$('#datepicker2').datepicker({
				format : 'dd/mm/yyyy',
				autoclose : true
			});
		});
	</script>