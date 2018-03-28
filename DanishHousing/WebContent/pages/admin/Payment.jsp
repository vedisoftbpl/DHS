<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- daterange picker -->
<link rel="stylesheet" href="../../plugins/datepicker/datepicker3.css">
<!-- select style -->
<link rel="stylesheet" href="../../plugins/select2/select2.css">
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
				<h1>Payment</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Examples</a></li>
					<li class="active">Payment</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- Default box -->
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">Payment Form</h3>
						<div class="box-tools pull-right">
							<span id="today">${param.today}</span>
							<button type="button" class="btn btn-box-tool"
								data-widget="collapse" data-toggle="tooltip" title="Collapse">
								<i class="fa fa-minus"></i>
							</button>
						</div>
					</div>
					<div class="form-group" id="typeError">
						<label class="control-label" id="errorTop"></label>
					</div>

					<!-- User Form -->
					<form
						action="${pageContext.request.contextPath}/admin/pages/PaymentController"
						method="post" onsubmit="return validateForm(this)" id="form">
						<div class="box-body">

							<div class="row">
								<c:forEach var="ac" items="${sessionScope.accList}"
									varStatus="loop">
									<c:set var="counter" value="${loop.index}" />
									<c:if test="${counter < 6 }">
										<div class="col-md-2">
											<div class="box box-info box-solid"
												style="height: 120px; width: 160px;">
												<div class="box-header with-border"
													style="background-color: #3c8dbc; height: 75px;">
													<h3 class="box-title">${ac.key}</h3>

													<div class="box-tools pull-right">
														<button type="button" class="btn btn-box-tool"
															data-widget="collapse">
															<i class="fa fa-minus"></i>
														</button>
													</div>
													<!-- /.box-tools -->
												</div>
												<!-- /.box-header -->
												<div class="box-body" align="left">
													<span>Rs&nbsp;:&emsp;<fmt:formatNumber type="number"
															maxFractionDigits="3" value="${ac.value}" /></span>
												</div>
												<!-- /.box-body -->
											</div>
											<!-- /.box -->
										</div>
									</c:if>
								</c:forEach>
							</div>

							<div class="row">
								<c:forEach var="ac" items="${sessionScope.accList}"
									varStatus="loop">
									<c:set var="counter" value="${loop.count}" />
									<c:if test="${counter > 6 }">
										<div class="col-md-2">
											<div class="box box-info box-solid"
												style="height: 120px; width: 160px;">
												<div class="box-header with-border"
													style="background-color: #3c8dbc; height: 75px;">
													<h3 class="box-title">${ac.key}</h3>

													<div class="box-tools pull-right">
														<button type="button" class="btn btn-box-tool"
															data-widget="collapse">
															<i class="fa fa-minus"></i>
														</button>
													</div>
													<!-- /.box-tools -->
												</div>
												<!-- /.box-header -->
												<div class="box-body" align="left">
													<span>Rs&nbsp;:&emsp;<fmt:formatNumber type="number"
															maxFractionDigits="3" value="${ac.value}" /></span>
												</div>
												<!-- /.box-body -->
											</div>
											<!-- /.box -->
										</div>
									</c:if>
								</c:forEach>
							</div>
							<br>
							<div class="row">
								<!-- col -->

								<!-- col -->
								<div class="col-md-4">
									<!--  form group -->
									<!--  Receipt Number -->
									<div class="form-group" id="divFormVoucherNumber">
										<label>Voucher Number</label>
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa  fa-info-circle "></i></span> <input type="text"
												class="form-control" value="${param.voucherNo}"
												id="voucherNumber" name="voucherNumber" />
										</div>
										<p id="errorVoucherNumber"></p>
									</div>
									<!--  End Receipt Number -->
									<!-- /. form-group -->
								</div>
								<!-- /.col -->
								<!-- col -->
								<div class="col-md-4">
									<!-- form group -->
									<!-- Receipt Date -->
									<div class="form-group" id="divAccountFormDate">
										<label>Payment Date :</label>
										<div class="input-group date">
											<div class="input-group-addon">
												<i class="fa fa-calendar"></i>
											</div>
											<input type="text" class="form-control pull-right datepicker"
												id="date" name="date" required="required"
												value="${param.today}" />
										</div>
										<p id="errorReceiptDate"></p>
										<!-- /.input group -->
									</div>
									<!--End Receipt Date -->
									<!-- /.form group -->
								</div>
								<!-- /.col -->
							</div>
							<!-- /.row -->
							<!-- Row Default box -->

							<!-- /.Row Default box -->
							<!-- Row Default box -->
							<div class="row">
								<div class="box-header with-border">
									<h3 class="box-title">Account Details</h3>
									<div class="box-tools pull-right">
										<button id="addAccount" type="button" class="btn btn-box-tool">
											<i class="fa fa-plus"> Add More</i>
										</button>
									</div>
								</div>
								<input id="totalAccounts" name="totalAccounts" type="hidden"
									value="1">
								<div id="accounts" class="box-body">
									<div class="panel box box-primary">
										<div class="box-header with-border">
											<h4 class="box-title">Payment Account Details</h4>
											<div class="box-tools pull-right">
												<button type="button" class="btn btn-box-tool"
													data-widget="collapse" data-toggle="tooltip"
													title="Collapse">
													<i class="fa fa-minus"></i>
												</button>
												<button type="button" class="btn btn-box-tool"
													data-widget="remove"
													onclick="remove('accountCode1','amount1')"
													data-toggle="tooltip" title="Remove">
													<i class="fa fa-times"></i>
												</button>
											</div>
										</div>
										<div class="box-body">
											<div class="row">
												<div class="col-md-4">
													<!--  form-group -->
													<!-- Account Code -->
													<div class="form-group" id="divFormAccountCode1">
														<label>Account Code</label>
														<div class="input-group">
															<span class="input-group-addon"><i
																class="fa fa-info-circle"></i></span> <input type="text"
																class="form-control accCode" placeholder="Account Code"
																id="accountCode1" name="accountCode1" />
														</div>
														<p id="errorAccountCode1"></p>
													</div>
													<!-- End Account Code -->
													<!-- /.form-group -->

													<!--  form-group -->
													<!-- Party Code -->
													<div class="form-group" id="divFormPartyCode1"
														style="display: none;">
														<label>Party Code</label>
														<div class="input-group">
															<span class="input-group-addon"><i
																class="fa fa-info-circle"></i></span> <input type="text"
																class="form-control partyCode" placeholder="Party Code"
																id="partyCode1" name="partyCode1" />
														</div>
														<p id="errorPartyCode1"></p>
													</div>
													<!-- End Party Code -->
													<!-- /.form-group -->

													<!-- form group -->
													<!-- Amount -->
													<div class="form-group" id="divFormAmount1">
														<label>Amount</label>
														<div class="input-group">
															<span class="input-group-addon"><i
																class="fa fa-inr"></i></span> <input type="text"
																class="form-control accAmount" placeholder="0.00"
																value="0" id="amount1" name="amount1" />
														</div>
														<p id="errorAmount1"></p>
													</div>
													<!-- End Amount -->
													<!-- /.form group -->

												</div>
												<div class="col-md-8">

													<!--  form-group -->
													<!-- Account Name -->
													<div class="form-group" id="divFormAccountName1">
														<label>Account Name</label>
														<div class="input-group">
															<span class="input-group-addon"><i
																class="fa fa-bars"></i></span> <input type="text"
																class="form-control" placeholder="Account Name"
																id="accountName1" name="accountName1" />
														</div>
														<p id="errorAccountName1"></p>
													</div>
													<!-- End Account Name -->
													<!-- /.form-group -->

													<!--  form-group -->
													<!-- Account Name -->
													<div class="form-group" id="divFormPartyName1"
														style="display: none;">
														<label>Party Name</label>
														<div class="input-group">
															<span class="input-group-addon"><i
																class="fa fa-bars"></i></span> <input type="text"
																class="form-control" placeholder="Party Name"
																id="partyName1" name="partyName1" />
														</div>
														<p id="errorPartyName1"></p>
													</div>
													<!-- End Account Name -->
													<!-- /.form-group -->

													<!--  form-group -->
													<!-- Remarks -->
													<div class="form-group" id="divFormRemarks1">
														<label>Remarks</label>
														<div class="input-group">
															<span class="input-group-addon"><i
																class="fa fa-info"></i></span> <input type="text"
																class="form-control" placeholder="Remarks" id="remarks1"
																name="remarks1" />
														</div>
														<p id="errorRemarks1"></p>
													</div>
													<!-- End Remarks -->
													<!-- /.form-group -->

												</div>
												<!-- /.box-body -->
											</div>
										</div>
									</div>

								</div>
								<!-- /.box-body -->
							</div>
							<!-- /.Row Default box -->
							<!-- Row Default box -->
							<div class="row">
								<div class="box-header with-border">
									<h3 class="box-title">Transaction Details</h3>
								</div>
								<div class="box-body">
									<div class="row">
										<div class="col-md-4">
											<!--  form-group -->
											<!-- Bank Code -->
											<div class="form-group" id="divFormBankCode">
												<label>Bank Code</label>
												<div class="input-group">
													<span class="input-group-addon"><i
														class="fa fa-bars"></i></span> <input type="text"
														class="form-control" placeholder="Bank Code" id="bankCode"
														name="bankCode" />
												</div>
												<p id="errorBankCode"></p>
											</div>
											<!-- End Bank Code -->
											<!-- /.form-group -->

											<!-- form group -->
											<!-- Payment Mode -->
											<div class="form-group" id="divFormPaymentMode">
												<label>Payment Mode</label>
												<div class="input-group">
													<div class="input-group-addon">
														<i class="fa fa-check-circle"></i>
													</div>
													<div class="mode">
														<select class="form-control select2" id="paymentMode"
															name="paymentMode" style="width: 100%;"
															required="required">
															<option>Cash</option>
															<option>Cheque</option>
															<option>Demand Draft</option>
															<option>RTGS</option>
															<option>NEFT</option>
														</select>
													</div>
												</div>
											</div>
											<!-- End Payment Mode -->
											<!-- /.form group -->

											<!--  form-group -->
											<!-- Payment Mode -->
											<div class="form-group" id="divFormTotalAmount">
												<label>Total Amount</label>
												<div class="input-group">
													<span class="input-group-addon"><i class="fa fa-inr"></i></span>
													<input type="text" class="form-control" placeholder="0.00"
														id="totalAmount" name="totalAmount" value="0" />
												</div>
												<p id="errorTotalAmount"></p>
											</div>
											<!-- End Total Amount -->
											<!-- /.form-group -->


										</div>
										<div class="col-md-8">

											<!--  form-group -->
											<!-- Bank Name -->
											<div class="form-group" id="divFormBankName">
												<label>Bank Name</label>
												<div class="input-group">
													<span class="input-group-addon"><i
														class="fa fa-info-circle"></i></span> <input type="text"
														class="form-control" placeholder="Bank Name" id="bankName"
														name="bankName" />
												</div>
												<p id="errorbankName"></p>
											</div>
											<!-- End Bank Name -->
											<!-- /.form-group -->

											<!--  form-group -->
											<!-- Transction ID -->
											<div class="form-group" id="divFormTransctionID">
												<label>Payment Transaction ID</label>
												<div class="input-group">
													<span class="input-group-addon"><i
														class="fa fa-credit-card"></i></span> <input type="text"
														class="form-control" placeholder="Cheque/DD number"
														id="transactionID" name="transactionID" />
												</div>
												<p id="errorTransctionID"></p>
											</div>
											<!-- End Transction ID -->
											<!-- /.form-group -->

											<!-- form group -->
											<!-- Transaction Date -->
											<div class="form-group" id="divAccountFormTrDate">
												<label>Transaction Date(Non-Cash) :</label>
												<div class="input-group date">
													<div class="input-group-addon">
														<i class="fa fa-calendar"></i>
													</div>
													<input type="text"
														class="form-control pull-right datepicker" id="trDate"
														name="trDate" />
												</div>
												<p id="errorTrDate"></p>
												<!-- /.input group -->
											</div>
											<!--End Transaction Date -->
											<!-- /.form group -->


										</div>
										<!-- /.box-body -->
									</div>
								</div>
								<!-- /.box-body -->
							</div>
							<!-- /.Row Default box -->
						</div>
						<!-- /.box-body -->

						<input id="operation" name="operation" type="hidden"
							value="create">

						<div class="row">

							<div class="col-xs-4" align="center">
								<button type="reset" class="btn btn-block btn-danger">Cancel</button>
							</div>
							<div class="col-xs-4" align="center">
								<button type="button" onclick="sub();"
									class="btn btn-primary btn-block btn-flat">Submit</button>
							</div>

						</div>

					</form>

					<!-- User Form -->

					<!-- /.box-body -->
					<div class="box-footer">Provide the Details For adding
						Payment Record</div>
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

	<script type="text/javascript">
		$(function() {
			//Set formatted date in input fields
			document.getElementById("date").value = document
					.getElementById("today").innerHTML;
			//Function to Add More Accounts
			var button = document.getElementById('addAccount');
			$(button)
					.click(
							function(e) {
								e.preventDefault();
								var n = document
										.getElementById('totalAccounts').value;
								n++;
								$('#accounts')
										.append(
												'<div class="panel box box-primary"><div class="box-header with-border"><h4 class="box-title">Payment Account Details'
														+ '</h4>'
														+ '<div class="box-tools pull-right"> '
														+ '<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">'
														+ '<i class="fa fa-minus"></i></button>'
														+ '<button type="button" class="btn btn-box-tool"'
														+ 'data-widget="remove" onclick="remove(\'accountCode'
														+ n
														+ '\',\'amount'
														+ n
														+ '\')" data-toggle="tooltip" title="Remove">'
														+ '<i class="fa fa-times"></i>'
														+ '</button>'
														+ '</div></div>'
														+ '<div class="box-body"><div class="row">'
														+ '<div class="col-md-4">'
														+ '<div class="form-group" id="divFormAccountCode' + n +'">'
														+ '<label>Account Code</label>'
														+ '<div class="input-group">'
														+ '<span class="input-group-addon"><i class="fa fa-info-circle"></i></span> <input type="text" class="form-control accCode" placeholder="Account Code" id="accountCode' + n +'" name="accountCode' + n +'" />'
														+ '</div><p id="errorAccountCode' + n +'"></p></div>'
														+ '<div class="form-group" id="divFormPartyCode' + n +'" style="display: none;">'
														+ '<label>Party Code</label>'
														+ '<div class="input-group">'
														+ '<span class="input-group-addon"><i class="fa fa-info-circle"></i></span> <input type="text" class="form-control partyCode" placeholder="Party Code" id="partyCode' + n +'" name="partyCode' + n +'" />'
														+ '</div><p id="errorPartyCode' + n +'"></p></div>'
														+ '<div class="form-group" id="divFormAmount' + n +'">'
														+ '<label>Amount</label>'
														+ '<div class="input-group">'
														+ '<span class="input-group-addon"><i class="fa fa-inr"></i></span>'
														+ '<input type="text" class="form-control accAmount" value = "0" placeholder="0.00" id="amount' + n +'" name="amount' + n +'" />'
														+ '</div><p id="errorAmount' + n +'"></p></div></div>'
														+ '<div class="col-md-8">'
														+ '<div class="form-group" id="divFormAccountName' + n +'">'
														+ '<label>Account Name</label>'
														+ '<div class="input-group">'
														+ '<span class="input-group-addon"><i class="fa fa-bars"></i></span> <input type="text" class="form-control" placeholder="Account Name" id="accountName' + n +'" name="accountName' + n +'" />'
														+ '</div><p id="errorAccountName' + n +'"></p></div>'
														+ '<div class="form-group" id="divFormPartyName' + n +'"style="display: none;">'
														+ '<label>Party Name</label>'
														+ '<div class="input-group">'
														+ '<span class="input-group-addon"><i class="fa fa-bars"></i></span> <input type="text" class="form-control" placeholder="Party Name" id="partyName' + n +'" name="partyName' + n +'" />'
														+ '</div><p id="errorPartyName' + n +'"></p></div>'
														+ '<div class="form-group" id="divFormRemarks' + n +'">'
														+ '<label>Remarks</label>'
														+ '<div class="input-group">'
														+ '<span class="input-group-addon"><i class="fa fa-info"></i></span> <input type="text" class="form-control" placeholder="Remarks" id="remarks' + n +'" name="remarks' + n +'" />'
														+ '</div><p id="errorRemarks' + n +'"></p></div></div></div>');
								document.getElementById('totalAccounts').value = n;
							});
		});
	</script>
	<script>
		$('#accounts')
				.on(
						'blur',
						'.accCode',
						function(e) {
							e.preventDefault();
							var code = $(this).val();
							if (code.length > 0) {
								var id = $(this).attr('id');
								var lastChar = id[id.length - 1];
								if (document.getElementById('accountCode'
										+ lastChar).value == 'P0079'
										|| document
												.getElementById('accountCode'
														+ lastChar).value == 'p0079') {
									$('#divFormPartyCode' + lastChar).show();
									$('#divFormPartyName' + lastChar).show();
								} else {
									$('#divFormPartyCode' + lastChar).hide();
									$('#divFormPartyName' + lastChar).hide();
								}
							}
						});
	</script>
	<script>
		$('#accounts').on('keyup', '.accCode', function(e) {
			e.preventDefault();
			var s = $(this).val();
			if (s.length >= 1) {
				$.ajax({
					url : "../../AutoCompleteVoucher",
					type : "post",
					data : {
						'val' : s
					},
					success : function(data) {
						$('.accCode').autocomplete({
							source : data,
							select : function(event, ui) {
								event.preventDefault();
								var selectedArr = ui.item.value.split(":");
								this.value = $.trim(selectedArr[1]);
							}
						});

					},
					error : function(data, status, er) {
						console.log(data + "_" + status + "_" + er);
					},

				});
			}
		});

		$('#accounts').on('keyup', '.partyCode', function(e) {
			e.preventDefault();
			var s = $(this).val();
			if (s.length >= 1) {
				$.ajax({
					url : "../../AutoCompleteParty",
					type : "post",
					data : {
						'val' : s
					},
					success : function(data) {
						$('.partyCode').autocomplete({
							source : data,
							select : function(event, ui) {
								event.preventDefault();
								var selectedArr = ui.item.value.split(":");
								this.value = $.trim(selectedArr[1]);
							}
						});

					},
					error : function(data, status, er) {
						console.log(data + "_" + status + "_" + er);
					},

				});
			}
		});
	</script>
	<script>
		$('#bankCode').bind('keyup', function(e) {
			e.preventDefault();
			var s = $('#bankCode').val();
			if (s.length >= 1) {
				$.ajax({
					url : "../../AutoCompleteBank",
					type : "post",
					data : {
						'val' : s
					},
					success : function(data) {
						$('#bankCode').autocomplete({
							source : data,
							select : function(event, ui) {
								event.preventDefault();
								var selectedArr = ui.item.value.split(":");
								this.value = $.trim(selectedArr[1]);
							}
						});

					},
					error : function(data, status, er) {
						console.log(data + "_" + status + "_" + er);
					},

				});
			}
		});
	</script>
	<script>
		function remove(a, b) {
			document.getElementById(a).value = "";
			document.getElementById(b).value = 0;
			var totalAccount = $('#totalAccounts').val();
			var total = 0;
			for (i = 1; i <= totalAccount; i++) {
				var amt = $('#amount' + i).val();
				if ($.isNumeric(amt)) {
					total = total + parseInt(amt);
				} else {
					document.getElementById("errorAmount" + i).innerHTML = "Invalid Amount";
					document.getElementById("divFormAmount" + i).className = 'alert alert-warning alert-dismissible';
					document.getElementById("divFormAmount" + i)
							.scrollIntoView();
				}
			}
			$('#totalAmount').val(total);
		}

		<c:choose>
		<c:when test="${param.msg == '1'}">
		$(document)
				.ready(
						function() {
							$("#typeError").addClass("form-group has-success");
							$("#errorTop")
									.html(
											"Payment Record Added Successfully Of Voucher No. : ${param.docNo}");
						});
		</c:when>
		<c:when test="${param.msg=='2'}">
		$(document).ready(function() {
			$("#typeError").addClass("form-group has-error");
			$("#errorTop").html("Fail to Add Payment Record.");
		});
		</c:when>
		</c:choose>
	</script>
	<script>
		function validateForm(form) {
			error = "Please fill this field .";

			//Voucher Number validation
			var rec = document.getElementById("voucherNumber").value;
			if (rec == null || rec === "") {
				document.getElementById("errorVoucherNumber").innerHTML = error;
				document.getElementById("divFormVoucherNumber").className = 'alert alert-danger alert-dismissible';
				document.getElementById("divFormVoucherNumber")
						.scrollIntoView();
				return false;
			}

			if (!(rec == null || rec === "")) {
				var recValid = /^\d+$/;
				if (!rec.match(recValid)) {
					document.getElementById("errorVoucherNumber").innerHTML = 'Invalid Receipt Number';
					document.getElementById("divFormVoucherNumber").className = 'alert alert-warning alert-dismissible';
					document.getElementById("divFormVoucherNumber")
							.scrollIntoView();
					return false;
				}
				document.getElementById("errorVoucherNumber").innerHTML = "";
				document.getElementById("divFormVoucherNumber").className = 'form-group has-success';
			}

			//End Receipt Number validation

			//Bank Code Validation
			var bankCode = document.getElementById("bankCode").value;
			if (bankCode == null || bankCode === "") {
				document.getElementById("errorBankCode").innerHTML = error;
				document.getElementById("divFormBankCode").className = 'alert alert-danger alert-dismissible';
				document.getElementById("divFormBankCode").scrollIntoView();
				return false;
			}

			if (!(bankCode == null || bankCode === "")) {
				var codeValid = /^[a-zA-Z0-9-]+$/;
				if (!codeValid.test(bankCode)) {
					document.getElementById("errorBankCode").innerHTML = "Invaild Bank Code ";
					document.getElementById("divFormBankCode").className = 'alert alert-warning alert-dismissible';
					document.getElementById("divFormBankCode").scrollIntoView();
					return false;
				}
				document.getElementById("errorBankCode").innerHTML = "";
				document.getElementById("divFormBankCode").className = 'form-group has-success';
			}
			//End Bank Code Validation

			//Total Amount Validation
			var amt = document.getElementById("totalAmount").value;
			if (amt == null || amt === "") {

				document.getElementById("errorTotalAmount").innerHTML = error;
				document.getElementById("divFormTotalAmount").className = 'alert alert-danger alert-dismissible';
				document.getElementById("divFormTotalAmount").scrollIntoView();
				return false;
			}
			if (!(amt == null || amt === "")) {

				var balanceValid = /^(0|[1-9]\d*)(\.\d+)?$/;
				if (!(amt.match(balanceValid))) {
					document.getElementById("errorTotalAmount").innerHTML = "Invalid Amount";
					document.getElementById("divFormTotalAmount").className = 'alert alert-warning alert-dismissible';
					document.getElementById("divFormTotalAmount")
							.scrollIntoView();
					return false;
				}
				document.getElementById("errorTotalAmount").innerHTML = "";
				document.getElementById("divFormTotalAmount").className = 'form-group has-success';
			}
			//End Total Amount Validation

			//Bank Name Validation
			var name = document.getElementById("bankName").value;
			if (name == null || name === "") {

				document.getElementById("errorbankName").innerHTML = 'error';
				document.getElementById("divFormBankName").className = 'alert alert-danger alert-dismissible';
				document.getElementById("divFormBankName").scrollIntoView();
				return false;
			}
			//if (!(name == null || name === "")) {
			//	var nameValid = /^[a-zA-Z ]+$/;
			//	if (!name.match(nameValid)) {

			//		document.getElementById("errorbankName").innerHTML = 'Invalid Name';
			//		document.getElementById("divFormBankName").className = 'alert alert-warning alert-dismissible';
			//		document.getElementById("divFormBankName").scrollIntoView();
			//		return false;
			//	}

			document.getElementById("errorbankName").innerHTML = "";
			document.getElementById("divFormBankName").className = 'form-group has-success';
			//}
			//End Bank Name Validation

			//Transaction ID Validation
			var tr = document.getElementById("transactionID").value;
			var trmode = document.getElementById("paymentMode").value;
			if (trmode != "Cash") {
				if (tr == null || tr === "") {

					document.getElementById("errorTransctionID").innerHTML = error;
					document.getElementById("divFormTransctionID").className = 'alert alert-danger alert-dismissible';
					document.getElementById("divFormTransctionID")
							.scrollIntoView();
					return false;
				}
				if (!(tr == null || tr === "")) {

					var trValid = /^[a-zA-Z0-9- ]+$/;
					if (!tr.match(trValid)) {
						document.getElementById("errorTransctionID").innerHTML = 'Invalid Transaction ID';
						document.getElementById("divFormTransctionID").className = 'alert alert-warning alert-dismissible';
						document.getElementById("divFormTransctionID")
								.scrollIntoView();
						return false;
					}
					document.getElementById("errorTransctionID").innerHTML = "";
					document.getElementById("divFormTransctionID").className = 'form-group has-success';
				}
			}
			//End Transaction ID Validation

			return true;
		}

		function sub() {
			//Unique Id Vaildation
			var id = $('#voucherNumber').val();
			var dat = $('#date').val();
			var y = '1';
			if (id.length > 0) {
				$
						.ajax({
							url : '../../ReceiptAutoFill',
							dataType : 'json',
							type : 'post',
							data : {
								'vrNo' : id,
								'date' : dat
							},

							success : function(data) {
								var data0 = data["data"][0];
								bool = data0["avail"];
								if (bool === false) {
									alert("Voucher Number is not available for given financial year . Use Voucher No. : "
											+ data0["next"]);
									document
											.getElementById("errorVoucherNumber").innerHTML = 'Receipt Number Already exist';
									document
											.getElementById("divFormVoucherNumber").className = 'alert alert-warning alert-dismissible';
									document.getElementById(
											"divFormVoucherNumber")
											.scrollIntoView();

								} else {
									document
											.getElementById("errorVoucherNumber").innerHTML = '';
									document
											.getElementById("divFormVoucherNumber").className = 'form-group has-success';
									$('#form').submit();

								}
							},

							error : function(req, status, err) {
								alert('Error');
								console.log(req + ' ' + status + ' ' + err);
							}

						});
			}
			//End Id Validation

		}

		$(function() {
			//Date picker
			$('.datepicker').datepicker({
				format : 'dd/mm/yyyy',
				autoclose : true
			});
			//Initialize Select2 Elements
			$(".select2").select2();
		});

		//Auto fill data
		$(document)
				.ready(
						function() {

							//Account Details Auto fill
							$('#accounts')
									.on(
											'blur',
											'.accCode',
											function(e) {
												e.preventDefault();
												var code = $(this).val();
												if (code.length > 0) {
													var id = $(this).attr('id');
													var lastChar = id[id.length - 1];
													$
															.ajax({
																url : '../../ReceiptAutoFill',
																dataType : 'json',
																type : 'post',
																data : {
																	'accode' : code
																},

																success : function(
																		data) {
																	var bool = data["masterAccountId"] === 0;
																	$(
																			'#divFormAccountCode'
																					+ lastChar)
																			.toggleClass(
																					'alert alert-danger alert-dismissible',
																					bool);
																	$(
																			'#accountName'
																					+ lastChar)
																			.val(
																					'');
																	$(
																			'#errorAccountCode'
																					+ lastChar)
																			.empty();
																	if (data["masterAccountId"] === 0) {
																		$(
																				'#errorAccountCode'
																						+ lastChar)
																				.text(
																						'Account Code doesn\'t exist');
																	} else {

																		$(
																				'#accountName'
																						+ lastChar)
																				.val(
																						data["acName"]);
																		$(
																				'#accountName'
																						+ lastChar)
																				.prop(
																						'disabled',
																						true);
																	}
																},

																error : function(
																		req,
																		status,
																		err) {
																	alert('Error');
																	console
																			.log(req
																					+ ' '
																					+ status
																					+ ' '
																					+ err);
																}

															});
												}

											});
							//Party Details Auto Fill
							$('#accounts')
									.on(
											'blur',
											'.partyCode',
											function(e) {
												e.preventDefault();
												var code = $(this).val();
												if (code.length > 0) {
													var id = $(this).attr('id');
													var lastChar = id[id.length - 1];
													$
															.ajax({
																url : '../../ReceiptAutoFill',
																dataType : 'json',
																type : 'post',
																data : {
																	'partycode' : code
																},
																success : function(
																		data) {
																	var bool = data["supplId"] === 0;
																	$(
																			'#divFormPartyCode'
																					+ lastChar)
																			.toggleClass(
																					'alert alert-danger alert-dismissible',
																					bool);
																	$(
																			'#partyName'
																					+ lastChar)
																			.val(
																					'');
																	$(
																			'#errorPartyCode'
																					+ lastChar)
																			.empty();
																	if (data["supplId"] === 0) {
																		$(
																				'#errorPartyCode'
																						+ lastChar)
																				.text(
																						'Party Code doesn\'t exist');
																	} else {
																		$(
																				'#partyName'
																						+ lastChar)
																				.val(
																						data["supplName"]);

																		$(
																				'#partyName'
																						+ lastChar)
																				.prop(
																						'disabled',
																						true);
																	}
																},

																error : function(
																		req,
																		status,
																		err) {
																	alert('Error');
																	console
																			.log(req
																					+ ' '
																					+ status
																					+ ' '
																					+ err);
																}

															});
												}

											});

							$('#accounts')
									.on(
											'blur',
											'.accAmount',
											function(e) {
												e.preventDefault();
												var totalAccount = $(
														'#totalAccounts').val();
												var total = 0;
												for (i = 1; i <= totalAccount; i++) {
													var amt = $('#amount' + i)
															.val();
													if ($.isNumeric(amt)) {
														total = total
																+ parseInt(amt);
													} else {
														document
																.getElementById("errorAmount"
																		+ i).innerHTML = "Invalid Amount";
														document
																.getElementById("divFormAmount"
																		+ i).className = 'alert alert-warning alert-dismissible';
														document
																.getElementById(
																		"divFormAmount"
																				+ i)
																.scrollIntoView();
													}
												}
												$('#totalAmount').val(total);

											});

							//Bank Details Auto fill
							$('#bankCode')
									.bind(
											"blur",
											function(e) {
												e.preventDefault();
												var code = $('#bankCode').val();
												if (code.length > 0) {
													$
															.ajax({
																url : '../../ReceiptAutoFill',
																dataType : 'json',
																type : 'post',
																data : {
																	'code' : code
																},

																success : function(
																		data) {
																	var bool = data["accountId"] === 0;
																	$(
																			'#divFormBankCode')
																			.toggleClass(
																					'alert alert-danger alert-dismissible',
																					bool);
																	$(
																			'#bankName')
																			.val(
																					'');
																	$(
																			'#errorBankCode')
																			.empty();
																	if (data["accountId"] === 0) {
																		$(
																				'#errorBankCode')
																				.text(
																						'Bank Code doesn\'t exist');
																	} else {
																		if (data["bkCode"] == '001') {
																			$(
																					"#paymentMode")
																					.val(
																							$(
																									"#paymentMode option:eq(0)")
																									.val())
																					.change();
																			$(
																					'#transactionID')
																					.prop(
																							'disabled',
																							true);
																			$(
																					'#transactionID')
																					.val(
																							"");

																			$(
																					'#trDate')
																					.prop(
																							'disabled',
																							true);

																			$(
																					'#trDate')
																					.val(
																							"");
																			$(
																					'#bankName')
																					.val(
																							data["bkName"]);
																		} else {
																			$(
																					'#transactionID')
																					.prop(
																							'disabled',
																							false);
																			$(
																					'#trDate')
																					.prop(
																							'disabled',
																							false);

																			$(
																					'#bankName')
																					.val(
																							data["bkName"]);
																			$(
																					"#paymentMode")
																					.val(
																							$(
																									"#paymentMode option:eq(1)")
																									.val())
																					.change();
																		}
																	}

																},

																error : function(
																		req,
																		status,
																		err) {
																	alert('Error');
																	console
																			.log(req
																					+ ' '
																					+ status
																					+ ' '
																					+ err);
																}

															});
												}

											});
						});
	</script>