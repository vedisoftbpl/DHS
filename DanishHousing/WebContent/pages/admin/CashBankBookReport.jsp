<%@ page import="java.util.Date"%>
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

.invoice-box {
	max-width: 1100px;
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
							action="${pageContext.request.contextPath}/admin/pages/CashBankBookReportController"
							method="post" onsubmit="return validateForm(this)"  target="_blank">

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

							<div class="col-md-12" align="center">
								<h2>
									<b><u>DANISH GRIH NIRMAN SAHAKARI SANSTHA MARYADIT
											BHOPAL</u></b>
								</h2>
							</div>
							<div class="row" align="center">

								<div class="col-md-12">
									<h4>CASH/BANK - BOOK FOR PERIOD ${requestScope.date1} TO
										${requestScope.date2}</h4>
								</div>
							</div>

							<div class="row" align="center">
								<div class="col-md-1"></div>
								<div class="col-md-11">

									<table class="table">

										<thead
											style="border-top: 2px solid black; border-bottom: 2px solid black;">
											<tr>
												<th colspan="6"><div align="center">RECEIPT</div></th>
												<th colspan="6"><div align="center">PAYMENTS</div></th>
											</tr>
											<tr>
												<th>Doc No.</th>
												<th>Particulars</th>
												<th>Adjustments</th>
												<th colspan="2">Bank</th>
												<th>Cash</th>
												<th>Voucher No.</th>
												<th>Particulars</th>
												<th>Adjustments</th>
												<th colspan="2">Bank</th>
												<th>Cash</th>
											</tr>
										</thead>

										<tbody>
											<c:forEach items="${requestScope.dailyTranList}" var="tran">
												<tr>
													<td colspan="2"><b><fmt:formatDate type="date"
																pattern="dd/MM/yyyy" value="${tran.currDate}" /></b></td>
												</tr>
												<tr>
													<td colspan="12">&nbsp;</td>
												</tr>
												<tr>
													<td colspan="2"><b><c:out value="OPENING BALANCE" /></b></td>
													<td>&nbsp;</td>
													<td colspan="2"><table class="table">

															<tbody>
																<c:forEach items="${tran.openingBalance}" var="opBal">

																	<tr>
																		<c:choose>
																			<c:when test="${opBal.acCode == '01'}">
																				<c:set var="cashBal1" value="${opBal.recAmount}" />
																			</c:when>
																			<c:otherwise>
																				<td><c:out value="${opBal.acName}" /></td>
																				<td><fmt:setLocale value="en_IN" /> <fmt:formatNumber
																						value="${opBal.recAmount}" type="currency" /></td>
																			</c:otherwise>
																		</c:choose>
																	</tr>

																</c:forEach>
															</tbody>
														</table></td>
													<td><fmt:setLocale value="en_IN" /> <fmt:formatNumber
															value="${cashBal1}" type="currency" /></td>
													<td colspan="6">&nbsp;</td>
												</tr>


												<c:forEach items="${tran.dailyTransaction}" var="dRec">
													<tr>
														<c:choose>
															<c:when test="${dRec.docType == 'D'}">
																<td><c:out value="${dRec.docNo}" /></td>
																<c:choose>
																	<c:when test="${dRec.membNo ==0}">
																		<td><b><c:out value="${dRec.accName}" /></b><br>
																			<c:out value="${dRec.remarks}" /></td>
																	</c:when>
																	<c:otherwise>
																		<td><b><c:out value="${dRec.accName}" /></b><br>
																			<c:out value="${dRec.remarks}" />&emsp;MS No.&nbsp;<c:out
																				value="${dRec.membNo}" /></td>
																	</c:otherwise>
																</c:choose>
																<td><div align="center">
																		<c:out value="${dRec.adjustment}" />
																	</div></td>
																<c:forEach items="${requestScope.accounts}" var="bank">
																	<c:choose>
																		<c:when test="${bank.key ==dRec.bkCode}">
																			<c:choose>
																				<c:when test="${dRec.adjustment == 0.0}">
																					<c:choose>
																						<c:when test="${bank.key =='01'}">
																							<td>&nbsp;</td>
																						</c:when>
																						<c:otherwise>
																							<td><div align="center">
																									<c:out value="${dRec.amount}-(${bank.value})" />
																								</div></td>
																						</c:otherwise>
																					</c:choose>
																				</c:when>
																				<c:otherwise>
																					<c:choose>
																						<c:when test="${bank.key =='01'}">
																							<td>&nbsp;</td>
																						</c:when>
																						<c:otherwise>
																							<td><div align="center">
																									<c:out value="${bank.value}" />
																								</div></td>
																						</c:otherwise>
																					</c:choose>
																				</c:otherwise>

																			</c:choose>
																		</c:when>
																	</c:choose>
																</c:forEach>
																<c:choose>
																	<c:when test="${dRec.adjustment == 0.0}">
																		<c:choose>
																			<c:when test="${dRec.bkCode =='01'}">
																				<td><div align="center">
																						<c:out value="${dRec.amount}-(Cash)" />
																					</div></td>
																			</c:when>
																			<c:otherwise>
																				<td>&nbsp;</td>
																			</c:otherwise>
																		</c:choose>
																	</c:when>
																	<c:otherwise>
																		<c:choose>
																			<c:when test="${dRec.bkCode =='01'}">
																				<td><c:out value="Cash" /></td>
																			</c:when>
																			<c:otherwise>
																				<td>&nbsp;</td>
																			</c:otherwise>
																		</c:choose>
																	</c:otherwise>

																</c:choose>
															</c:when>
															<c:otherwise>
																<td colspan="6">&nbsp;</td>

															</c:otherwise>
														</c:choose>
														<c:choose>
															<c:when test="${dRec.docType == 'W'}">
																<td><c:out value="${dRec.docNo}" /></td>
																<td><b><c:out value="${dRec.accName}" /></b><br>
																	<c:out
																		value="${dRec.remarks} (Chq No/Tr No :${dRec.chqNo})" /></td>
																<td><div align="center">
																		<c:out value="${dRec.adjustment}" />
																	</div></td>
																<c:forEach items="${requestScope.accounts}" var="bank">
																	<c:choose>
																		<c:when test="${bank.key ==dRec.bkCode}">
																			<c:choose>
																				<c:when test="${dRec.adjustment == 0.0}">
																					<c:choose>
																						<c:when test="${bank.key =='01'}">
																							<td>&nbsp;</td>
																						</c:when>
																						<c:otherwise>
																							<td><div align="center">
																									<c:out value="${dRec.amount}-(${bank.value})" />
																								</div></td>
																						</c:otherwise>
																					</c:choose>
																				</c:when>
																				<c:otherwise>
																					<c:choose>
																						<c:when test="${bank.key =='01'}">
																							<td>&nbsp;</td>
																						</c:when>
																						<c:otherwise>
																							<td><div align="center">
																									<c:out value="${bank.value}" />
																								</div></td>
																						</c:otherwise>
																					</c:choose>
																				</c:otherwise>

																			</c:choose>
																		</c:when>

																	</c:choose>
																</c:forEach>
																<c:choose>
																	<c:when test="${dRec.adjustment == 0.0}">
																		<c:choose>
																			<c:when test="${dRec.bkCode =='01'}">
																				<td><div align="right">
																						<c:out value="${dRec.amount}-(Cash)" />
																					</div></td>
																			</c:when>
																			<c:otherwise>
																				<td>&nbsp;</td>
																			</c:otherwise>
																		</c:choose>
																	</c:when>
																	<c:otherwise>
																		<c:choose>
																			<c:when test="${dRec.bkCode =='01'}">
																				<td><div align="right">
																						<c:out value="Cash" />
																					</div></td>
																			</c:when>
																			<c:otherwise>
																				<td>&nbsp;</td>
																			</c:otherwise>
																		</c:choose>
																	</c:otherwise>

																</c:choose>
															</c:when>
															<c:otherwise>
																<td colspan="6">&nbsp;</td>
															</c:otherwise>
														</c:choose>
													</tr>

												</c:forEach>
												<tr>
													<td colspan="6">&nbsp;</td>
													<td colspan="2"><b><c:out value="CLOSING BALANCE" /></b></td>
													<td>&nbsp;</td>
													<td colspan="2">
														<table class="table">
															<tbody>
																<c:forEach items="${tran.closingBalance}" var="clsBal">

																	<tr>
																		<c:choose>
																			<c:when test="${clsBal.acCode == '01'}">
																				<c:set var="cashBal2" value="${clsBal.payAmount}" />
																			</c:when>
																			<c:otherwise>
																				<td><c:out value="${clsBal.acName}" /></td>
																				<td><fmt:setLocale value="en_IN" /> <fmt:formatNumber
																						value="${clsBal.payAmount}" type="currency" /></td>
																			</c:otherwise>
																		</c:choose>
																	</tr>

																</c:forEach>
															</tbody>
														</table>
													</td>
													<td><fmt:setLocale value="en_IN" /> <fmt:formatNumber
															value="${cashBal2}" type="currency" /></td>
												</tr>
												<tr
													style="border-top: 2px solid black; border-bottom: 2px solid black;">

													<td colspan="2">TOTAL&emsp;:&emsp;</td>
													<td colspan="2"><fmt:setLocale value="en_IN" /> <fmt:formatNumber
															value="${tran.totalRec}" type="currency" /></td>

													<td colspan="4"></td>
													<td><fmt:setLocale value="en_IN" /> <fmt:formatNumber
															value="${tran.totalPay}" type="currency" /></td>
													<td colspan="3"></td>

												</tr>
												<tr>
													<td colspan="12"><p id="total"
															style="background-color: black;">&nbsp;</p></td>

												</tr>
												<tr>
													<td><div style="page-break-after: always;"></div></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>

								</div>

							</div>


						</div>
					</div>
					<div class="row" align="center">

						<div>
							<button type=button class="btn btn-info " value="print"
								id="printButton" onclick="printFunction();">&emsp;Print&emsp;</button>
						</div>
					</div>
					<!-- User Form -->

					<!-- /.box-body -->



				</div>
				<div class="box-footer">View Cash/Bank Book</div>
				<!-- /.box-footer-->
				<!-- /.box -->

			</section>
		</div>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->
	<%@ include file="../design/Footer.jsp"%>
	<!-- Control Sidebar -->
	<jsp:include page="../design/SideBar.jsp" flush="true" />

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
		function printFunction() {
			window.print();
			/*var divToPrint = document.getElementById('printBankCashReport');
			var htmlToPrint = '<html><head>' + '<style type="text/css">'
					+ '.table>thead>tr>th {' + 'border-top: 2px solid black;'
					+ 'border-bottom: 2px solid black;'
					+ 'border-left: 2px solid black;'
					+ 'border-right: 2px solid black;' + 'padding;0 ;' + '}'
					+ '#total {' + 'background-color : black;' + '}'
					+ '</style></head><body>';
			htmlToPrint += divToPrint.outerHTML;
			newWin = window.open("");
			newWin.document.write(htmlToPrint);
			newWin.document.write('</body></html>');
			newWin.print();
			newWin.close();*/
		}
		//	function printFunction(printDiv) {
		//		var printContents = document.getElementById(printDiv).innerHTML;
		//		var originalContents = document.body.innerHTML;

		//		document.body.innerHTML = printContents;

		//		document.body.innerHTML = "<html><head><title></title></head><body>"
		//				+ printContents + "</body>";

		//		window.print();

		//		document.body.innerHTML = originalContents;
		//	}

		
	</script>