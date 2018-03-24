<%@page import="com.vedisoft.danishhousing.config.*" %>
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
				<h1>Journal Transfer</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Examples</a></li>
					<li class="active">Journal Transfer</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- Default box -->
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">Journal Transfer Form</h3>
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
						action="${pageContext.request.contextPath}/admin/pages/JournalTransferController"
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
													<span><fmt:setLocale value="en_IN" /> <fmt:formatNumber
															value="${ac.value}" type="currency" /></span>
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
													<span><fmt:setLocale value="en_IN" /> <fmt:formatNumber
															value="${ac.value}" type="currency" /></span>
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
										<label>Transfer Date :</label>
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
							<div class="row">
								<div class="col-md-8">
									<!--  form group -->
									<!--  Remark -->
									<div class="form-group" id="divFormRemark">
										<label> Narration </label>
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa  fa-info-circle "></i></span> <input type="text"
												class="form-control" placeholder="Narration goes here."
												id="remark" name="remark" />
										</div>
										<p id="errorRemark"></p>
									</div>
									<!--  End Receipt Number -->
									<!-- /. form-group -->

								</div>
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
									<div class="box">
										<div class="box-header">
											<h3 class="box-title">Add Accounts for Jounal Transfer</h3>
										</div>
										<!-- /.box-header -->
										<div class="box-body no-padding">
											<table class="table table-striped" id="table">
												<thead>
													<tr>
														<th colspan="5">Account Code</th>
														<th colspan="4"><div id="partyName"
																style="display: none;">Party Name</div></th>
														<th>Credit</th>
														<th>Debit</th>
														<th>&nbsp;</th>
													</tr>
												</thead>
												<tr id="account1">
													<td colspan="5">
														<div id="divFormAccountCode1">

															<div class="input-group">
																<input type="text" class="form-control accCode"
																	placeholder="Account Code" id="accountCode1"
																	name="accountCode1" /> <span id="AccountCodeName1"></span>
															</div>
															<span id="AccountCodeName1"></span>
															<p id="errorAccountCode1"></p>
														</div>
													</td>
													<td colspan="4">
														<div id="divFormPartyCode1" style="display: none;">

															<div class="input-group">
																<input type="text" class="form-control partyCode"
																	placeholder="Party Code" id="partyCode1"
																	name="partyCode1" /> <span id="PartyCodeName1"></span>
															</div>
															<span id="PartyCodeName1"></span>
															<p id="errorPartyCode1"></p>
														</div>
													</td>
													<td>
														<div class="form-group" id="divFormCredit1">
															<span><input style="color: green; width: 100px;"
																type="text" class="form-control credit" value="0.0"
																id="credit1" name="credit1" /></span>
															<p id="errorCredit1"></p>
														</div>
													</td>
													<td><div class="form-group" id="divFormDebit1">
															<span><input style="color: red; width: 100px;"
																type="text" class="form-control debit" value="0.0"
																id="debit1" name="debit1" /></span>
															<p id="errorDebit1"></p>
														</div></td>
													<td><button type="button" class="btn btn-box-tool"
															onclick="remove('accountCode1','account1')"
															data-toggle="tooltip" title="Remove">
															<i class="fa fa-times"></i>
														</button></td>
												</tr>

												<tfoot>
													<tr>
														<th colspan="4">Total Amount&nbsp;(Credit
															&nbsp;&&nbsp; Debit)&nbsp; :</th>
														<th colspan="4">&nbsp;</th>
														<th id="totalCredit"></th>
														<th id="totalDebit"></th>
														<th>&nbsp;</th>
													<tr>
												</tfoot>

											</table>
										</div>
										<!-- /.box-body -->
									</div>
									<!-- /.box -->

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
								$('#table')
										.append(
												'<tr id="account'+n+'">'
														+ '<td colspan="5">'
														+ '<div  id="divFormAccountCode'+n+'">'
														+ '<div class="input-group">'
														+ '<input type="text"'
												  +'class="form-control accCode" placeholder="Account Code"'
												  +'id="accountCode'+n+'" name="accountCode'+n+'" />'
														+ '<span id="AccountCodeName'+n+'"></span>'
														+ '</div>'
														+ '<p id="errorAccountCode'+n+'"></p>'
														+ '</div>'
														+ '</td>'
														+ '<td colspan="4">'
														+ '<div  id="divFormPartyCode'+n+'" style="display: none;">'
														+ '<div class="input-group">'
														+ '<input type="text"'
												  +'class="form-control partyCode" placeholder="Party Code"'
												  +'id="partyCode'+n+'" name="partyCode'+n+'" />'
														+ '<span id="PartyCodeName'+n+'"></span>'
														+ '</div>'
														+ '<p id="errorPartyCode'+n+'"></p>'
														+ '</div>'
														+ '</td>'
														+ '<td>'
														+ '<div class="form-group" id="divFormCredit'+n+'">'
														+ '<span ><input style = "color:green; width:100px;" type="text" class="form-control credit" value="0.0"'
												  +'id="credit'+n+'" name="credit'+n+'" /></span>'
														+ '<p id="errorCredit'+n+'"></p>'
														+ '</div>'
														+ '</td>'
														+ '<td><div class="form-group" id="divFormDebit'+n+'">'
														+ '<span ><input style = "color:red; width:100px;" type="text" class="form-control debit" value="0.0"'
												  +'id="debit'+n+'" name="debit'+n+'" /></span>'
														+ '<p id="errorDebit'+n+'"></p>'
														+ '</div></td>'
														+ '<td><button type="button" class="btn btn-box-tool"'
														+ ' onclick="remove(\'accountCode'
														+ n
														+ '\',\'account'
														+ n
														+ '\')" data-toggle="tooltip" title="Remove">'
														+ '<i class="fa fa-times"></i></button>'
														+ '</td></tr>');
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
									$('#partyName').show();

								} else {
									$('#divFormPartyCode' + lastChar).hide();
									$('#partyName').hide();
								}
							}
						});

		$('#accounts')
				.on(
						'keyup',
						'.accCode',
						function(e) {
							e.preventDefault();
							var s = $(this).val();
							if (s.length >= 1) {
								$
										.ajax({
											url : "../../AutoCompleteVoucher",
											type : "post",
											data : {
												'val' : s
											},
											success : function(data) {
												$('.accCode')
														.autocomplete(
																{
																	source : data,
																	select : function(
																			event,
																			ui) {
																		event
																				.preventDefault();
																		var selectedArr = ui.item.value
																				.split(":");
																		this.value = $
																				.trim(selectedArr[1]);
																	}
																});

											},
											error : function(data, status, er) {
												console.log(data + "_" + status
														+ "_" + er);
											},

										});
							}
						});
		$('#accounts')
				.on(
						'keyup',
						'.partyCode',
						function(e) {
							e.preventDefault();
							var s = $(this).val();
							if (s.length >= 1) {
								$
										.ajax({
											url : "../../AutoCompleteParty",
											type : "post",
											data : {
												'val' : s
											},
											success : function(data) {
												$('.partyCode')
														.autocomplete(
																{
																	source : data,
																	select : function(
																			event,
																			ui) {
																		event
																				.preventDefault();
																		var selectedArr = ui.item.value
																				.split(":");
																		this.value = $
																				.trim(selectedArr[1]);
																	}
																});

											},
											error : function(data, status, er) {
												console.log(data + "_" + status
														+ "_" + er);
											},

										});
							}
						});
	</script>

	<script>
		function remove(a, b) {
			var lastChar = a[a.length - 1];
			document.getElementById(a).value = "";
			document.getElementById('credit' + lastChar).value = 0;
			document.getElementById('debit' + lastChar).value = 0;

			var totalAccount = $('#totalAccounts').val();
			var totalCr = 0, totalDb = 0;
			for (i = 1; i <= totalAccount; i++) {
				var amt = $('#credit' + i).val();
				var amt1 = $('#debit' + i).val();
				if ($.isNumeric(amt)) {
					totalCr = totalCr + parseInt(amt);
				} else {
					document.getElementById("errorCredit" + i).innerHTML = "Invalid Amount";
					document.getElementById("divFormCredit" + i).className = 'alert alert-warning alert-dismissible';
					document.getElementById("divFormCredit" + i)
							.scrollIntoView();
				}
				if ($.isNumeric(amt1)) {
					totalDb = totalDb + parseInt(amt1);
				} else {
					document.getElementById("errorDebit" + i).innerHTML = "Invalid Amount";
					document.getElementById("divFormDebit" + i).className = 'alert alert-warning alert-dismissible';
					document.getElementById("divFormDebit" + i)
							.scrollIntoView();
				}
			}

			$('#totalDebit').html(totalDb);
			$('#totalCredit').html(totalCr);

			var row = document.getElementById(b);
			if (row.style.display == '') {
				row.style.display = 'none';
			} else {
				row.style.display = '';
			}
		}

		<c:choose>
		<c:when test="${param.msg == '1'}">
		$(document)
				.ready(
						function() {
							$("#typeError").addClass("form-group has-success");
							$("#errorTop")
									.html(
											"Journal Transfer Records Added Successfully Of Voucher No. : ${param.docNo}");
						});
		</c:when>
		<c:when test="${param.msg=='2'}">
		$(document).ready(function() {
			$("#typeError").addClass("form-group has-error");
			$("#errorTop").html("Fail to Add Journal Transfer Record.");
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

			//Remark validation
			var rem = document.getElementById("remark").value;
			if (rem == null || rem === "") {
				document.getElementById("errorRemark").innerHTML = error;
				document.getElementById("divFormRemark").className = 'alert alert-danger alert-dismissible';
				document.getElementById("divFormRemark").scrollIntoView();
				return false;
			}

			if (!(rem == null || rem === "")) {
				var recValid = /^[A-Za-z\d\-_\s]+$/i;
				if (!rec.match(recValid)) {
					document.getElementById("errorRemark").innerHTML = 'Invalid Receipt Number';
					document.getElementById("divFormRemark").className = 'alert alert-warning alert-dismissible';
					document.getElementById("divFormRemark").scrollIntoView();
					return false;
				}
				document.getElementById("errorRemark").innerHTML = "";
				document.getElementById("divFormRemark").className = 'form-group has-success';
			}

			//End Receipt Number validation

			return true;
		}

		function check() {

			var totalAccount = $('#totalAccounts').val();
			var totalCr = 0, totalDb = 0;
			for (i = 1; i <= totalAccount; i++) {
				if ($('#accountCode' + i).val() != "") {
					var amt = $('#credit' + i).val();
					var amt1 = $('#debit' + i).val();
					if ($('#credit' + i).val().length < 1)
						amt = 0;
					if ($('#debit' + i).val().length < 1)
						amt1 = 0;
					if ($.isNumeric(amt)) {
						totalCr = totalCr + parseInt(amt);
					} else {
						document.getElementById("errorCredit" + i).innerHTML = "Invalid Amount";
						document.getElementById("divFormCredit" + i).className = 'alert alert-warning alert-dismissible';
						document.getElementById("divFormCredit" + i)
								.scrollIntoView();
					}
					if ($.isNumeric(amt1)) {
						totalDb = totalDb + parseInt(amt1);
					} else {
						document.getElementById("errorDebit" + i).innerHTML = "Invalid Amount";
						document.getElementById("divFormDebit" + i).className = 'alert alert-warning alert-dismissible';
						document.getElementById("divFormDebit" + i)
								.scrollIntoView();
					}
				}

			}
			if (totalDb != totalCr) {
				alert('Credit not equal to Debit. Check amount and try again.');
			} else if (totalDb == totalCr) {
				$('#form').submit();
			}

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
									check();

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
																				'#AccountCodeName'
																						+ lastChar)
																				.html(
																						data["acName"]);

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
							//Party Details Auto fill
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
																				'#PartyCodeName'
																						+ lastChar)
																				.html(
																						data["supplName"]);

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
											'.credit',
											function(e) {
												e.preventDefault();
												var totalAccount = $(
														'#totalAccounts').val();
												var total = 0;
												for (i = 1; i <= totalAccount; i++) {
													var amt = $('#credit' + i)
															.val();
													if ($('#credit' + i).val().length < 1)
														amt = 0;
													if ($.isNumeric(amt)
															&& parseInt(amt) >= 0) {
														total = total
																+ parseInt(amt);
														document
																.getElementById("errorCredit"
																		+ i).innerHTML = "";
														document
																.getElementById("divFormCredit"
																		+ i).className = '';
													} else {
														document
																.getElementById("errorCredit"
																		+ i).innerHTML = "Invalid Amount";
														document
																.getElementById("divFormCredit"
																		+ i).className = 'alert alert-warning alert-dismissible';
														document
																.getElementById(
																		"divFormCredit"
																				+ i)
																.scrollIntoView();
													}
												}
												$('#totalCredit').html(total);

											});

							$('#accounts')
									.on(
											'blur',
											'.debit',
											function(e) {
												e.preventDefault();
												var totalAccount = $(
														'#totalAccounts').val();
												var total = 0;
												for (i = 1; i <= totalAccount; i++) {
													var amt = $('#debit' + i)
															.val();
													if ($('#debit' + i).val().length < 1)
														amt = 0;
													if ($.isNumeric(amt)
															&& parseInt(amt) >= 0) {
														total = total
																+ parseInt(amt);
														document
																.getElementById("errorDebit"
																		+ i).innerHTML = "";
														document
																.getElementById("divFormDebit"
																		+ i).className = '';
													} else {
														document
																.getElementById("errorDebit"
																		+ i).innerHTML = "Invalid Amount";
														document
																.getElementById("divFormDebit"
																		+ i).className = 'alert alert-warning alert-dismissible';
														document
																.getElementById(
																		"divFormDebit"
																				+ i)
																.scrollIntoView();
													}
												}
												$('#totalDebit').html(total);

											});

						});
	</script>