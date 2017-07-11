<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Date Range Picker -->

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
				<h1>Account Master View</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Master Data</a></li>
					<li class="active">Account Master View</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<!-- Default box -->
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">Account Master View Form</h3>
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
						action="${pageContext.request.contextPath}/admin/pages/MasterAccountFormController"
						method="post" name="accountMasterEditForm"
						id="accountMasterEditForm" onsubmit="return validateForm(this)">
						<div class="box-body">
							<div class="row">
								<div class="col-md-6">

									<!--  form-group -->
									<!-- Full Name -->
									<div class="form-group" id="divAccountCode">
										<label>Account Code</label>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-bars"></i></span>
											<input type="text" class="form-control"
												placeholder="Account Code" id="accountCode"
												name="accountCode" />
										</div>
										<p id="errorAccountCode"></p>
									</div>
									<!-- End Account Code -->
									<!-- /.form-group -->

									<!--  form-group -->
									<!-- ANX Code -->
									<div class="form-group" id="divAnxCode">
										<label>ANX Code</label>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-bars"></i></span>
											<input type="text" class="form-control"
												placeholder="ANX Code" id="anxCode" name="anxCode" />
										</div>
										<p id="errorAnxCode"></p>
									</div>
									<!-- End ANX Code -->
									<!-- /.form-group -->


									<!--  form group -->
									<div class="form-group" id="divAccountName">
										<label>Account Name</label>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-user"></i></span>
											<input type="text" class="form-control"
												placeholder="account Name" id="accountName"
												name="accountName" />
										</div>
										<p id="errorAccountName"></p>
									</div>
									<!-- /. form-group -->

									<div class="form-group" id="divAccountClass">
										<label>Account Class</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa  fa-list-ul"></i>
											</div>
											<select class="form-control select2" id="accountClass"
												name="accountClass" style="width: 100%;">
												<option selected="selected" value="A">Assets</option>
												<option value="I">Income</option>
												<option value="L">Liability</option>
												<option value="E">Extended</option>
											</select>
										</div>
									</div>
									<!--  form-group -->
									<div class="form-group" id="divFlag">
										<label>Flag</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa  fa-flag"></i>
											</div>
											<select class="form-control select2" id="flag" name="flag"
												style="width: 100%;">
												<option selected="selected" value="D">D</option>
												<option value="P">P</option>
												<option value="S">S</option>
												<option value="O">O</option>
												<option value="W">W</option>
												<option value="M">M</option>
											</select>
										</div>
									</div>

									<!-- /.form-group -->


									<!--  form-group -->
									<!-- Project Code -->
									<div class="form-group" id="divProjectCode">
										<label>Project Code</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa  fa-bars"></i>
											</div>
											<select class="form-control select2" id="projectCode"
												name="projectCode" style="width: 100%;">
												<option selected="selected">0</option>
												<option>1</option>
												<option>2</option>
												<option>3</option>
											</select>
										</div>
									</div>

									<!-- End Project Code -->
									<!-- /.form-group -->
















									<!--  form-group -->
									<!-- IXPGE -->
									<div class="form-group" id="divIxpge">
										<label>IXPGE</label>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-bars"></i></span>
											<input type="text" class="form-control" placeholder="IXPGE"
												id="ixpge" name="ixpge" />
										</div>
										<p id="errorIxpge"></p>
									</div>
									<!-- End IXPGE -->
									<!-- /.form-group -->



								</div>
								<!-- /.col -->
								<div class="col-md-6">



									<!--  form-group -->

									<!-- Address-->
									<div class="form-group" id="divAddress">
										<label>Address</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-map-marker"></i>
											</div>
											<textarea class="form-control" rows="8"
												placeholder="Enter your Address" id="address" name="address"></textarea>
										</div>
										<p id="errorAddress"></p>
										 </div>
										<!-- End Address -->

										<!-- /.form group -->

										<br>



										<!-- Opening Date -->
										<div class="form-group" id="divAccountFormDate">
											<label>Opening Date :</label>

											<div class="input-group date">
												<div class="input-group-addon">
													<i class="fa fa-calendar"></i>
												</div>
												<input type="text" class="form-control pull-right"
													id="datepicker" name="datepicker"  />
											</div>
											<p id="errorOpeningDate"></p>
											<!-- /.input group -->
										</div>

										<!--End Opening Date -->
										<!-- /.form group -->



										<!-- form group -->
										<!-- Opening Balance -->
										<div class="form-group" id="divAccountFormBalance">
											<label>Opening Balance</label>
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="fa  fa-inr"></i></span> <input type="text"
													class="form-control" id="openingBalance"
													name="openingBalance" />
											</div>
											<p id="errorOpeningBalance"></p>
										</div>
										<!-- End Opening Balance -->
										<!-- /.form group -->



										<!-- form group -->
										<!-- Minimum Balance -->
										<div class="form-group" id="divAccountFormMBalance">
											<label>Minimum Balance</label>
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="fa  fa-inr"></i></span> <input type="text"
													class="form-control" id="minimumBalance"
													name="minimumBalance" />
											</div>
											<p id="errorMinimumBalance"></p>
										</div>
										<!-- End Minimum Balance -->
										<!-- /.form group -->


										<!-- form group -->
										<!-- pexp -->
										<div class="form-group" id="divAccountFormPexp">
											<label>Pexp</label>
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="fa  fa-bars"></i></span> <input type="text"
													class="form-control" id="pexp" name="pexp" />
											</div>
											<p id="errorPexp"></p>
										</div>
										<!-- End Pexp -->
										<!-- /.form group -->




										<!-- /.form group -->
										<input type="hidden" class="form-control" id="operation"
											name="operation" value="create" />

										<!--  form group -->

										<!-- /. form group -->

										<!-- form group -->
										<br>
										<div class="col-xs-4" align="center">
											<button type="button" id="editbtn" value="edit"
												name="editbtn" onclick="editfxn();"
												class="btn btn-primary btn-block btn-flat">Edit</button>
										</div>
										<div class="col-xs-4" align="center">
											<button type="reset" class="btn btn-block btn-danger"
												value="cancel" name="cancel" id="cancel">Cancel</button>
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
					<div class="box-footer">Detail</div>
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
	<script src="../../plugins/datepicker/bootstrap-datepicker.js"></script>
	<!-- iCheck -->
	<!-- jQuery 2.2.3 -->
	<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>

	<script>
		<c:choose>
		<c:when test="${param.msg=='1'}">
		$(document).ready(function() {
			$("#typeError").addClass("form-group has-error");
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
			var form = document.getElementById("accountMasterEditForm");
			var elements = form.elements;
			for (var i = 0, len = elements.length; i < len; ++i) {
				elements[i].disabled = true;
			}
			document.getElementById("editbtn").disabled = false;
			document.getElementById("cancel").disabled = false;
		}

		function editfxn() {
			if (document.getElementById("editbtn").value == "edit") {
				document.getElementById("editbtn").innerHTML = "Update";
				document.getElementById("editbtn").value = "update";
				var form = document.getElementById("accountMasterEditForm");
				var elements = form.elements;

				for (var i = 0, len = elements.length; i < len; ++i) {
					elements[i].disabled = false;
				}
			} else if (document.getElementById("editbtn").value == "update"
					&& validateForm(form)) {
				document.accountMasterEditForm.submit();
			}

		}

		function validateForm(form) {
			error = "Please fill this field .";

			//Account Code Validation
			var acc = document.getElementById("accountCode").value;
			if (acc == null || acc === "") {
				document.getElementById("errorAccountCode").innerHTML = error;
				document.getElementById("divAccountCode").className = 'alert alert-danger alert-dismissible';
				return false;
			}
			document.getElementById("errorAccountCode").innerHTML = "";
			document.getElementById("divAccountCode").className = 'form-group has-success';
			//End Account Code Validation

			//ANX Code Validation
			var anxCd = document.getElementById("anxCode").value;
			if (anxCd == null || anxCd === "") {
				document.getElementById("errorAnxCode").innerHTML = error;
				document.getElementById("divAnxCode").className = 'alert alert-danger alert-dismissible';
				return false;
			}
			if (!(anxCd == null || anxCd === "")) {
				var namValid = /^\d+$/;
				if (!namValid.test(anxCd)) {
					document.getElementById("errorAnxCode").innerHTML = 'Invalid Anx Code';
					document.getElementById("divAnxCode").className = 'alert alert-danger alert-dismissible';
					return false;
				}
				document.getElementById("errorAnxCode").innerHTML = "";
				document.getElementById("divAnxCode").className = 'form-group has-success';
			}
			//End ANX Code Validation

			//Account Name Validation
			var name = document.getElementById("accountName").value;
			if (name == null || name === "") {
				document.getElementById("errorAccountName").innerHTML = error;
				document.getElementById("divAccountName").className = 'alert alert-danger alert-dismissible';
				return false;
			}

			if (!(name == null || name === "")) {
				var nameValid = /^[a-zA-Z-.\d&()%]+$/;
				if (!nameValid.test(name)) {
					document.getElementById("errorAccountName").innerHTML = 'Invalid Account Name';
					document.getElementById("divAccountName").className = 'alert alert-danger alert-dismissible';
					return false;
				}
				document.getElementById("errorAccountName").innerHTML = "";
				document.getElementById("divAccountName").className = 'form-group has-success';
			}

			//End Account Name Validation

			//IXPGE Validation
			var ixpge = document.getElementById("ixpge").value;
			if (ixpge == null || ixpge === "") {
				document.getElementById("errorIxpge").innerHTML = error;
				document.getElementById("divIxpge").className = 'alert alert-danger alert-dismissible';
				return false;
			}
			document.getElementById("errorIxpge").innerHTML = "";
			document.getElementById("divIxpge").className = 'form-group has-success';
			//End IXPGE Validation

			//Address Validation
			var add = document.getElementById("address").value;
			if (add == null || add === "") {
				document.getElementById("errorAddress").innerHTML = error;
				document.getElementById("divAddress").className = 'alert alert-danger alert-dismissible';
				return false;

			}
			document.getElementById("errorAddress").innerHTML = "";
			document.getElementById("divAddress").className = 'form-group has-success';
			//End Address Validation


			//Opening Balance Validation
			var bal = document.getElementById("openingBalance").value;

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

			//Minimum Balance Validation
			var mBal = document.getElementById("minimumBalance").value;

			if (!(mBal == null || mBal === "")) {
				var balanceValid = /^\d+(\.\d+)?$/;
				if (!(mBal.match(balanceValid))) {
					document.getElementById("errorMinimumBalance").innerHTML = "Invalid Amount";
					document.getElementById("divAccountFormMBalance").className = 'alert alert-warning alert-dismissible';
					return false;
				}
				document.getElementById("errorMinimumBalance").innerHTML = "";
				document.getElementById("divAccountFormMBalance").className = 'form-group has-success';
			}
			//End Minimum Balance Validation
			
			
			
			//PEXP Validation
	//		var pexp = document.getElementById("pexp").value;
	//		if (!(pexp == null || pexp === "")) {
	//			var balanceValid = /^[a-zA-Z-.\d&()%]+$/;									//which validation
	//			if (!(pexp.match(balanceValid))) {
	//				document.getElementById("errorPexp").innerHTML = "Invalid Amount";
	//				document.getElementById("divAccountFormPexp").className = 'alert alert-warning alert-dismissible';
	//				return false;
	//			}
	//			document.getElementById("errorPexp").innerHTML = "";
	//			document.getElementById("divAccountFormPexp").className = 'form-group has-success';
	//		}
			//End PEXP Validation

			return true;
		}

		$(function() {
			$('#datepicker').datepicker({
				format : 'dd/mm/yyyy',
				autoclose : true
			});

		});
	</script>