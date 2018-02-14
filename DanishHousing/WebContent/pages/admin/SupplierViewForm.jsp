<!-- daterange picker -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="../../plugins/datepicker/datepicker3.css">
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
				<h1>Supplier</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Master Data</a></li>
					<li class="active">Supplier</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<!-- Default box -->
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">Add Supplier Form</h3>
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
					<form
						action="${pageContext.request.contextPath}/admin/pages/SupplierFormController"
						name="supplierEditForm" id="supplierEditForm" method="post"
						onsubmit="return validateForm(this)">
						<div class="box-body">
							<div class="row">
								<div class="col-md-6">

									<!--  form-group -->
									<!-- Bank Name -->
									<div class="form-group" id="divAccountFormBankName">
										<label>Supplier Name</label>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-user "></i></span>
											<input type="text" class="form-control"
												placeholder="Name of Supplier" id="supplierName"
												name="supplierName" />
										</div>
										<p id="errorSupplierName"></p>
									</div>
									<!-- End Bank Name -->
									<!-- /.form-group -->


									<!--  form group -->
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
											<span class="input-group-addon"><i
												class="fa fa-map-marker"></i></span> <input type="text"
												class="form-control" placeholder="City" id="memberCity"
												name="memberCity" />
										</div>
										<p id="errorCity"></p>
									</div>
									<!-- End City -->
									<!-- /.form-group -->



									<!-- form group -->
									<input type="hidden" class="form-control" id="operation"
										name="operation" value="edit" />
									<!-- /.form group -->

									<!-- form group -->

									<!-- /.form group -->

								</div>
								<!-- /.col -->
								<div class="col-md-6">



									<!-- Opening Balance -->
									<div class="form-group" id="divAccountFormBalance">
										<label>Balance</label>
										<div class="input-group">
											<span class="input-group-addon"> <i class="fa  fa-inr"></i></span>
											<input type="text" class="form-control" id="openingBalance"
												name="openingBalance" />
										</div>
										<p id="errorOpeningBalance"></p>
									</div>
									<!-- End Opening Balance -->
									<!-- /.form group -->



									<!-- form group -->
									<!-- Opening Date -->
									<div class="form-group" id="divAccountFormDate">
										<label>Balance Date :</label>

										<div class="input-group date">
											<div class="input-group-addon">
												<i class="fa fa-calendar"></i>
											</div>
											<input type="text" class="form-control pull-right"
												id="datepicker" name="datepicker" />
										</div>
										<p id="errorOpeningDate"></p>
										<!-- /.input group -->
									</div>

									<!--End Opening Date -->
									<!-- /.form group -->
									<!-- PAN -->
									<div class="form-group" id="divMemberFormPAN">
										<label> PAN Number:</label>
										<!-- .input group -->
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-credit-card"></i>
											</div>
											<input type="text" class="form-control" id="memberPAN"
												name="memberPAN" placeholder=" PAN number" />

										</div>
										<p id="errorPAN"></p>
										<!-- /.input group -->
									</div>
									<!-- End PAN -->
									<!-- /.form group -->
									<!-- form group -->
									<!-- GST -->
									<div class="form-group" id="divMemberFormPAN">
										<label> GST Number:</label>
										<!-- .input group -->
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-credit-card"></i>
											</div>
											<input type="text" class="form-control" id="memberGST"
												name="memberGST" placeholder=" GST number" />
										</div>
										<p id="errorGST"></p>
										<!-- /.input group -->
									</div>
									<!-- End PAN -->
									<!-- /.form group -->
									<!-- form group -->


									<!-- /.form group -->

									<!--  form group -->

									<!-- /. form group -->

									<!-- form group -->
									<br>
								</div>
								<div class="row">
									<div class="col-md-6"></div>
									<div class="col-md-6">
										<div class="col-xs-4" align="center">
											<button type="button" id="editbtn" value="edit"
												name="editbtn" onclick="editfxn();"
												class="btn btn-primary btn-block btn-flat">Edit</button>
										</div>
										<div class="col-xs-1" ></div>
										<div class="col-xs-4" align="center">
											<button type="reset" value="cancel" name="cancel" id="cancel"
												class="btn btn-block btn-danger">Cancel</button>
										</div>
									</div>
								</div>
								<!-- / .form group -->
							</div>
							<!-- /.box-body -->

							<!-- /.box -->
						</div>
						<!-- /.col -->
					</form>

					<!-- User Form -->

					<!-- /.box-body -->
					<div class="box-footer">Provide the Details For editing
						Supplier</div>
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
	<!-- jQuery 2.2.3 -->
	<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>

	<script>
		<c:choose>
		<c:when test="${param.msg=='1'}">
		$(document).ready(function() {
			$("#typeError").addClass("form-group has-success");
			$("#errorTop").html("Record Added Successfully.");
		});
		</c:when>
		<c:when test="${param.msg=='2'}">
		$(document).ready(function() {
			$("#typeError").addClass("form-group has-error");
			$("#errorTop").html("Fail to Add Record.");
		});
		</c:when>
		</c:choose>

		function formin() {
			var form = document.getElementById("supplierEditForm");
			var elements = form.elements;
			for (var i = 0, len = elements.length; i < len; ++i) {
				elements[i].disabled = true;
			}
			document.getElementById("editbtn").disabled = false;
			document.getElementById("cancel").disabled = false;
			//Set formatted date in input fields
			document.getElementById("balDate").value = document
					.getElementById("formattedDate1").innerHTML;

		}

		function editfxn() {
			if (document.getElementById("editbtn").value == "edit") {
				document.getElementById("editbtn").innerHTML = "Update";
				document.getElementById("editbtn").value = "update";
				var form = document.getElementById("supplierEditForm");
				var elements = form.elements;

				for (var i = 0, len = elements.length; i < len; ++i) {
					elements[i].disabled = false;
				}
			} else if (document.getElementById("editbtn").value == "update"
					&& validateForm(form)) {
				document.membershipEditForm.submit();
			}

		}
		function validateForm(form) {
			error = "Please fill this field .";

			//Bank Name Validation
			var name = document.getElementById("bankName").value;
			if (name == null || name === "") {
				document.getElementById("errorBankName").innerHTML = error;
				document.getElementById("divAccountFormBankName").className = 'alert alert-danger alert-dismissible';
				return false;
			}

			if (!(name == null || name === "")) {
				var nameValid = /^[a-zA-Z ]+$/;
				if (!name.match(nameValid)) {
					document.getElementById("errorFullName").innerHTML = 'Invalid Name';
					document.getElementById("divAccountFormBankName").className = 'alert alert-warning alert-dismissible';
					return false;
				}
				document.getElementById("errorBankName").innerHTML = "";
				document.getElementById("divAccountFormBankName").className = 'form-group has-success';
			}

			//End Bank Name Validation

			//Bank Code Validation
			var bankCode = document.getElementById("bankCode").value;
			if (bankCode == null || bankCode === "") {
				document.getElementById("errorBankCode").innerHTML = error;
				document.getElementById("divAccountFormBankCode").className = 'alert alert-danger alert-dismissible';
				return false;
			}

			if (!(bankCode == null || bankCode === "")) {
				var codeValid = /^[a-zA-Z0-9-]+$/;
				if (!codeValid.test(bankCode)) {
					document.getElementById("errorBankCode").innerHTML = "Invaild Bank Code ";
					document.getElementById("divAccountFormBankCode").className = 'alert alert-warning alert-dismissible';
					return false;
				}
				document.getElementById("errorBankCode").innerHTML = "";
				document.getElementById("divAccountFormBankCode").className = 'form-group has-success';
			}
			//End Bank Code Validation
	<%--
			
			//IFSC Code Validation
			var ifsc = document.getElementById("ifscCode").value;
			if (ifsc == null || ifsc === "") {
				document.getElementById("errorIfscCode").innerHTML = error;
				document.getElementById("divAccountFormIfsc").className = 'alert alert-danger alert-dismissible';
				return false;
			}

			if (!(ifsc == null || ifsc === "")) {
				var ifscValid = /^[a-zA-Z]+[0-9]+$/;
				if (!ifscValid.test(ifsc)) {
					document.getElementById("errorIfscCode").innerHTML = 'Please enter a valid IFSC Code';
					document.getElementById("divAccountFormIfsc").className = 'alert alert-warning alert-dismissible';
					return false;
				}
				document.getElementById("errorIfscCode").innerHTML = "";
				document.getElementById("divAccountFormIfsc").className = 'form-group has-success';
			}
			
			//End IFSC Code Validation

			//Branch Validation
			var branch = document.getElementById("branch").value;
			if (branch == null || branch === "") {
				document.getElementById("errorBranch").innerHTML = error;
				document.getElementById("divAccountFormBranch").className = 'alert alert-danger alert-dismissible';
				return false;
			}

			if (!(branch == null || branch === "")) {
				var branchValid = /^[\w, ]+$/;
				if (!(branch.match(branchValid))) {
					document.getElementById("errorBranch").innerHTML = "Invalid Branch Name";
					document.getElementById("divAccountFormBranch").className = 'alert alert-warning alert-dismissible';
					return false;
				}
				document.getElementById("errorBranch").innerHTML = "";
				document.getElementById("divAccountFormBranch").className = 'form-group has-success';
			}
			//End Branch Validation
			
			
			

			//Opening Balance Validation
			var bal = document.getElementById("openingBalance").value;
			if (bal == null || bal === "") {
				document.getElementById("errorOpeningBalance").innerHTML = error;
				document.getElementById("divAccountFormBalance").className = 'alert alert-danger alert-dismissible';
				return false;
			}
			if (!(bal == null || bal === "")) {
				var balanceValid = /^\d+(\.\d+)?$/;
				if (!(bal.match(balanceValid))) {
					document.getElementById("errorOpeningBalance").innerHTML = "Invalid Amount";
					document.getElementById("divAccountFormBalance").className = 'alert alert-warning alert-dismissible';
					return false;
				}
				document.getElementById("errorOpeningBalance").innerHTML = "";
				document.getElementById("divAccountFormBalance").className = 'form-group has-success';
			}
			//End Opening Balance Validation
			
			
			
			--%>
		//Opening Date Validation
			var opdte = document.getElementById("datepicker").value;
			//document.getElementById("errorUserDateOfBirth").innerHTML = 'vALUE = ' + dob;
			if (opdte == null || opdte === "") {
				document.getElementById("errorOpeningDate").innerHTML = error;
				document.getElementById("divAccountFormDate").className = 'alert alert-danger alert-dismissible';
				return false;
			}
			document.getElementById("errorOpeningDate").innerHTML = "";
			document.getElementById("divAccountFormDate").className = 'form-group has-success';
			//Opening Date Validation

			return true;
		}

		$(function() {
			//Date picker
			$('#datepicker').datepicker({
				format : 'dd/mm/yyyy',
				autoclose : true
			});

		});
	</script>