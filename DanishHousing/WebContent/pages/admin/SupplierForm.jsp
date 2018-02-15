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
						method="post" onsubmit="return validateForm(this)">
						<div class="box-body">
							<div class="row">
								<div class="col-md-6">

									<!--  form-group -->
									<!-- Supplier Name -->
									<div class="form-group" id="divSupplierFormName">
										<label>Supplier Name</label>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-bank "></i></span>
											<input type="text" class="form-control"
												placeholder="Name of Supplier" id="supplierName"
												name="supplierName" />
										</div>
										<p id="errorSupplierName"></p>
									</div>
									<!-- End Supplier Name -->
									<!-- /.form-group -->


									<!--  form group -->
									<!-- Address Line 1 -->
									<div class="form-group" id="divSupplierFormAddress1">
										<label>Address Line 1</label>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-home"></i></span>
											<input type="text" class="form-control"
												placeholder="Address Line 1" id="supplierAddress1"
												name="supplierAddress1" />
										</div>
										<p id="errorSupplierAddress1"></p>
									</div>
									<!-- End Address Line 1 -->
									<!-- /.form-group -->

									<!--  form-group -->
									<!-- Address Line 2 -->
									<div class="form-group" id="divSupplierFormAddress2">
										<label>Address Line 2</label>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-home"></i></span>
											<input type="text" class="form-control"
												placeholder="Address Line 2" id="supplierAddress2"
												name="supplierAddress2" />
										</div>
										<p id="errorSupplierAddress2"></p>
									</div>
									<!-- End Address Line 2 -->
									<!-- /.form-group -->

									<!--  form-group -->
									<div class="form-group" id="divSupplierFormCity">
										<label>City</label>
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-map-marker"></i></span> <input type="text"
												class="form-control" placeholder="City" id="supplierCity"
												name="supplierCity" />
										</div>
										<p id="errorCity"></p>
									</div>
									<!-- End City -->
									<!-- /.form-group -->

									<!-- form group -->
									<input type="hidden" class="form-control" id="operation"
										name="operation" value="create" />
									<!-- /.form group -->

									<!-- form group -->

									<!-- /.form group -->

								</div>
								<!-- /.col -->
								<div class="col-md-6">



									<!-- Opening Balance -->
									<div class="form-group" id="divSupplierFormBalance">
										<label>Balance</label>
										<div class="input-group">
											<span class="input-group-addon"> <i class="fa  fa-inr"></i></span>
											<input type="text" class="form-control" id="balance"
												name="balance" />
										</div>
										<p id="errorBalance"></p>
									</div>
									<!-- End Opening Balance -->
									<!-- /.form group -->



									<!-- form group -->
									<!-- Opening Date -->
									<div class="form-group" id="divSupplierFormDate">
										<label>Balance Date :</label>

										<div class="input-group date">
											<div class="input-group-addon">
												<i class="fa fa-calendar"></i>
											</div>
											<input type="text" class="form-control pull-right" id="balDt"
												name="balDt" />
										</div>
										<p id="errorBalanceDate"></p>
										<!-- /.input group -->
									</div>

									<!--End Opening Date -->
									<!-- /.form group -->
									<!-- form group -->
									<!-- PAN -->
									<div class="form-group" id="divSupplierFormPAN">
										<label> PAN Number:</label>
										<!-- .input group -->
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-credit-card"></i>
											</div>
											<input type="text" class="form-control" id="supplierPAN"
												name="supplierPAN" placeholder=" PAN number" />

										</div>
										<p id="errorPAN"></p>
										<!-- /.input group -->
									</div>
									<!-- End PAN -->
									<!-- /.form group -->
									<!-- form group -->
									<!-- GST -->
									<div class="form-group" id="divSupplierFormGST">
										<label> GST Number:</label>
										<!-- .input group -->
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-credit-card"></i>
											</div>
											<input type="text" class="form-control" id="supplierGST"
												name="supplierGST" placeholder=" GST number" />
										</div>
										<p id="errorGST"></p>
										<!-- /.input group -->
									</div>
									<!-- End PAN -->
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
					<div class="box-footer">Provide the Details For adding new
						account</div>
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
		function validateForm(form) {
			error = "Please fill this field .";

			//Supplier Name Validation
			var name = document.getElementById("supplierName").value;
			if (name == null || name === "") {
				document.getElementById("errorSupplierName").innerHTML = error;
				document.getElementById("divSupplierFormName").className = 'alert alert-danger alert-dismissible';
				return false;
			}

			//	if (!(name == null || name === "")) {
			//		var nameValid = /^[a-zA-Z ]+$/;
			//		if (!name.match(nameValid)) {
			//			document.getElementById("errorSupplierName").innerHTML = 'Invalid Name';
			//			document.getElementById("divSupplierFormBankName").className = 'alert alert-warning alert-dismissible';
			//			return false;
			//		}
			document.getElementById("errorSupplierName").innerHTML = "";
			document.getElementById("divSupplierFormName").className = 'form-group has-success';
			//}

			//End Supplier Name Validation

			//Supplier Address 1 Validation
			var name = document.getElementById("supplierAddress1").value;
			if (name == null || name === "") {
				document.getElementById("errorSupplierAddress1").innerHTML = error;
				document.getElementById("divSupplierFormAddress1").className = 'alert alert-danger alert-dismissible';
				return false;
			}

			document.getElementById("errorSupplierAddress1").innerHTML = "";
			document.getElementById("divSupplierFormAddress1").className = 'form-group has-success';

			//End Supplier Name Validation

			//Supplier City Validation
			var name = document.getElementById("supplierCity").value;
			if (name == null || name === "") {
				document.getElementById("errorCity").innerHTML = error;
				document.getElementById("divSupplierFormCity").className = 'alert alert-danger alert-dismissible';
				return false;
			}

			document.getElementById("errorCity").innerHTML = "";
			document.getElementById("divSupplierFormCity").className = 'form-group has-success';

			//End City Validation

<!--			
			//Supplier Balance Validation

			var bal = document.getElementById("balance").value;
			if (bal == null || bal === "") {
				document.getElementById("errorBalance").innerHTML = error;
				document.getElementById("divSupplierFormBalance").className = 'alert alert-danger alert-dismissible';
				return false;
			}
			if (!(bal == null || bal === "")) {
				var balanceValid = /^\d+(\.\d+)?$/;
				if (!(bal.match(balanceValid))) {
					document.getElementById("errorBalance").innerHTML = "Invalid amount";
					document.getElementById("divSupplierFormBalance").className = 'alert alert-warning alert-dismissible';
					return false;
				}
				document.getElementById("errorBalance").innerHTML = "";
				document.getElementById("divSupplierFormBalance").className = 'form-group has-success';

			}
			//End Balance Validation

			//Bal Date Validation
			var baldte = document.getElementById("balDt").value;
			//document.getElementById("errorUserDateOfBirth").innerHTML = 'vALUE = ' + dob;
			if (baldte == null || baldte === "") {
				document.getElementById("errorBalanceDate").innerHTML = error;
				document.getElementById("divSupplierFormDate").className = 'alert alert-danger alert-dismissible';
				return false;
			}
			document.getElementById("errorBalanceDate").innerHTML = "";
			document.getElementById("divSupplierFormDate").className = 'form-group has-success';
			//Bal Date Validation

			//Supplier PAN Validation
			var name = document.getElementById("supplierPAN").value;
			if (name == null || name === "") {
				document.getElementById("errorPAN").innerHTML = error;
				document.getElementById("divSupplierFormPAN").className = 'alert alert-danger alert-dismissible';
				return false;
			}

			document.getElementById("errorPAN").innerHTML = "";
			document.getElementById("divSupplierFormPAN").className = 'form-group has-success';

			//End PAN Validation

			//Supplier GST Validation
			var name = document.getElementById("supplierGST").value;
			if (name == null || name === "") {
				document.getElementById("errorGST").innerHTML = error;
				document.getElementById("divSupplierFormGST").className = 'alert alert-danger alert-dismissible';
				return false;
			}

			document.getElementById("errorGST").innerHTML = "";
			document.getElementById("divSupplierFormGST").className = 'form-group has-success';

			//End GST Validation
-->
			return true;
		}

		$(function() {
			//Date picker
			$('#balDt').datepicker({
				format : 'dd/mm/yyyy',
				autoclose : true
			});

		});
	</script>