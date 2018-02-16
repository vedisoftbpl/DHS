<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" href="../../plugins/datepicker/datepicker3.css">
<!-- select style -->
<link rel="stylesheet" href="../../plugins/select2/select2.css">
<%@ include file="../design/Top.jsp"%>
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
	font-size: 10pt;
}

.table>tbody>tr>td {
	padding: 1px;
	font-size: 8pt;
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

		<div class="se-pre-con"></div>

		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>Creditors Transaction Report</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Reports</a></li>
					<li class="active">Creditors Transaction Report</li>
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
							action="${pageContext.request.contextPath}/admin/pages/SubledgerReportController"
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

									<div class="form-group" id="divFormPartyCode">
										<label>Party Code :</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-navicon"></i>
											</div>
											<input type="text" class="form-control accCode"
												placeholder="Party Code" id="partyCode"
												name="partyCode" />
										</div>
										<p id="errorPartyCode"></p>
									</div>

								</div>
								<div class="col-md-4">
									<label>Party Name :</label><br>
									<h4>
										<span id="partyCodeName"></span>
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
									<h2>
										<b><u>DANISH GRIH NIRMAN SAHAKARI SANSTHA MARYADIT
												BHOPAL</u></b>
									</h2>
								</div>
								<div class="row" align="center">

									<div class="col-md-12">
										<h5>CREDITORS LEDGER FOR PERIOD ${requestScope.date1} TO
											${requestScope.date2}</h5>
									</div>
								</div>
								<div class="row" align="center">

									<div class="col-md-12">
										<h5>
											<b>ACCOUNT :&emsp;</b> ${requestScope.partyCode} -
											${requestScope.partyName}
										</h5>
									</div>
								</div>
								<div class="row" align="left">


									<div class="col-md-12">
										<h4>
											<u>Transactions Details</u>
										</h4>
										<table class="table" align="center">

											<!-- Table Header -->
											<thead
												style="border-top: 2px solid black; border-bottom: 2px solid black;">
												<tr>
													<th>Date</th>
													<th>Particulars</th>
													<th>Receipt No./<br>Vr. No.</th>
													<th>Debit</th>
													<th>Credit</th>
													<th>Balance</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${requestScope.transactionList}"
													var="tran">
													
														<tr>
															<td><fmt:formatDate type="date" pattern="dd/MM/yyyy"
																	value="${tran.date}" /></td>
															<td><c:out value="${tran.particular}" /></td>
															<td><c:out value="${tran.recNo}" /></td>
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
															<td><c:out value="" /></td>
														</tr>
													</c:forEach>
													<tr>
													<td colspan=3><h5>
																<b>&emsp;&emsp;&emsp;&emsp;Total &emsp;:&nbsp;</b>
															</h5></td>
														<td><h5>
																<b><fmt:setLocale value="en_IN"/><fmt:formatNumber value="${requestScope.totalDebitAmount}" type="currency" /></b>
															</h5></td>
														<td><h5>
																<b><fmt:setLocale value="en_IN"/><fmt:formatNumber value="${requestScope.totalCreditAmount}" type="currency" /></b>
															</h5></td>
														<td>
															<h5>
																<b><fmt:setLocale value="en_IN"/><fmt:formatNumber value="${requestScope.balanceAmount}" type="currency" /></b>
															</h5>
														</td>
													</tr>
											</tbody>
											<!-- Table Body -->

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
	<script src="../../bootstrap/js/modernizr.js"></script>
	<script>
		$(window).load(function() {
			// Animate loader off screen
			$(".se-pre-con").fadeOut("slow");
			;
		});
	</script>
	<script>
		$('#partyCode')
				.bind(
						'keyup',
						function(e) {
							e.preventDefault();
							var s = $('#partyCode').val();
							if (s.length >= 1) {
								$
										.ajax({
											url : "http://localhost:8080/DanishHousing/AutoCompleteParty",
											type : "post",
											data : {
												'val' : s
											},
											success : function(data) {
												$('#partyCode')
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
							$('#partyCode')
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
																	'partycode' : code
																},

																success : function(
																		data) {
																	var bool = data["supplId"] === 0;
																	$(
																			'#divFormPartyCode')
																			.toggleClass(
																					'alert alert-danger alert-dismissible',
																					bool);
																	$(
																			'#partyCodeName')
																			.val(
																					'');
																	$(
																			'#errorPartyCode')
																			.empty();
																	if (data["supplId"] === 0) {
																		$(
																				'#errorPartyCode')
																				.text(
																						'Party Code doesn\'t exist');
																	} else {

																		$(
																				'#partyCodeName')
																				.html(
																						'<b>'
																								+ data["supplName"]
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