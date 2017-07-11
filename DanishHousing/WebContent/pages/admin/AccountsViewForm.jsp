<!-- daterange picker -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="../../plugins/datepicker/datepicker3.css">
<%@ include file="../design/Top.jsp"%>
<body class="hold-transition skin-blue sidebar-mini" onload = "formin();">
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
				<h1>Accounts View</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Master Data</a></li>
					<li class="active">Accounts View</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<!-- Default box -->
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">Accounts View Form</h3>
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
					<form action="${pageContext.request.contextPath}/admin/pages/AccountFormController" method="post" name="accountsEditForm" id ="accountsEditForm"
						onsubmit="return validateForm(this)">
						<div class="box-body">
							<div class="row">
								<div class="col-md-6">

									<!--  form-group -->
									<!-- Bank Name -->
									<div class="form-group" id="divAccountFormBankName">
										<label>Bank Name</label>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-bank "></i></span>
											<input type="text" class="form-control"
												placeholder="Name of Bank" id="bankName" name="bankName" />
										</div>
										<p id="errorBankName"></p>
									</div>
									<!-- End Bank Name -->
									<!-- /.form-group -->


									<!--  form group -->
									<!--  Bank Code -->
									<div class="form-group" id="divAccountFormBankCode">
										<label>Bank Code</label>
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa  fa-info-circle "></i></span> <input type="text"
												class="form-control" placeholder="Bank Code" id="bankCode"
												name="bankCode" />
										</div>
										<p id="errorBankCode"></p>
									</div>
									<!--  End Bank Code -->
									<!-- /. form-group -->


									<!--  form-group -->

									<!-- IFSC Code -->
									<div class="form-group" id="divAccountFormIfsc">
										<label>IFSC Code</label>
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa  fa-info-circle "></i></span> <input type="text"
												class="form-control" placeholder="IFSC Code of bank"
												id="ifscCode" name="ifscCode" />
										</div>
										<p id="errorIfscCode"></p>

									</div>

									<!-- End IFSC Code -->

									<!-- /.form-group -->

									<!-- form group -->
									<!-- Branch -->
									<div class="form-group" id="divAccountFormBranch">
										<label>Branch</label>
										<div class="input-group">
											<span class="input-group-addon">
												<i class="fa   fa-building-o"></i></span>
											<input type="text" class="form-control"
												placeholder="Name of Branch(e.g. Indrapuri)" id="branch"
												name="branch" />
										</div>
										<p id="errorBranch"></p>
									</div>
									<!-- End Branch -->
									<!-- /.form group -->
									
									<!-- form group -->
									<!-- Co_Code -->
									<div class="form-group" id="divAccountFormCoCode">
										<label>Co_Code</label>
										<div class="input-group">
											<span class="input-group-addon">
												<i class="fa   fa-info-circle"></i></span>
											<input type="text" class="form-control"
												placeholder="Code(e.g. 12)" id="coCode"
												name="coCode" />
										</div>
										<p id="errorCoCode"></p>
									</div>
									<!-- End Co_Code -->
									<!-- /.form group -->
									
									

									<!-- form group -->
									<input type="hidden" class="form-control"
												 id="operation" name="operation" value = "create"/>
									<!-- /.form group -->

									<!-- form group -->

									<!-- /.form group -->

								</div>
								<!-- /.col -->
								<div class="col-md-6">




									<!-- form group -->
									<!-- Opening Balance -->
									<div class="form-group" id="divAccountFormBalance">
										<label>Opening Balance</label>
										<div class="input-group">
											<span class="input-group-addon">
												<i class="fa  fa-inr"></i></span>
											<input type="text" class="form-control"
												 id="openingBalance" name="openingBalance" />
										</div>
										<p id="errorOpeningBalance"></p>
									</div>
									<!-- End Opening Balance -->
									<!-- /.form group -->
									
									

									<!-- form group -->
									<!-- Opening Date -->
									<div class="form-group" id="divAccountFormDate">
										<label>Opening Date :</label>

										<div class="input-group date">
											<div class="input-group-addon">
												<i class="fa fa-calendar"></i>
											</div>
											<input type="text" class="form-control pull-right"
												id="datepicker" name="datepicker" required="true" />
										</div>
										<p id="errorOpeningDate"></p>
										<!-- /.input group -->
									</div>

									<!--End Opening Date -->
									<!-- /.form group -->
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
										<!-- form group -->
									<!-- Closing Balance -->
									<div class="form-group" id="divAccountFormCBalance">
										<label>Closing Balance</label>
										<div class="input-group">
											<span class="input-group-addon">
												<i class="fa  fa-inr"></i></span>
											<input type="text" class="form-control"
												 id="closingBalance" name="closingBalance" />
										</div>
										<p id="errorCBalance"></p>
									</div>
									<!-- End Closing Balance -->
									<!-- /.form group -->

									
									
										<!-- form group -->
									<!-- Receipt -->
									<div class="form-group" id="divAccountFormReceipt">
										<label>Receipt</label>
										<div class="input-group">
											<span class="input-group-addon">
												<i class="fa  fa-bars"></i></span>
											<input type="text" class="form-control"
												 id="receipt" name="receipt" />
										</div>
										<p id="errorReceipt"></p>
									</div>
									<!-- End Receipt -->
									<!-- /.form group -->
									
									
									<!-- form group -->
									<!-- Payment -->
									<div class="form-group" id="divAccountFormPayment">
										<label>Payment</label>
										<div class="input-group">
											<span class="input-group-addon">
												<i class="fa  fa-inr"></i></span>
											<input type="text" class="form-control"
												 id="payment" name="payment" />
										</div>
										<p id="errorPayment"></p>
									</div>
									<!-- End Payment -->
									<!-- /.form group -->
									
									
									
									
									
									
									
									

									<!--  form group -->

									<!-- /. form group -->

									<!-- form group -->
									<br>
									<div class="col-xs-4" align="center">
										<button type="button" id="editbtn" value="edit" name="editbtn"
											onclick="editfxn();"
											class="btn btn-primary btn-block btn-flat">Edit</button>
									</div>
									<div class="col-xs-4" align="center">
										<button type="reset" class="btn btn-block btn-danger" name = "cancel" id="cancel">Cancel</button>
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
					<div class="box-footer">Account Details.</div>
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
		$("#typeError").addClass("form-group has-error");
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
	
	
	function formin(){
		var form = document.getElementById("accountsEditForm");
		var elements = form.elements;
		for (var i = 0, len = elements.length; i < len; ++i) {
		    elements[i].disabled = true;
		}
		document.getElementById("editbtn").disabled = false;
		document.getElementById("cancel").disabled = false;
	}
	
	function editfxn(){
		if(document.getElementById("editbtn").value == "edit"){
			document.getElementById("editbtn").innerHTML="Update";
			document.getElementById("editbtn").value="update";	
			var form = document.getElementById("accountsEditForm");
			var elements = form.elements;
			
			for (var i = 0, len = elements.length; i < len; ++i) {
			    elements[i].disabled = false;
			}
		}
		else if(document.getElementById("editbtn").value == "update" && validateForm(form)){
			document.accountsEditForm.submit();
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

			
			
			
			
			
			
			
			//Co_Code Validation
			var code = document.getElementById("coCode").value;
			if (code == null || code === "") {
				document.getElementById("errorCoCode").innerHTML = error;
				document.getElementById("divAccountFormCoCode").className = 'alert alert-danger alert-dismissible';
				return false;
			}
			if (!(code == null || code === "")) {
				var codeValid = /^[a-zA-Z-.\d ]+$/;  						 //  which validation
				if (!codeValid.test(code)) {
					document.getElementById("errorCoCode").innerHTML = 'Invalid Code';
					document.getElementById("divAccountFormCoCode").className = 'alert alert-danger alert-dismissible';
					return false;
				}
				document.getElementById("errorCoCode").innerHTML = "";
				document.getElementById("divAccountFormCoCode").className = 'form-group has-success';
			}
			//End Co_Code Validation
			
			
			
			
			
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
		
			
			
				
			//Opening Date Validation
			var dob = document.getElementById("datepicker").value;
			//document.getElementById("errorUserDateOfBirth").innerHTML = 'vALUE = ' + dob;
			if (dob == null || dob === "") {
				document.getElementById("errorOpeningDate").innerHTML = error;
				document.getElementById("divAccountFormDate").className = 'alert alert-danger alert-dismissible';
			return false;
			}
			document.getElementById("errorOpeningDate").innerHTML = "";
			document.getElementById("divAccountFormDate").className = 'form-group has-success';
			//Opening Date Validation
			
			
				
			
			
			
			//Closing Balance Validation
			var bal = document.getElementById("closingBalance").value;
			
			if (!(bal == null || bal === "")) {
				var balanceValid = /^\d+(\.\d+)?$/;
				if (!(bal.match(balanceValid))) {
					document.getElementById("errorCBalance").innerHTML = "Invalid Amount";
					document.getElementById("divAccountFormCBalance").className = 'alert alert-warning alert-dismissible';
					return false;
				}
				document.getElementById("errorCBalance").innerHTML = "";
				document.getElementById("divAccountFormCBalance").className = 'form-group has-success';
			}
			//End Closing Balance Validation
			
			
			
			
			//Closing Balance Validation
			var bal = document.getElementById("closingBalance").value;
			
			if (!(bal == null || bal === "")) {
				var balanceValid = /^\d+(\.\d+)?$/;
				if (!(bal.match(balanceValid))) {
					document.getElementById("errorCBalance").innerHTML = "Invalid Amount";
					document.getElementById("divAccountFormCBalance").className = 'alert alert-warning alert-dismissible';
					return false;
				}
				document.getElementById("errorCBalance").innerHTML = "";
				document.getElementById("divAccountFormCBalance").className = 'form-group has-success';
			}
			//End Closing Balance Validation
			
			
			
			//Receipt Validation
			var bal = document.getElementById("receipt").value;
			
			if (!(bal == null || bal === "")) {
				var balanceValid = /^\d+(\.\d+)?$/;
				if (!(bal.match(balanceValid))) {
					document.getElementById("errorReceipt").innerHTML = "Invalid Amount";
					document.getElementById("divAccountFormReceipt").className = 'alert alert-warning alert-dismissible';
					return false;
				}
				document.getElementById("errorReceipt").innerHTML = "";
				document.getElementById("divAccountFormReceipt").className = 'form-group has-success';
			}
			//End Receipt Validation
			
			
			
			//Payment Validation
			var bal = document.getElementById("payment").value;
			
			if (!(bal == null || bal === "")) {
				var balanceValid = /^\d+(\.\d+)?$/;
				if (!(bal.match(balanceValid))) {
					document.getElementById("errorPayment").innerHTML = "Invalid Amount";
					document.getElementById("divAccountFormPayment").className = 'alert alert-warning alert-dismissible';
					return false;
				}
				document.getElementById("errorPayment").innerHTML = "";
				document.getElementById("divAccountFormPayment").className = 'form-group has-success';
			}
			//End Payment Validation
			
			
			
			

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