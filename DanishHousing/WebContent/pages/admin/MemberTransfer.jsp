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
				<h1>Member Transfer</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Payments</a></li>
					<li class="active">Member Transfer Form</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- Default box -->
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">Member Transfer Form</h3>
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
						action="${pageContext.request.contextPath}/admin/pages/MemberTransferController"
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
												<div class="box-body" align="right">
													<span><fmt:setLocale value="en_IN" />
														<fmt:formatNumber value="${ac.value}" type="currency" /></span>
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
													<span><fmt:setLocale value="en_IN" />
														<fmt:formatNumber value="${ac.value}" type="currency" /></span>
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
									<!--  form-group -->
									<!-- Member ID -->
									<div class="form-group" id="divFormMemberID1">
										<label>Member ID From</label>
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-info-circle"></i></span> <input type="text"
												class="form-control" placeholder="Member ID From"
												id="memberIDFrom" name="memberIDFrom" />
										</div>
										<p id="errorMemberID1"></p>
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group" id="divFormMemberID2">
										<label>Member ID To</label>
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-info-circle"></i></span> <input type="text"
												class="form-control" placeholder="Member ID To"
												id="memberIDTo" name="memberIDTo" />
										</div>
										<p id="errorMemberID2"></p>
									</div>
									<!-- End Member ID -->
									<!-- /.form-group -->
								</div>
								<!-- /.col -->
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
							</div>
							<!-- /.col -->
							<!-- col -->
							<div class="row">
								<div class="col-md-4">
									<!--  form group -->
									<!--  Receipt Number -->
									<div class="form-group" id="divFormReceiptNumber">
										<label>Receipt Number</label>
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa  fa-info-circle "></i></span> <input type="text"
												class="form-control" value="${param.recNo}"
												id="receiptNumber" name="receiptNumber" />
										</div>
										<p id="errorReceiptNumber"></p>
									</div>
									<!--  End Receipt Number -->
									<!-- /. form-group -->
								</div>
								<div class="col-md-4">
									<!-- form group -->
									<!-- Receipt Date -->
									<div class="form-group" id="divTransferFormDate">
										<label>Transfer Date :</label>
										<div class="input-group date">
											<div class="input-group-addon">
												<i class="fa fa-calendar"></i>
											</div>
											<input type="text" class="form-control pull-right datepicker"
												id="date" name="date" required="required"
												value="${param.today}" />
										</div>
										<p id="errorTransferDate"></p>
										<!-- /.input group -->
									</div>
									<!--End Receipt Date -->
									<!-- /.form group -->
								</div>
								<!-- /.col -->
							</div>
							<!-- /.row -->
							<!-- Row Default box -->
							<div class="row">
								<div class="box-header with-border">
									<h3 class="box-title">Member Details</h3>
								</div>
								<div class="box-body">
									<dl class="dl-horizontal" id="memberDetails1">
									</dl>

								</div>
								<div class="box-body">
									<dl class="dl-horizontal" id="memberDetails2">
									</dl>

								</div>
								<!-- /.box-body -->
							</div>
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
											<h4 class="box-title">Account Details</h4>
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
						</div>
					</form>

					<!-- User Form -->

					<!-- /.box-body -->
					<div class="box-footer">Provide the Details For adding Member
						Transfer Record</div>
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
												'<div class="panel box box-primary"><div class="box-header with-border"><h4 class="box-title">Account Details'
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
														+

														'<div class="form-group" id="divFormAmount' + n +'">'
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
											"Member Transfer Record Added Successfully of Voucher No. : ${param.docNo} and Receipt No.:${param.receNo}");
							window
									.open(
											"../../admin/pages/ReceiptPrintController?docNo=${param.receNo}",
											"Receipt : ${param.receNo}",
											"_blank");
						});
		</c:when>
		<c:when test="${param.msg=='2'}">
		$(document).ready(function() {
			$("#typeError").addClass("form-group has-error");
			$("#errorTop").html("Fail to Add Receipt Record.");
		});
		</c:when>
		</c:choose>
		
	</script>
	<script>
		function validateForm(form) {
			error = "Please fill this field .";

			//Member ID1 validation
			var id = document.getElementById("memberIDFrom").value;
			if (id == null || id === "") {
				document.getElementById("errorMemberID1").innerHTML = error;
				document.getElementById("divFormMemberID1").className = 'alert alert-danger alert-dismissible';
				document.getElementById("divFormMemberID1").scrollIntoView();
				return false;
			}

			if (!(id == null || id === "")) {
				var idValid = /^\d+$/;
				if (!id.match(idValid)) {
					document.getElementById("errorMemberID1").innerHTML = 'Invalid ID';
					document.getElementById("divFormMemberID1").className = 'alert alert-warning alert-dismissible';
					document.getElementById("divFormMemberID1")
							.scrollIntoView();
					return false;
				}
				document.getElementById("errorMemberID1").innerHTML = "";
				document.getElementById("divFormMemberID1").className = 'form-group has-success';
			}

			//End Member ID validation

			//Member ID2 validation
			var id = document.getElementById("memberIDTo").value;
			if (id == null || id === "") {
				document.getElementById("errorMemberID2").innerHTML = error;
				document.getElementById("divFormMemberID2").className = 'alert alert-danger alert-dismissible';
				document.getElementById("divFormMemberID2").scrollIntoView();
				return false;
			}

			if (!(id == null || id === "")) {
				var idValid = /^\d+$/;
				if (!id.match(idValid)) {
					document.getElementById("errorMemberID2").innerHTML = 'Invalid ID';
					document.getElementById("divFormMemberID2").className = 'alert alert-warning alert-dismissible';
					document.getElementById("divFormMemberID2")
							.scrollIntoView();
					return false;
				}
				document.getElementById("errorMemberID2").innerHTML = "";
				document.getElementById("divFormMemberID2").className = 'form-group has-success';
			}

			//End Member ID validation
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
					document.getElementById("errorVoucherNumber").innerHTML = 'Invalid Voucher Number';
					document.getElementById("divFormVoucherNumber").className = 'alert alert-warning alert-dismissible';
					document.getElementById("divFormVoucherNumber")
							.scrollIntoView();
					return false;
				}
				document.getElementById("errorVoucherNumber").innerHTML = "";
				document.getElementById("divFormVoucherNumber").className = 'form-group has-success';
			}

			//End Voucher Number validation

			//Receipt Number validation
			var rec = document.getElementById("receiptNumber").value;
			if (rec == null || rec === "") {
				document.getElementById("errorReceiptNumber").innerHTML = error;
				document.getElementById("divFormReceiptNumber").className = 'alert alert-danger alert-dismissible';
				document.getElementById("divFormReceiptNumber")
						.scrollIntoView();
				return false;
			}

			if (!(rec == null || rec === "")) {
				var recValid = /^\d+$/;
				if (!rec.match(recValid)) {
					document.getElementById("errorReceiptNumber").innerHTML = 'Invalid Voucher Number';
					document.getElementById("divFormReceiptNumber").className = 'alert alert-warning alert-dismissible';
					document.getElementById("divFormReceiptNumber")
							.scrollIntoView();
					return false;
				}
				document.getElementById("errorReceiptNumber").innerHTML = "";
				document.getElementById("divFormReceiptNumber").className = 'form-group has-success';
			}

			//End Receipt Number validation

			
		
			
			return true;
		}
		function sub() {
			//Unique Id Vaildation
			var id1 = $('#voucherNumber').val();
			var id2 = $('#receiptNumber').val();
			var dat = $('#date').val();
			var y = '1';
			if (id1.length > 0) {
				$
						.ajax({
							url : '../../ReceiptAutoFill',
							dataType : 'json',
							type : 'post',
							data : {
								'vrNo' : id1,
								'date' : dat
							},

							success : function(data) {
								var data0 = data["data"][0];
								bool = data0["avail"];
								if (bool === false) {
									alert("Voucher Number is not available. Use Voucher No. : "
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

								}
							},

							error : function(req, status, err) {
								alert('Error');
								console.log(req + ' ' + status + ' ' + err);
							}

						});
			}
			if (id2.length > 0) {
				$
						.ajax({
							url : '../../ReceiptAutoFill',
							dataType : 'json',
							type : 'post',
							data : {
								'recNo' : id2,
								'date' : dat
							},

							success : function(data) {
								var data0 = data["data"][0];
								bool = data0["avail"];
								if (bool === false) {
									alert("Receipt Number is not available. Use Receipt No. : "
											+ data0["next"]);
									document
											.getElementById("errorReceiptNumber").innerHTML = 'Receipt Number Already exist';
									document
											.getElementById("divFormReceiptNumber").className = 'alert alert-warning alert-dismissible';
									document.getElementById(
											"divFormReceiptNumber")
											.scrollIntoView();

								} else {
									document
											.getElementById("errorReceiptNumber").innerHTML = '';
									document
											.getElementById("divFormReceiptNumber").className = 'form-group has-success';
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
							//Member Auto Fill
							$('#memberIDFrom')
									.bind(
											"blur",
											function(e) {
												e.preventDefault();
												var id = $('#memberIDFrom')
														.val();
												if (id.length > 0) {
													$
															.ajax({
																url : '../../ReceiptAutoFill',
																dataType : 'json',
																type : 'post',
																data : {
																	'id' : id
																},

																success : function(
																		data) {
																	var data0 = data["data"][0];
																	var data1 = data["data"][1];
																	var bool = data0["memberId"] === 0;
																	$(
																			'#divFormMemberID1')
																			.toggleClass(
																					'alert alert-danger alert-dismissible',
																					bool);
																	$(
																			'#memberDetails1')
																			.empty();
																	$(
																			'#errorMemberID1')
																			.empty();
																	if (data0["memberId"] === 0) {
																		$(
																				'#errorMemberID1')
																				.text(
																						'MemberID doesn\'t exist');
																	} else {
																		$(
																				'#memberDetails1')
																				.append(
																						'<dt>Full Name</dt><dd>'
																								+ data0["prefix"]
																								+ ' '
																								+ data0["memName"]
																								+ ' '
																								+ data0["fHRelation"]
																								+ ' '
																								+ data0["fHRelName"]
																								+ '</dd>'
																								+ '<dt>Address</dt><dd>'
																								+ data0["address1"]
																								+ '</dd><dd>'
																								+ data0["address2"]
																								+ '</dd><dd>'
																								+ data0["address3"]
																								+ '</dd>'
																								+ '<dt>Plot Number</dt><dd>'
																								+ data0["plotNo"]
																								+ '</dd>'
																								+ '<dt>Plot Size</dt><dd>'
																								+ data0["plotSize"]
																								+ '</dd>'
																								+ '<dt>Net Plot Size</dt><dd>'
																								+ data0["netPlotSize"]
																								+ '</dd>'
																								+ '<dt>Project</dt><dd>'
																								+ data1["projectName"]
																								+ ' - '
																								+ data1["projectId"]
																								+ '</dd>'
																								+ '<dt>Project Type</dt><dd>'
																								+ data1["bungProject"]
																								+ '</dd>');

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

							//Member Auto Fill
							$('#memberIDTo')
									.bind(
											"blur",
											function(e) {
												e.preventDefault();
												var id = $('#memberIDTo').val();
												if (id.length > 0) {
													$
															.ajax({
																url : '../../ReceiptAutoFill',
																dataType : 'json',
																type : 'post',
																data : {
																	'id' : id
																},

																success : function(
																		data) {
																	var data0 = data["data"][0];
																	var data1 = data["data"][1];
																	var bool = data0["memberId"] === 0;
																	$(
																			'#divFormMemberID2')
																			.toggleClass(
																					'alert alert-danger alert-dismissible',
																					bool);
																	$(
																			'#memberDetails2')
																			.empty();
																	$(
																			'#errorMemberID2')
																			.empty();
																	if (data0["memberId"] === 0) {
																		$(
																				'#errorMemberID2')
																				.text(
																						'MemberID doesn\'t exist');
																	} else {
																		$(
																				'#memberDetails2')
																				.append(
																						'<dt>Full Name</dt><dd>'
																								+ data0["prefix"]
																								+ ' '
																								+ data0["memName"]
																								+ ' '
																								+ data0["fHRelation"]
																								+ ' '
																								+ data0["fHRelName"]
																								+ '</dd>'
																								+ '<dt>Address</dt><dd>'
																								+ data0["address1"]
																								+ '</dd><dd>'
																								+ data0["address2"]
																								+ '</dd><dd>'
																								+ data0["address3"]
																								+ '</dd>'
																								+ '<dt>Plot Number</dt><dd>'
																								+ data0["plotNo"]
																								+ '</dd>'
																								+ '<dt>Plot Size</dt><dd>'
																								+ data0["plotSize"]
																								+ '</dd>'
																								+ '<dt>Net Plot Size</dt><dd>'
																								+ data0["netPlotSize"]
																								+ '</dd>'
																								+ '<dt>Project</dt><dd>'
																								+ data1["projectName"]
																								+ ' - '
																								+ data1["projectId"]
																								+ '</dd>'
																								+ '<dt>Project Type</dt><dd>'
																								+ data1["bungProject"]
																								+ '</dd>');

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

							$('#accounts')
									.on(
											'blur',
											'.accAmount',
											function(e) {
												e.preventDefault();

												var total = 0;
												for (i = 1; i <= totalAccount; i++) {
													var amt = $('#amount' + i)
															.val();
													if ($.isNumeric(amt)) {

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

						});
	</script>