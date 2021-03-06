<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" href="../../plugins/datepicker/datepicker3.css">
<!-- select style -->
<link rel="stylesheet" href="../../plugins/select2/select2.css">
<%@ include file="../design/Top.jsp"%>
<div class="se-pre-con"></div>
<style type="text /css">.result {
	height: 200px;
	overflow: auto;
}
</style>
<style type="text/css" media="print">
@media print {
	.result {
		height: 100%;
		overflow: visible;
	}
}
</style>
<style>
.no-js #loader {
	display: none;
}

.js #loader {
	display: block;
	position: absolute;
	left: 100px;
	top: 0;
}

.se-pre-con {
	position: fixed;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%;
	z-index: 9999;
	background: url(../../../DanishHousing/pages/photos/Eclipse.gif) center
		no-repeat #fff;
}

body, html {
	width: 100%;
	height: 100%;
}

.print {
	position: fixed;
	overflow: auto;
	width: 100%;
	height: 100%;
	z-index: 100000; /* CSS
		doesn't support infinity */ /* Any other Print Properties */
}

#printTransactionReport {
	overflow-x: scroll;
	width: auto;
	white-space: nowrap;
}

div.scrollmenu {
	background-color: #333;
	overflow: auto;
	white-space: nowrap;
}

.invoice-box {
	max-width: 1000px;
	margin: auto;
	padding: 30px;
	border: 1px solid #eee;
	font-size: 16px;
	line-height: 16px;
	font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
	color: #555;
}

.table>thead>tr>th {
	border: 1px solid #060606;
	padding: 1px;
	font-size: 9pt;
}

.table>tbody>tr>td {
	padding: 1px;
	font-size: 8pt;
}

.invoice-box table tr.item td {
	border-bottom: 1px solid #eee;
}

.invoice-box table tr.total td:nth-child(2) {
	border-top: 2px solid #eee;
	font-weight: bold;
}
</style>
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
				<h1>Cash/Bank - Book Report</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Reports</a></li>
					<li class="active">Cash/Bank - Book Report</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<!-- Default box -->
				<div class="box">
					<div class="box-header with-border">

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
					<div class="box-body">
						<form
							action="${pageContext.request.contextPath}/admin/pages/CashBankBookController"
							method="post" onsubmit="return validateForm(this)">

							<div class="row">
								<div class="col-md-4">
									<!-- Opening Date -->
									<div class="form-group" id="divOpeningDate">
										<label>Opening Date :</label>
										<div class="input-group date">
											<div class="input-group-addon">
												<i class="fa fa-calendar"></i>
											</div>
											<input type="text" class="form-control pull-right datepicker"
												id="openingDate" name="openingDate" />
										</div>
										<p id="errorOpeningDate"></p>
										<!-- /.input group -->
									</div>

									<!--End Opening Date -->
								</div>
								<div class="col-md-4">
									<!-- Closing Date -->
									<div class="form-group" id="divClosingDate">
										<label>Closing Date :</label>
										<div class="input-group date">
											<div class="input-group-addon">
												<i class="fa fa-calendar"></i>
											</div>
											<input type="text" class="form-control pull-right datepicker"
												id="closingDate" name="closingDate" />
										</div>
										<p id="errorClosingDate"></p>
										<!-- /.input group -->
									</div>


									<!--End Closing Date -->
								</div>
							</div>

							<div class="row">
								<div class="col-md-4">

									<div class="form-group" id="divFormBankName">
										<label>Bank Name :</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-navicon"></i>
											</div>
											<select class="form-control select2" id="BankName"
												name="BankName" style="width: 100%;">
												<option value="">--- Select Bank Name ---</option>
												<c:forEach items="${requestScope.accounts}" var="val">
													<option value="${val.key}">${val.value}</option>
												</c:forEach>
											</select>

										</div>
										<p id="errorBankName"></p>
									</div>

								</div>
								<div class="col-md-4">
									<label>Bank Code :</label><br>
									<h4>
										<span id="BankCode"></span>
									</h4>
								</div>
							</div>
							<div class="row">
								<input id="operation" name="operation" type="hidden"
									value="create">
								<div class="col-xs-4" align="center">
									<button type="reset" class="btn btn-block btn-danger">Cancel</button>
								</div>
								<div class="col-xs-4" align="center">
									<button type="submit"
										class="btn btn-primary btn-block btn-flat">Submit</button>
								</div>

							</div>
						</form>
					</div>

					<div class="invoice-box " id="printBankCashReport"
						style="display: none;">
						<div class="row">

							<div class="col-md-12">
								<div class="col-md-12" align="center">
									<h3>
										<b><u>DANISH GRIH NIRMAN SAHAKARI SANSTHA MARYADIT
												BHOPAL</u></b>
									</h3>
								</div>
								<div class="row" align="center">

									<div class="col-md-12">
										<h5>CASH/BANK - BOOK FOR PERIOD ${requestScope.date1} TO
											${requestScope.date2}</h5>
									</div>
								</div>
								<div class="row" align="center">

									<div class="col-md-12">
										<span style="display: inline-block;">
											<h5>
												<b>BANK CODE :</b> ${requestScope.bkCode} ,-
											</h5>
											<h5>
												<b>BANK NAME : </b>${requestScope.bkName}
											</h5>
										</span>

									</div>
								</div>
								<div class="row" align="left">

									<div align="left">
										<p>
											<b>&emsp;Opening Balance :&emsp;</b>
											<fmt:setLocale value="en_IN" />
											<fmt:formatNumber value="${requestScope.openingBalance}"
												type="currency" currencySymbol=" " />
										</p>
									</div>
									<div class="col-md-12">

										<table class="table">

											<!-- Table Header -->
											<thead
												style="border-top: 3px solid black; border-bottom: 3px solid black; text-align: center;">
												<tr>
													<th><div align="center">
															Receipt No./<br>Vr. No.
														</div></th>
													<th><div align="center">Date</div></th>
													<th><div align="center">Cheque No.</div></th>
													<th><div align="center">Particulars</div></th>
													<th><div align="center">Receipt</div></th>
													<th><div align="center">Payments</div></th>

												</tr>
											</thead>
											<tbody>
												<c:forEach items="${requestScope.transactionList}"
													var="dRec">
													<tr>

														<td><c:out value="${dRec.docNo}" /></td>


														<td><fmt:formatDate type="date" pattern="dd/MM/yyyy"
																value="${dRec.docDate}" /></td>
														<td><c:out value="${dRec.chqNo}" /></td>
														<c:choose>
															<c:when test="${dRec.membNo ==0}">
																<td width="23%" align="left"><b><c:out
																			value="${dRec.accName}" /></b><br> <c:out
																		value="${dRec.remarks}" /></td>
															</c:when>
															<c:otherwise>
																<td width="23%" align="left"><b><c:out
																			value="${dRec.accName}" /></b><br> <c:out
																		value="${dRec.remarks}" /><br>MS No.&nbsp;<c:out
																		value="${dRec.membNo}" />&emsp;<c:out
																		value="${dRec.membName}" /></td>
															</c:otherwise>
														</c:choose>
														<c:choose>
															<c:when test="${dRec.docType=='D'}">
																<td align="right"><fmt:setLocale value="en_IN" />
																	<fmt:formatNumber value="${dRec.amount}"
																		type="currency" currencySymbol=" " /></td>
															</c:when>
															<c:otherwise>
																<td align="right"><c:out value=" " /></td>
															</c:otherwise>
														</c:choose>
														<c:choose>
															<c:when test="${dRec.docType=='W'}">
																<td align="right"><fmt:setLocale value="en_IN" />
																	<fmt:formatNumber value="${dRec.amount}"
																		type="currency" currencySymbol=" " /></td>
															</c:when>
															<c:otherwise>
																<td align="right"><c:out value=" " /></td>
															</c:otherwise>
														</c:choose>
													</tr>
												</c:forEach>
											</tbody>
											<!-- Table Body -->

										</table>
									</div>
									<div class="row" align="left">
										<div class="col-md-12">
											<table>

												<tr>
													<td><label>&emsp;Total Receipts &emsp;</label></td>
													<td><label>:&emsp;</label></td>
													<td align="right"><span><fmt:setLocale
																value="en_IN" /> <fmt:formatNumber
																value="${requestScope.totalCreditAmount}"
																type="currency" currencySymbol=" " /></span></td>
												</tr>
												<tr>
													<td><label>&emsp;Total Payments &emsp;</label></td>
													<td><label>:&emsp;</label></td>
													<td align="right"><span><fmt:setLocale
																value="en_IN" /> <fmt:formatNumber
																value="${requestScope.totalDebitAmount}" type="currency"
																currencySymbol=" " /></span></td>
												</tr>

												<tr>
													<td><label>&emsp;Closing Balance &emsp;</label></td>
													<td><label>:&emsp;</label></td>
													<td align="right"><span><fmt:setLocale
																value="en_IN" /> <fmt:formatNumber
																value="${requestScope.closingBalance}" type="currency"
																currencySymbol=" " /></span></td>
												</tr>
											</table>
										</div>

									</div>

								</div>



								<div class="row" align="center">

									<div>
										<button type=button class="btn btn-info " value="print"
											id="printButton"
											onclick="printFunction('printBankCashReport');">&emsp;Print&emsp;</button>
									</div>
								</div>
							</div>
						</div>
						<!-- User Form -->

						<!-- /.box-body -->



					</div>
					<div class="box-footer">View Cash/Bank Book</div>
					<!-- /.box-footer-->
					<!-- /.box -->
				</div>
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
	<script src="../../bootstrap/js/modernizr.js"></script>
	<script>
		$(window).load(function() {
			// Animate loader off screen
			$(".se-pre-con").fadeOut("slow");
			;
		});
	</script>
	<script>
		$(function() {
			//Date picker
			$('.datepicker').datepicker({
				format : 'dd/mm/yyyy',
				autoclose : true
			});

			//Initialize Select2 Elements
			$(".select2").select2();
		});

		<c:choose>
		<c:when test="${requestScope.msg=='1'}">
		$(document).ready(function() {
			$("#divFormBankName").addClass("form-group has-success");
			$("#errorBankName").html("");
			$("#typeError").addClass("form-group has-success");
			$("#errorTop").html("Records shown below.");
			$("#printBankCashReport").show();
		});
		</c:when>
		<c:when test="${requestScope.msg=='2'}">
		$(document).ready(function() {
			$("#typeError").addClass("form-group has-error");
			$("#errorTop").html("Could not fetch records of given period.");
			$("#printBankCashReport").hide();
		});
		</c:when>
		</c:choose>
		function validateForm(form) {
			error = "Please enter this field";

			//Account Code Validation
			var bankName = document.getElementById("BankName").value;
			if (bankName == null || bankName === "") {
				document.getElementById("divFormBankName").className = 'alert alert-danger alert-dismissible';
				document.getElementById("errorBankName").innerHTML = error;
				return false;
			}

			//Opening Date Validation
			var openingDate = document.getElementById("openingDate").value;
			if (openingDate == null || openingDate === "") {
				document.getElementById("errorOpeningDate").innerHTML = error;
				document.getElementById("divOpeningDate").className = 'alert alert-danger alert-dismissible';
				return false;
			}

			//Closing Date Validation
			var closingDate = document.getElementById("closingDate").value;
			if (closingDate == null || closingDate === "") {
				document.getElementById("errorClosingDate").innerHTML = error;
				document.getElementById("divClosingDate").className = 'alert alert-danger alert-dismissible';
				return false;
			}

		}
		function printFunction(printDiv) {
			var printContents = document.getElementById(printDiv).innerHTML;
			var originalContents = document.body.innerHTML;

			document.body.innerHTML = printContents;

			document.body.innerHTML = "<html><head><title></title></head><body>"
					+ printContents + "</body>";

			window.print();

			document.body.innerHTML = originalContents;
		}

		//Auto fill data
		$(document)
				.ready(
						function() {
							$('#BankName')
									.on(
											"change",
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
																	'code' : code
																},

																success : function(
																		data) {
																	var bool = data["bkCode"] === 0;
																	$(
																			'#divFormBankName')
																			.toggleClass(
																					'alert alert-danger alert-dismissible',
																					bool);
																	$(
																			'#BankName')
																			.val(
																					'');
																	$(
																			'#errorBankName')
																			.empty();
																	if (data["bkCode"] === 0) {
																		$(
																				'#errorBankName')
																				.text(
																						'Bank Code doesn\'t exist');
																	} else {

																		$(
																				'#BankCode')
																				.html(
																						'<b>'
																								+ data["bkCode"]
																								+ '</b>');

																		$(
																				"#BankName option[value="
																						+ data["bkCode"]
																						+ "]")
																				.prop(
																						'selected',
																						'selected');

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