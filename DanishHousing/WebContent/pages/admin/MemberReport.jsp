<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../design/Top.jsp"%>
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

.invoice-box {
	max-width: 1000px;
	margin: auto;
	padding: 5px 30px 30px;
	border: 1px solid #eee;
	font-size: 16px;
	line-height: 16px;
	font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
	color: #555;
}

table {
	border-spacing: 0;
	border-collapse: collapse;
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

		<div class="se-pre-con"></div>


		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>Member Report</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Reports</a></li>
					<li class="active">Member Report</li>
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
							action="${pageContext.request.contextPath}/admin/pages/MemberReportController"
							method="post" onsubmit="return validateForm(this)">

							<div class="row">
								<div class="col-md-3"></div>
								<!-- col -->
								<div class="col-md-4">
									<!--  form-group -->
									<!-- Member ID -->
									<div class="form-group" id="divFormMemberID">
										<label>Member ID</label>
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-info-circle"></i></span> <input type="text"
												class="form-control" placeholder="Member ID" id="memberID"
												name="memberID" />
										</div>
										<p id="errorMemberID"></p>
									</div>
									<!-- End Member ID -->
									<!-- /.form-group -->

								</div>
								<div class="col-md-2">
									<label>&nbsp;</label>
									<button type="submit"
										class="btn btn-primary btn-block btn-flat" id="checkMember">View</button>
								</div>
							</div>
						</form>
						<div class="invoice-box" id="printMemberReport"
							style="display: none;">
							<div class="row">
								<div class="col-md-12" align="center">
									<h5>Danish Housing Co-op. Society Ltd.</h5>
								</div>

								<div class="col-md-12">
									<div class="col-md-12" align="center">
										<h3>
											<b><u>${requestScope.member.prefix}&nbsp;${requestScope.member.memName}&emsp;${requestScope.member.fHRelation}&nbsp;${requestScope.member.fHRelName}</u></b><br>
										</h3>
										<h4>${requestScope.member.address1}&nbsp;${requestScope.member.address2}&nbsp;${requestScope.member.address3}&emsp; <c:out value="${requestScope.member.rC}" /></h4>
									</div>
									<div class="row" align="left">

										<div class="col-md-12">
											<table style="font-size: 15px;">
												<tr>
													<td align="left"><b>Member No :</b></td>
													<td align="left">&emsp;${requestScope.member.memberNo}&emsp;</td>
													<td align="left"><b>Water Connection Date :</b></td>
													<td align="left">&emsp;<fmt:formatDate type="date"
															pattern="dd/MM/yyyy"
															value="${requestScope.member.waterConnDate}" />&emsp;
													</td>
													<td align="left"><b>Water Disconnection Date :</b></td>
													<td align="left">&emsp;<fmt:formatDate type="date"
															pattern="dd/MM/yyyy"
															value="${requestScope.member.watSupplyDt}" /></td>
												</tr>
												<tr>
													<td align="left"><b>Plot No :</b></td>
													<td align="left">&emsp;${requestScope.member.plotNo}&emsp;</td>
													<td align="left"><b>Plot Size :</b></td>
													<td align="left">&emsp;${requestScope.member.plotSize}&emsp;</td>
													<td align="left"><b>Project Name :</b></td>
													<td align="left">&emsp;${requestScope.projectName}</td>
												</tr>
												<tr>
													<td align="left"><b>DOR :</b></td>
													<td align="left">&emsp;<fmt:formatDate type="date"
															pattern="dd/MM/yyyy" value="${requestScope.member.regDt}" />&emsp;
													</td>
													<td align="left"><b>NOC Date :</b></td>
													<td align="left">&emsp;<fmt:formatDate type="date"
															pattern="dd/MM/yyyy" value="${requestScope.member.nocDt}" /></td>
													<td align="left"><b>Mutation No. :</b></td>
													<td align="left">&emsp;${requestScope.member.mutaNo1}</td>
												</tr>
												<tr>
													<td align="left"><b>Mutation Date :</b></td>
													<td align="left">&emsp;<fmt:formatDate type="date"
															pattern="dd/MM/yyyy"
															value="${requestScope.member.mutaDt1}" />&emsp;
													</td>
													<td align="left">&emsp;</td>
										
												</tr>
											</table>
										</div>
									</div>
									<div class="row" align="left">
										<c:set var="sumTotalChq" value="0.0"></c:set>
										<c:set var="sumTotalTrn" value="0.0"></c:set>
										<c:set var="sumTotalCash" value="0.0"></c:set>
										<c:set var="totalTransfer" value="0.0"></c:set>

										<div class="col-md-12">
											<h4>
												<u>Receipt Details</u>
											</h4>
											<table class="table">

												<!-- Table Header -->
												<thead
													style="border-top: 3px solid black; border-bottom: 3px solid black; text-align: center;">
													<tr>
														<th colspan="2"></th>
														<th colspan="3" style="text-align: center;">Amount</th>
														<th colspan="3"></th>
													</tr>
													<tr>
														<th style="text-align: center;">Date</th>
														<th style="text-align: center;">Recept No.</th>
														<th style="text-align: center;">CHQ/DD</th>
														<th style="text-align: center;">Transfer</th>
														<th style="text-align: center;">Cash</th>
														<th style="text-align: center;">CHQ/DD No.</th>
														<th style="text-align: center;">Bank</th>
														<th style="text-align: center;">Remark</th>

													</tr>
												</thead>
												<tbody>
													<c:forEach items="${requestScope.receiptList}" var="rec">
														<tr>
															<td><fmt:formatDate type="date" pattern="dd/MM/yyyy"
																	value="${rec.receipt.recDte}" /></td>
															<td><c:out value="${rec.receipt.receiptNo}" /></td>



															<c:choose>
																<c:when test="${rec.bankCode!='01'}">
																	<td align="right"><fmt:setLocale value="en_IN" />
																		<fmt:formatNumber value="${rec.receipt.amount}"
																			type="currency" currencySymbol=" " /></td>
																	<c:set var="sumTotalChq"
																		value="${sumTotalChq+rec.receipt.amount}"></c:set>
																</c:when>
																<c:otherwise>
																	<td align="right"><c:out value="0.0" /></td>
																</c:otherwise>
															</c:choose>
															<td align="right"><fmt:setLocale value="en_IN" /> <fmt:formatNumber
																	value="${rec.receipt.balChq}" type="currency"
																	currencySymbol=" " /> <c:set var="sumTotalTrn"
																	value="${sumTotalTrn+rec.receipt.balChq}"></c:set></td>
															<c:choose>
																<c:when test="${rec.bankCode=='01'}">
																	<td align="right"><fmt:setLocale value="en_IN" />
																		<fmt:formatNumber value="${rec.receipt.amount}"
																			type="currency" currencySymbol=" " /></td>
																	<c:set var="sumTotalCash"
																		value="${sumTotalCash+rec.receipt.amount}"></c:set>
																</c:when>
																<c:otherwise>
																	<td align="right"><c:out value="0.0" /></td>
																</c:otherwise>
															</c:choose>
															<td align="center"><c:out value="${rec.receipt.cDd}" /></td>
															<td><c:out value="${rec.receipt.branch}" /></td>
															<td><c:out value="${rec.receipt.remarks}" /></td>


														</tr>
													</c:forEach>
												</tbody>
												<!-- Table Body -->
												<tfoot style="font-size: 11pt; font-weight: bold;">
													<tr>
														<td colspan="2">Total Receipt</td>
														<td align="right"><span><fmt:setLocale
																	value="en_IN" /> <fmt:formatNumber
																	value="${sumTotalChq}" type="currency"
																	currencySymbol=" " /></span></td>
														<td align="right"><span><fmt:setLocale
																	value="en_IN" /> <fmt:formatNumber
																	value="${sumTotalTrn}" type="currency"
																	currencySymbol=" " /></span></td>
														<td align="right"><span><fmt:setLocale
																	value="en_IN" /> <fmt:formatNumber
																	value="${sumTotalCash}" type="currency"
																	currencySymbol=" " /></span></td>
														<td colspan="3"></td>
													</tr>
												</tfoot>
											</table>
										</div>
									</div>
									<div class="row" align="left" id="refund"
										style="display: none;">


										<div class="col-md-12">
											<h4>
												<u>Refund Details</u>
											</h4>
											<table class="table" align="center">

												<!-- Table Header -->
												<thead
													style="border-top: 3px solid black; border-bottom: 3px solid black">
													<tr>
														<th style="text-align: center;">Transaction Date</th>
														<th style="text-align: center;">CHQ/DD No.</th>
														<th style="text-align: center;">Amount</th>
														<th style="text-align: center;">Remark</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${requestScope.refPayList}" var="refund">
														<tr>
															<td><fmt:formatDate type="date" pattern="dd/MM/yyyy"
																	value="${refund.cdDate}" /></td>
															<td><c:out value="${refund.transactionNo}" /></td>

															<td align="right"><fmt:setLocale value="en_IN" /> <fmt:formatNumber
																	value="${refund.amount}" type="currency"
																	currencySymbol=" " /></td>
															<td><c:out value="${refund.remarks}" /></td>
														</tr>
													</c:forEach>
												</tbody>
												<!-- Table Body -->
												<tfoot style="font-size: 11pt; font-weight: bold;">
													<tr>
														<td colspan="2" align="right">Total Refund</td>
														<td align="right"><span><fmt:setLocale
																	value="en_IN" /> <fmt:formatNumber
																	value="${requestScope.refundTotalAmount}"
																	type="currency" currencySymbol=" " /></span></td>
														<td></td>
													</tr>
												</tfoot>
											</table>
										</div>
									</div>
									<div class="row" align="left" id="transfer"
										style="display: none;">


										<div class="col-md-12">
											<h4>
												<u>Transfer Details</u>
											</h4>
											<table class="table" align="center">

												<!-- Table Header -->
												<thead
													style="border-top: 3px solid black; border-bottom: 3px solid black">
													<tr>
														<th style="text-align: center;">Transfer Date</th>
														<th style="text-align: center;">Voucher Number</th>
														<th style="text-align: center;">Account Code</th>
														<th style="text-align: center;">Amount</th>
														<th style="text-align: center;">Remark</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<c:forEach items="${requestScope.transferList}"
															var="transfer">
															<c:if test="${transfer.vrNo!=0}">
															<tr>
																<td><fmt:formatDate type="date"
																		pattern="dd/MM/yyyy" value="${transfer.docDte}" /></td>
																<td><c:out value="${transfer.vrNo}" /></td>
																<td><c:out value="${transfer.acCode}" /></td>
																<td align="right"><fmt:setLocale value="en_IN" />
																	<fmt:formatNumber value="${transfer.amt}"
																		type="currency" currencySymbol=" " /> <c:set
																		var="totalTransfer"
																		value="${totalTransfer+transfer.amt}"></c:set></td>

																<td><c:out value="${transfer.parti}" /></td>
															</tr>
															</c:if>
														</c:forEach>
												</tbody>
												<!-- Table Body -->
												<tfoot style="font-size: 11pt; font-weight: bold;">
													<tr>
														<td colspan="3" align="right">Total Transfer Amount</td>
														<td align="right"><span><fmt:setLocale
																	value="en_IN" /> <fmt:formatNumber
																	value="${totalTransfer}" type="currency"
																	currencySymbol=" " /></span></td>
														<td></td>
													</tr>
												</tfoot>
											</table>
										</div>
									</div>
									<c:set var="totalReceipt"
										value="${sumTotalChq+sumTotalTrn+sumTotalCash}"></c:set>
									<div class="row">
										<div class="col-md-6" align="left">
											<table>
												<tbody style="padding: 1px; font-size: 14px;">
													<tr>
														<td><label>&emsp;Total Receipt &emsp;</label></td>
														<td><label>:&emsp;</label></td>
														<td align="right"><span><fmt:setLocale
																	value="en_IN" /> <fmt:formatNumber
																	value="${totalReceipt}" type="currency"
																	currencySymbol=" " /></span></td>
													</tr>

													<tr>
														<td><div id="refundAmount">

																<label>&emsp;Total Refund &emsp;</label>

															</div></td>
														<td><div id="refundAmount">
																<label>:&emsp;</label>
															</div></td>
														<td align="right"><div id="refundAmount">

																<span><fmt:setLocale value="en_IN" /> <fmt:formatNumber
																		value="${requestScope.refundTotalAmount}"
																		type="currency" currencySymbol=" " /></span>

															</div></td>
													</tr>


													<tr>
														<td><label>&emsp;Balance &emsp;</label></td>
														<td><label>:&emsp;</label></td>
														<td align="right"><span><fmt:setLocale
																	value="en_IN" /> <fmt:formatNumber
																	value="${requestScope.balanceAmount}" type="currency"
																	currencySymbol=" " /></span></td>
													</tr>


												</tbody>
											</table>
										</div>

									</div>
									<div class="row" align="center">

										<div>
											<button type=button class="btn btn-info " value="print"
												id="printButton"
												onclick="printFunction('printMemberReport');">&emsp;Print&emsp;</button>
										</div>
									</div>
								</div>
							</div>
							<!-- User Form -->

							<!-- /.box-body -->



						</div>
						<div class="box-footer">View Member Report</div>
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
	<!--  <script src="../../bootstrap/js/jquery.min.js"></script>-->
	<script src="../../bootstrap/js/modernizr.js"></script>
	<script>
		$(window).load(function() {
			// Animate loader off screen
			$(".se-pre-con").fadeOut("slow");
			;
		});
	</script>
	<script>
		<c:choose>
		<c:when test="${requestScope.flagr == '2'}">
		$(document).ready(function() {
			$("#refund").show();
		});
		</c:when>
		</c:choose>
		<c:choose>
		<c:when test="${requestScope.flagt == '2'}">
		$(document).ready(function() {
			$("#transfer").show();
		});
		</c:when>
		</c:choose>
		<c:choose>
		<c:when test="${requestScope.msg=='1'}">
		$(document).ready(function() {
			$("#divFormMemberID").addClass("form-group has-success");
			$("#errorMemberID").html("");
			$("#printMemberReport").show();
		});
		</c:when>
		<c:when test="${requestScope.msg=='2'}">
		$(document).ready(
				function() {
					$("#divFormMemberID").addClass(
							"alert alert-danger alert-dismissible");
					$("#errorMemberID").html("Member doesn't exist");
					$("#printMemberReport").hide();
				});
		</c:when>
		</c:choose>
		function validateForm(form) {
			error = "Please enter this field";

			//Member No. Validation
			var memberNo = document.getElementById("memberID").value;
			if (memberNo == null || memberNo === "") {
				document.getElementById("divFormMemberID").className = 'alert alert-danger alert-dismissible';
				document.getElementById("errorMemberID").innerHTML = error;
				return false;
			}
			if (!(memberNo == null || memberNo === "")) {
				var membno = /^\d*$/;
				if (!(memberNo.match(membno))) {
					document.getElementById("errorMemberID").innerHTML = "Invalid Member Number";
					document.getElementById("divFormMemberID").className = 'alert alert-warning alert-dismissible';
					return false;
				}
			}
			document.getElementById("divFormMemberID").className = 'form-group has-success';
			document.getElementById("errorMemberID").innerHTML = "";

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
	</script>