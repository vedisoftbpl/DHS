<!-- daterange picker -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="../../plugins/datepicker/datepicker3.css">
<!-- select style -->
<link rel="stylesheet"
	href="../../plugins/select2/select2.css">
<%@ include file="../design/Top.jsp"%>
<body class="hold-transition skin-blue sidebar-mini">
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
				<h1>Member</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Master Data</a></li>
					<li class="active">Member</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<!-- Default box -->
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">Member Registration Form</h3>
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
					
						<div class="form-group" id="typeError">
				<label class="control-label" id="errorTop"></label>
			</div>

					<!-- User Form -->
					<form action="${pageContext.request.contextPath}/admin/pages/MemberFormController" method="post"
						enctype="multipart/form-data" onsubmit="return validateForm(this)">
						<div class="box-body">
							<div class="row">
								<div class="col-md-6">

									<!--  form-group -->
									<!-- Full Name -->
									<div class="form-group" id="divMemberFormName">
										<label>Full Name</label>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-user"></i></span>
											<span class="col-xs-2"><select class="form-control select2" id="prefix"
												name="prefix" style="width: 80px;" required="required" >
												<option>Mr.</option>
												<option>Mrs.</option>
												<option>Miss</option>
											</select>
											</span>
											<span class="col-md-10">
											<input type="text" class="form-control"
												placeholder="Full Name" id="memberFullName"
												name="memberFullName" />
											</span>
										</div>
										<p id="errorFullName"></p>
									</div>
									<!-- End Full Name -->
									<!-- /.form-group -->
									
									<!--  form-group -->
									<!-- Relative Name -->
									<div class="form-group" id="divMemberFormRelativeName">
										<label>Relative Name</label>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-user"></i></span>
											<span class="col-xs-2"><select class="form-control select2" id="relation"
												name="relation" style="width: 80px;" required="required" >
												<option>S/O</option>
												<option>D/O</option>
												<option>W/O</option>
											</select>
											</span>
											<span class="col-md-10">
											<input type="text" class="form-control"
												placeholder="Full Name" id="relativeFullName"
												name="relativeFullName" />
											</span>
										</div>
										<p id="errorRelativeName"></p>
									</div>
									<!-- End Relative Name -->
									<!-- /.form-group -->
									
									<!-- form group -->
									<!-- Dob -->
									<div class="form-group" id="divAccountFormDob">
										<label>Date of Birth:</label>

										<div class="input-group date">
											<div class="input-group-addon">
												<i class="fa fa-calendar"></i>
											</div>
											<input type="text" class="form-control pull-right"
												id="dob" name="dob"  />
										</div>
										<p id="errorDob"></p>
										<!-- /.input group -->
									</div>

									<!--End Dob -->
									<!-- /.form group -->
									<!-- Category -->
									<div class="form-group" id="divMemberFormCategory">
										<label>Gender</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa   fa-group"></i>
											</div>
											<select class="form-control select2" id="gender"
												name="gender" style="width: 100%;" >
												<option>N/A</option>
												<option>Male</option>
												<option>Female</option>
												<option>Others</option>
											</select>
										</div>
									</div>
									<!-- End Category -->
									<!-- /. form group -->
									
									<!--  form group -->
									<!-- Category -->
									<div class="form-group" id="divMemberFormCategory">
										<label>Category</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa   fa-group"></i>
											</div>
											<select class="form-control select2" id="category"
												name="category" style="width: 100%;" >
												<option>N/A</option>
												<option value="GEN">General</option>
												<option value="SC">Scheduled Caste(SC)</option>
												<option value="ST">Scheduled Tribe(ST)</option>
												<option value="OBC">Other Backward Classes(OBC)</option>
												<option value="Others">Others</option>
											</select>
										</div>
									</div>
									<!-- End Category -->
									<!-- /. form group -->

									<!--  form group -->
									<!-- Email -->
									<div class="form-group" id="divMemberFormEmail">
										<label>Email</label>
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-envelope"></i></span> <input type="email"
												class="form-control" placeholder="example@email.com"
												id="memberEmail" name="memberEmail" />
										</div>
										<p id="errorEmail"></p>
									</div>
									<!-- End Email -->
									<!-- /. form-group -->

									<!-- form group -->
									<!-- Occupation -->
									<div class="form-group" id="divMemberFormOccupation">
										<label>Occupation</label>
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-black-tie"></i></span> <input type="text"
												class="form-control" placeholder="Occupation"
												id="memberOccupation" name="memberOccupation">
										</div>
										<p id="errorOccupation"></p>
									</div>

									<!--End Occupation -->
									<!-- /.form group -->

									<!-- form group -->
									<!-- Phone -->
									<div class="form-group" id="divMemberFormPhone">
										<label> Phone Number:</label>
										<!-- .input group -->
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-mobile"></i>
											</div>
											<input type="text" class="form-control"
												data-inputmask='"mask": "(+91) 99999-99999"' data-mask
												id="memberPhone" name="memberPhone" placeholder="(+91) 99999-99999" />
										</div>
										<p id="errorPhone"></p>
										<!-- /.input group -->
									</div>
									<!-- End Phone -->
									<!-- /.form group -->
									
									<!-- form group -->
									
									
									<!-- /.form group -->

									<!-- form group -->

									<!-- /.form group -->

									<!-- form group -->

									<!-- /.form group -->

								</div>
								<!-- /.col -->
								<div class="col-md-6">

<!-- form group -->
									<!-- Upload Photo -->
									<div class="form-group" id="divMemberFormPhoto">
										<label for="exampleInputFile">Upload Photo</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-photo"></i>
											</div>
											<input type="file" id="memberPhoto" name="memberPhoto"
												class="btn btn-block btn-default btn" />
										</div>
										<p id="errorPhoto"></p>
									</div>
									<!-- End Upload Photo -->

									<!--  form-group -->
									<!-- Address Line 1 -->
									<div class="form-group" id="divMemberFormAddress1">
										<label>Address Line 1</label>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-home"></i></span>
											<input type="text" class="form-control"
												placeholder="Address Line 1" id="memberAddress1"
												name="memberAddress1" />
										</div>
										<p id="errorAddress1"></p>
									</div>
									<!-- End Address Line 1 -->
									<!-- /.form-group -->

									<!--  form-group -->
									<!-- Address Line 2 -->
									<div class="form-group" id="divMemberFormAddress2">
										<label>Address Line 2</label>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-home"></i></span>
											<input type="text" class="form-control"
												placeholder="Address Line 2" id="memberAddress2"
												name="memberAddress2" />
										</div>
										<p id="errorAddress2"></p>
									</div>
									<!-- End Address Line 2 -->
									<!-- /.form-group -->
									
									<!--  form-group -->
									<!-- City -->
									<div class="form-group" id="divMemberFormCity">
										<label>City</label>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
											<input type="text" class="form-control"
												placeholder="City" id="memberCity"
												name="memberCity" />
										</div>
										<p id="errorCity"></p>
									</div>
									<!-- End City -->
									<!-- /.form-group -->
									
									<!-- form group -->
									<!-- Address Proof -->
									<div class="form-group" id="divMemberFormAddressProof">
										<label>Address Proof Provided</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa   fa-building-o"></i>
											</div>
											<select class="form-control select2" id="addressProof"
												name="addressProof" style="width: 100%;" >
												<option>N/A</option>
												<option>Voter Id</option>
												<option>Driving License</option>
												<option>Passport</option>
												<option>PAN Card</option>
												<option>Ration Card</option>
											</select>
										</div>
									</div>
									<!-- End Address Proof -->
									<!-- /.form group -->
									<!--  form-group -->
									<!-- Nominee Name -->
									<div class="form-group" id="divMemberFormMother">
										<label>Mother's Name</label>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-user"></i></span>
											<input type="text" class="form-control"
												placeholder="Mother Name" id="memberMotherName"
												name="memberMotherName" />
										</div>
										<p id="errorMotherName"></p>
									</div>
									<!-- End Nominee Name -->
									<!-- /.form-group -->
									<!--  form-group -->
									<!-- Nominee Name -->
									<div class="form-group" id="divMemberFormNominee">
										<label>Nominee Name</label>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-user"></i></span>
											<input type="text" class="form-control"
												placeholder="Full Name" id="memberNomineeName"
												name="memberNomineeName" />
										</div>
										<p id="errorNomineeName"></p>
									</div>
									<!-- End Nominee Name -->
									<!-- /.form-group -->
									
									<!--  form-group -->
									<!-- Nominee Relation -->
									<div class="form-group" id="divMemberFormNomineeRelation">
										<label>Relationship with Nominee</label>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-exchange"></i></span>
											<input type="text" class="form-control"
												placeholder="Relationship" id="memberNomineeRelation"
												name="memberNomineeRelation" />
										</div>
										<p id="errorNomineeRelation"></p>
									</div>
									<!-- End Nominee Relation -->
									<!-- /.form-group -->
									
								
									<!-- /.form group -->

									<input type="hidden" class="form-control"
												 id="operation" name="operation" value = "create"/>


									<!-- form group -->


									<!-- /.form group -->

									<!--  form group -->

									<!-- /. form group -->

									<!-- form group -->
									<br>
									<div class="col-xs-4" align="center">
										<button type="submit"
											class="btn btn-primary btn-block btn-flat">Register</button>
									</div>
									<div class="col-xs-4" align="center">
										<button type="reset" class="btn btn-block btn-danger">Cancel</button>
									</div>

									<!-- / .form group -->
								</div>
								<!-- /.box-body -->
							</div>
							<!-- /.box -->
						</div>
						<!-- /.col -->
					</form>

					<!-- User Form -->

					<!-- /.box-body -->
					<div class="box-footer">Provide the Member Detail For Registration</div>
					<!-- /.box-footer-->
				</div>
				<!-- /.box -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<%@ include file="../design/Footer.jsp"%>
		<!-- Control Sidebar -->
		<jsp:include page="../design/SideBar.jsp" flush="true" />
	</div>
	<!-- ./wrapper -->
	<%@ include file="../design/Bottom.jsp"%>
	<!-- date-picker -->
	<script src="../../plugins/datepicker/bootstrap-datepicker.js"></script>
	<!-- select2 -->
	<script src="../../plugins/select2/select2.js"></script>
	<!-- iCheck -->
	<!-- jQuery 2.2.3 -->
	<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>

	<script>
	<c:choose>
	<c:when test="${param.msg=='1'}">
	$(document).ready(function() {
		$("#typeError").addClass("form-group has-success");
		$("#errorTop")
		.html(
				"Record Added Successfully.");
	});
	</c:when>
	<c:when test="${param.msg=='2'}">
	$(document).ready(function() {
		$("#typeError").addClass("form-group has-error");
		$("#errorTop")
		.html(
				"Fail to Add Record.");
	});
	</c:when>
	</c:choose>
		function validateForm(form) {
			error = "Please fill this field .";

			//Full Name Validation
			var name = document.getElementById("memberFullName").value;
			if (name == null || name === "") {
				document.getElementById("errorFullName").innerHTML = error;
				document.getElementById("divMemberFormName").className = 'alert alert-danger alert-dismissible';
				return false;
			}

			if (!(name == null || name === "")) {
				var nameValid = /^[a-zA-Z-. ]+$/;
				if (!nameValid.test(name)) {
					document.getElementById("errorFullName").innerHTML = 'Invalid Name';
					document.getElementById("divMemberFormName").className = 'alert alert-danger alert-dismissible';
					return false;
				}
				document.getElementById("errorFullName").innerHTML = "";
				document.getElementById("divMemberFormName").className = 'form-group has-success';
			}

			//End Full Name Validation
			
			//Relative Name Validation
			//var name = document.getElementById("relativeFullName").value;
			
			//if (!(name == null || name === "")) {
			//	var nameValid = /^[a-zA-Z-. ]+$/;
			//	if (!nameValid.test(name)) {
			//		document.getElementById("errorRelativeName").innerHTML = 'Invalid Name';
			//		document.getElementById("divMemberFormRelativeName").className = 'alert alert-danger alert-dismissible';
			//		return false;
			//	}
			//	document.getElementById("errorRelativeName").innerHTML = "";
			//	document.getElementById("divMemberFormRelativeName").className = 'form-group has-success';
			//}

			//End Relative Name Validation

			//Email Validation
			//var email = document.getElementById("memberEmail").value;


			//if (!(email == null || email === "")) {
			//	var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;

			//	if (!emailReg.test(email)) {
			//		document.getElementById("errorEmail").innerHTML = "Invaild Email Id ";
			//		document.getElementById("divMemberFormEmail").className = 'alert alert-warning alert-dismissible';
			//		return false;
			//	}
			//	document.getElementById("errorEmail").innerHTML = "";
			//	document.getElementById("divMemberFormEmail").className = 'form-group has-success';
			//}
			//End Email Validation

			//Occupation Validation
			//var desig = document.getElementById("memberOccupation").value;
			//if (desig == null || desig === "") {
			//	document.getElementById("errorOccupation").innerHTML = error;
			//	document.getElementById("divMemberFormOccupation").className = 'alert alert-danger alert-dismissible';
			//	return false;

			//}
			//document.getElementById("errorOccupation").innerHTML = "";
			//document.getElementById("divMemberFormOccupation").className = 'form-group has-success';
			//End Occupation Validation

			//Phone Validation
			//var phone = document.getElementById("memberPhone").value;
			

			//if (!(phone == null || phone === "")) {
			//	var phoneno = /^\d{10}$/;
			//	if (!(phone.match(phoneno))) {
			//		document.getElementById("errorPhone").innerHTML = "Invalid Phone Number";
			//		document.getElementById("divMemberFormPhone").className = 'alert alert-warning alert-dismissible';
			//		return false;
			//	}
			//	document.getElementById("errorPhone").innerHTML = "";
			//	document.getElementById("divMemberFormPhone").className = 'form-group has-success';
			//}
			//End Phone Validation
			
			
			
			//Address 1 Validation
			var desig = document.getElementById("memberAddress1").value;
			if (desig == null || desig == "") {
				document.getElementById("errorAddress1").innerHTML = error;
				document.getElementById("divMemberFormAddress1").className = 'alert alert-danger alert-dismissible';
				return false;

			}
			document.getElementById("errorAddress1").innerHTML = "";
			document.getElementById("divMemberFormAddress1").className = 'form-group has-success';
			//End Address 1 Validation
			
			//Address 2 Validation
			//var desig = document.getElementById("memberAddress2").value;
			//if (desig == null || desig == "") {
			//	document.getElementById("errorAddress2").innerHTML = error;
			//	document.getElementById("divMemberFormAddress2").className = 'alert alert-danger alert-dismissible';
			//	return false;

			//}
			//document.getElementById("errorAddress2").innerHTML = "";
			//document.getElementById("divMemberFormAddress2").className = 'form-group has-success';
			//End Address 2 Validation
			
			//City Validation
			var desig = document.getElementById("memberCity").value;
			if (desig == null || desig == "") {
				document.getElementById("errorCity").innerHTML = error;
				document.getElementById("divMemberFormCity").className = 'alert alert-danger alert-dismissible';
				return false;

			}
			document.getElementById("errorCity").innerHTML = "";
			document.getElementById("divMemberFormCity").className = 'form-group has-success';
			//End City Validation
			
			//Nominee Name Validation
			//var name = document.getElementById("memberNomineeName").value;
			

			//if (!(name == null || name === "")) {
			//	var nameValid = /^[a-zA-Z-. ]+$/;
			//	if (!nameValid.test(name)) {
			//		document.getElementById("errorNomineeName").innerHTML = 'Invalid Name';
			//		document.getElementById("divMemberFormNominee").className = 'alert alert-danger alert-dismissible';
			//		return false;
			//	}
			//	document.getElementById("errorNomineeName").innerHTML = "";
			//	document.getElementById("divMemberFormNominee").className = 'form-group has-success';
			//}

			//End Nominee Name Validation
			
			//Nominee Relation Validation
			//var desig = document.getElementById("memberNomineeRelation").value;
			//if (desig == null || desig === "") {
			//	document.getElementById("errorNomineeRelation").innerHTML = error;
			//	document.getElementById("divMemberFormNomineeRelation").className = 'alert alert-danger alert-dismissible';
			//	return false;
//
			//}
			//document.getElementById("errorNomineeRelation").innerHTML = "";
			//document.getElementById("divMemberFormNomineeRelation").className = 'form-group has-success';
			//End Nominee Relation Validation
			
			
			return true;
		}
		$(function() {
			//Initialize Select2 Elements
			$(".select2").select2();

			//Date picker
			$('#dob').datepicker({
				format : 'dd/mm/yyyy',
				autoclose : true
			});
			$('#dor').datepicker({
				format : 'dd/mm/yyyy',
				autoclose : true
			});

		});
	</script>