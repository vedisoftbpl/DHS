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
					<li><a href="#">Payments</a></li>
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
						action="${pageContext.request.contextPath}/admin/pages/CashBankAmountTransferController"
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
									<!-- Payment Date -->
									<div class="form-group" id="divPaymentFormDate">
										<label>Payment Date :</label>
										<div class="input-group date">
											<div class="input-group-addon">
												<i class="fa fa-calendar"></i>
											</div>
											<input type="text" class="form-control pull-right datepicker"
												id="date" name="date" required="required"
												value="${param.today}" />
										</div>
										<p id="errorPaymentDate"></p>
										<!-- /.input group -->
									</div>
									<!--End Payment Date -->
									<!-- /.form group -->
								</div>
								<!-- /.col -->
							</div>
							<!-- /.row -->

							<!-- Row Default box -->
							<div class="row">
								<div class="box-header with-border">
									<h3 class="box-title">Account Details</h3>
								</div>

								<div id="accounts" class="box-body">
									<div class="panel box box-primary">
										<div class="box-header with-border">
											<h4 class="box-title">Payment Account Details</h4>

										</div>
										<div class="box-body">
											<div class="row">
												<div class="col-md-4">
													<!--  form-group -->
													<!-- Account Code -->
													<div class="form-group" id="divFormAccountCode">
														<label>Account Code</label>
														<div class="input-group">
															<span class="input-group-addon"><i
																class="fa fa-info-circle"></i></span> <input type="text"
																class="form-control accCode" placeholder="Account Code"
																id="accountCode" name="accountCode" />
														</div>
														<p id="errorAccountCode"></p>
													</div>
													<!-- End Account Code -->
													<!-- /.form-group -->



													<!-- form group -->
													<!-- Amount -->
													<div class="form-group" id="divFormAmount">
														<label>Amount</label>
														<div class="input-group">
															<span class="input-group-addon"><i
																class="fa fa-inr"></i></span> <input type="text"
																class="form-control accAmount" placeholder="0.00"
																value="0" id="amount" name="amount" />
														</div>
														<p id="errorAmount"></p>
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
																id="accountName" name="accountName" />
														</div>
														<p id="errorAccountName"></p>
													</div>
													<!-- End Account Name -->
													<!-- /.form-group -->



													<!--  form-group -->
													<!-- Remarks -->
													<div class="form-group" id="divFormRemarks">
														<label>Remarks</label>
														<div class="input-group">
															<span class="input-group-addon"><i
																class="fa fa-info"></i></span> <input type="text"
																class="form-control" placeholder="Remarks" id="remarks"
																name="remarks" />
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
							<div class="row">
								<div class="box-header with-border">
									<h3 class="box-title">Transaction Details</h3>
								</div>
								<div id="transactions" class="box-body">
									<div class="row">
										<div class="col-md-4">
											<!--  form-group -->
											<!-- Bank Code -->
											<div class="form-group" id="divFormBankCode1">
												<label>Bank Code(From)</label>
												<div class="input-group">
													<span class="input-group-addon"><i
														class="fa fa-info-circle"></i></span> <input type="text"
														class="form-control bankCode" placeholder="From Bank "
														id="bankCodeFrom" name="bankCodeFrom" />
												</div>
												<p id="errorBankCodeFrom"></p>
											</div>
											<!-- End Bank Code -->
											<!-- /.form-group -->
											<!-- Bank Code -->
											<div class="form-group" id="divFormBankCode2">
												<label>Bank Code(To)</label>
												<div class="input-group">
													<span class="input-group-addon"><i
														class="fa fa-info-circle"></i></span> <input type="text"
														class="form-control bankCode" placeholder="To Bank "
														id="bankCodeTo" name="bankCodeTo" />
												</div>
												<p id="errorBankCodeTo"></p>
											</div>
											<!-- End Bank Code -->
											<!-- form group -->
											
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


										</div>
										<div class="col-md-8">

											<!--  form-group -->
											<!-- Bank Name -->
											<div class="form-group" id="divFormBankName">
												<label>Bank From </label>
												<div class="input-group">
													<span class="input-group-addon"><i
														class="fa fa-info-circle"></i></span> <input type="text"
														class="form-control bankDetails" placeholder="Bank Name"
														id="bankName1" name="bankName1" />
												</div>
												<p id="errorbankName"></p>
											</div>
											<!-- End Bank Name -->
											<!-- /.form-group -->
											<!-- Bank Name -->
											<div class="form-group" id="divFormBankName">
												<label>Bank To</label>
												<div class="input-group">
													<span class="input-group-addon"><i
														class="fa fa-info-circle"></i></span> <input type="text"
														class="form-control bankDetails" placeholder="Bank Name"
														id="bankName2" name="bankName2" />
												</div>
												<p id="errorbankName"></p>
											</div>
											<!-- End Bank Name -->
											<!--  form-group -->
											

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
									<!-- /.box-body -->
								</div>
								<!-- /.Row Default box -->
							</div>
							<!-- /.box-body -->
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
		$('#transactions').on('keyup', '.bankCode', function(e) {
			e.preventDefault();
			var s = $(this).val();
			if (s.length >= 1) {
				$.ajax({
					url : "../../AutoCompleteBank",
					type : "post",
					data : {
						'val' : s
					},
					success : function(data) {
						$('.bankCode').autocomplete({
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

		function validateForm(form) {
			error = "Please fill this field .";

			//Bank Code From Validation
			var bankCode = document.getElementById("bankCodeFrom").value;
			if (bankCode == null || bankCode === "") {
				document.getElementById("errorBankCodeFrom").innerHTML = error;
				document.getElementById("divFormBankCode1").className = 'alert alert-danger alert-dismissible';
				document.getElementById("divFormBankCode1").scrollIntoView();
				return false;
			}

			if (!(bankCode == null || bankCode === "")) {
				var codeValid = /^[a-zA-Z0-9-]+$/;
				if (!codeValid.test(bankCode)) {
					document.getElementById("errorBankCodeFrom").innerHTML = "Invaild Bank Code ";
					document.getElementById("divFormBankCode1").className = 'alert alert-warning alert-dismissible';
					document.getElementById("divFormBankCode1").scrollIntoView();
					return false;
				}
				document.getElementById("errorBankCodeFrom").innerHTML = "";
				document.getElementById("divFormBankCode1").className = 'form-group has-success';
			}
			//End Bank Code Validation
			
			//Bank Code Validation
			var bankCode = document.getElementById("bankCodeTo").value;
			if (bankCode == null || bankCode === "") {
				document.getElementById("errorBankCodeTo").innerHTML = error;
				document.getElementById("divFormBankCode2").className = 'alert alert-danger alert-dismissible';
				document.getElementById("divFormBankCode2").scrollIntoView();
				return false;
			}

			if (!(bankCode == null || bankCode === "")) {
				var codeValid = /^[a-zA-Z0-9-]+$/;
				if (!codeValid.test(bankCode)) {
					document.getElementById("errorBankCodeTo").innerHTML = "Invaild Bank Code ";
					document.getElementById("divFormBankCode2").className = 'alert alert-warning alert-dismissible';
					document.getElementById("divFormBankCode2").scrollIntoView();
					return false;
				}
				document.getElementById("errorBankCodeTo").innerHTML = "";
				document.getElementById("divFormBankCode2").className = 'form-group has-success';
			}
			//End Bank Code Validation
			
			
			

			// Amount Validation
			var amt = document.getElementById("amount").value;
			if (amt == null || amt === "") {

				document.getElementById("errorAmount").innerHTML = error;
				document.getElementById("divFormAmount").className = 'alert alert-danger alert-dismissible';
				document.getElementById("divFormAmount").scrollIntoView();
				return false;
			}
			if (!(amt == null || amt === "")) {

				var balanceValid = /^(0|[1-9]\d*)(\.\d+)?$/;
				if (!(amt.match(balanceValid))) {
					document.getElementById("errorAmount").innerHTML = "Invalid Amount";
					document.getElementById("divFormAmount").className = 'alert alert-warning alert-dismissible';
					document.getElementById("divFormAmount")
							.scrollIntoView();
					return false;
				}
				document.getElementById("errorAmount").innerHTML = "";
				document.getElementById("divFormAmount").className = 'form-group has-success';
			}
			//End  Amount Validation

			
			return true;
		}
	</script>
	<script>
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
																			'#divFormAccountCode')
																			.toggleClass(
																					'alert alert-danger alert-dismissible',
																					bool);
																	$(
																			'#accountName')
																			.val(
																					'');
																	$(
																			'#errorAccountCode')
																			.empty();
																	if (data["masterAccountId"] === 0) {
																		$(
																				'#errorAccountCode')
																				.text(
																						'Account Code doesn\'t exist');
																	} else {

																		$(
																				'#accountName')
																				.val(
																						data["acName"]);
																		$(
																				'#accountName')
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

							
							//Bank Details Auto fill
							$('#transactions')
									.on(
											"blur",
											'#bankCodeFrom',
											function(e) {
												e.preventDefault();
												var code = $(this).val();
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
																			'#bankName1')
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

																		
																		$(
																				'#bankName1')
																				.prop(
																						'disabled',
																						true);

																		$(
																				'#bankName1')
																				.val(
																						data["bkName"]);
																		
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
							
							$('#transactions')
									.on(
											"blur",
											'#bankCodeTo',
											function(e) {
												e.preventDefault();
												var code = $(this).val();
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
																			'#bankName2')
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

																		
																		$(
																				'#bankName2')
																				.prop(
																						'disabled',
																						true);

																		$(
																				'#bankName2')
																				.val(
																						data["bkName"]);
																		
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