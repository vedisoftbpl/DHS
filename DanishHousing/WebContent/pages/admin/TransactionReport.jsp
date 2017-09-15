<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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


		<style type="text /css">
.result {
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
	padding: 5px
}

.invoice-box table tr.item td {
	border-bottom: 1px solid #eee;
}

.invoice-box table tr.total td:nth-child(2) {
	border-top: 2px solid #eee;
	font-weight: bold;
}
</style>
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>Transaction Report</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Reports</a></li>
					<li class="active">Transaction Report</li>
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
							action="${pageContext.request.contextPath}/admin/pages/TransactionReportController"
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

									<div class="form-group" id="divFormAccountCode">
										<label>Account Code :</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-navicon"></i>
											</div>
											<input type="text" class="form-control accCode"
												placeholder="Account Code" id="accountCode"
												name="accountCode" />
										</div>
										<p id="errorAccountCode"></p>
									</div>

								</div>
								<div class="col-md-4">
									<label>Account Name :</label><br>
									<h4>
										<span id="AccountCodeName"></span>
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

					<div class="invoice-box" id="printTransactionReport"
						style="display: none;">
						<div class="row">

							<div class="col-md-12">
								<div class="col-md-12" align="center">
									<h1>
										<b><u>DANISH GRIH NIRMAN SAHAKARI SANSTHA MARYADIT
												BHOPAL</u></b>
									</h1>
								</div>
								<div class="row" align="center">

									<div class="col-md-12">
										<h4>GENERAL LEDGER FOR PERIOD ${requestScope.date1} TO
											${requestScope.date2}</h4>
									</div>
								</div>
								<div class="row" align="center">

									<div class="col-md-12">
										<h4>ACCOUNT CODE : ${requestScope.accCode} -
											${requestScope.accName}</h4>
									</div>
								</div>
								<div class="row" align="left">


									<div class="col-md-12">
										<h3>
											<u>Transactions Details</u>
										</h3>
										<table class="table" align="center">

											<!-- Table Header -->
											<thead
												style="border-top: 3px solid black; border-bottom: 3px solid black;">
												<tr>
													<th>Recept No./Vr. No.</th>
													<th>Date</th>
													<th>Particulars</th>
													<th>Mode</th>
													<th>Debit</th>
													<th>Credit</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${requestScope.transactionList}"
													var="tran">
													<tr>
														<td><c:out value="${tran.recNo}" /></td>
														<td><fmt:formatDate type="date" pattern="dd/MM/yyyy"
																value="${tran.date}" /></td>
														<td><c:out value="${tran.particular}" /></td>
														<td><c:out value="${tran.mode}" /></td>
														<td><c:choose>
																<c:when test="${tran.debit==0}">
																	<c:out value=" " />
																</c:when>
																<c:when test="${tran.debit!=0}">
																	<c:out value="${tran.debit}" />
																</c:when>
															</c:choose></td>
														<td><c:choose>
																<c:when test="${tran.credit==0}">
																	<c:out value=" " />
																</c:when>
																<c:when test="${tran.credit!=0}">
																	<c:out value="${tran.credit}" />
																</c:when>
															</c:choose></td>


													</tr>
												</c:forEach>
											</tbody>
											<!-- Table Body -->

										</table>
									</div>
								</div>


								<div class="row">
									<div class="col-md-6" align="left">
										<table>


											<tr>
												<td colspan="6">----------------------------------------------------------------------</td>
											</tr>

											<tr>
												<td><label>&emsp;Total Debit Amount &emsp;</label></td>
												<td><label>:&emsp;Rs &nbsp;</label></td>
												<td align="right"><span>${requestScope.totalDebitAmount}</span></td>
											</tr>

											<tr>
												<td><label>&emsp;Total Credit Amount &emsp;</label></td>
												<td><label>:&emsp;Rs &nbsp;</label></td>
												<td align="right"><span>${requestScope.totalCreditAmount}</span></td>
											</tr>
											<tr>
												<td colspan="6">----------------------------------------------------------------------</td>
											</tr>
										</table>
									</div>

								</div>
								<div class="row" align="center">

									<div>
										<button type=button class="btn btn-info " value="print"
											id="printButton"
											onclick="printFunction('printTransactionReport');">&emsp;Print&emsp;</button>
									</div>
								</div>
							</div>
						</div>
						<!-- User Form -->

						<!-- /.box-body -->



					</div>
					<div class="box-footer">View Transaction Report</div>
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
			$("#divFormAccountCode").addClass("form-group has-success");
			$("#errorAccountCode").html("");
			$("#typeError").addClass("form-group has-success");
			$("#errorTop").html("Records shown below.");
			$("#printTransactionReport").show();
		});
		</c:when>
		<c:when test="${requestScope.msg=='2'}">
		$(document).ready(function() {
			$("#typeError").addClass("form-group has-error");
			$("#errorTop").html("Could Not Fetch Records of given period.");
			$("#printTransactionReport").hide();
		});
		</c:when>
		</c:choose>
		function validateForm(form) {
			error = "Please enter this field";

			//Account Code Validation
			var accountCode = document.getElementById("accountCode").value;
			if (accountCode == null || accountCode === "") {
				document.getElementById("divFormAccountCode").className = 'alert alert-danger alert-dismissible';
				document.getElementById("errorAccountCode").innerHTML = error;
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
							$('#accountCode')
									.bind(
											"blur",
											function(e) {

												e.preventDefault();
												var code = $(this).val();
												if (code.length > 0) {
													var id = $(this).attr('id');
													$
															.ajax({
																url : 'http://localhost:8080/DanishHousing/ReceiptAutoFill',
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
																			'#AccountName')
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
																				'#AccountCodeName')
																				.html(
																						'<b>'
																								+ data["acName"]
																								+ '</b>');

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