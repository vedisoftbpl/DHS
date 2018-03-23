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

								<div class="col-md-12">
									<div class="col-md-12" align="center">
										<h3>
											<b><u>MEMBER REPORT</u></b>
										</h3>
									</div>
									<div class="row" align="left">

										<div class="col-md-12">

											<h5>
												<label><b>Member No :</b>&emsp;${requestScope.member.memberNo}</label>&emsp;&emsp;${requestScope.member.prefix}
												${requestScope.member.memName}&emsp;${requestScope.member.fHRelation}
												${requestScope.member.fHRelName}&emsp;<b>Water
													Connection Date :</b>&nbsp;
												<fmt:formatDate type="date" pattern="dd/MM/yyyy"
													value="${requestScope.member.waterConnDate}" />
												&emsp;<b>Water Supply Date :</b>&nbsp;
												<fmt:formatDate type="date" pattern="dd/MM/yyyy"
													value="${requestScope.member.watSupplyDt}" />
												<br> <label><b>Plot No :</b>&nbsp;</label><span>${requestScope.member.plotNo}</span>&emsp;&emsp;<b>Size
													:</b>&nbsp;<span>${requestScope.member.plotSize}</span>&emsp;&emsp;<b>Project
													Name :</b>&nbsp;<span>${requestScope.projectName}&emsp;</span>&emsp;<b>Registration
													Date :</b>&nbsp;
												<fmt:formatDate type="date" pattern="dd/MM/yyyy"
													value="${requestScope.member.regDt}" />
												&emsp;&emsp;<b>NOC Date :</b>&nbsp;
												<fmt:formatDate type="date" pattern="dd/MM/yyyy"
													value="${requestScope.member.nocDt}" />
												<br> <b>Address :</b>&nbsp;${requestScope.member.address1}&nbsp;${requestScope.member.address2}&nbsp;${requestScope.member.address3}&emsp;&emsp;
											</h5>
										</div>
									</div>
									<div class="row" align="left">


										<div class="col-md-12">
											<h4>
												<u>Receipt Details</u>
											</h4>
											<table class="table" align="center">

												<!-- Table Header -->
												<thead
													style="border-top: 3px solid black; border-bottom: 3px solid black;">
													<tr>
														<th>Date</th>
														<th>Recept No.</th>
														<th>Cheque/DD</th>
														<th>Transfer</th>
														<th>Cash</th>
														<th>Transaction No</th>
														<th>Bank Name</th>
														<th>Remark</th>

													</tr>
												</thead>
												<tbody>
													<c:forEach items="${requestScope.receiptList}" var="rec">
														<tr>
															<td><fmt:formatDate type="date" pattern="dd/MM/yyyy"
																	value="${rec.receipt.recDte}" /></td>
															<td><c:out value="${rec.receipt.receiptNo}" /></td>

															<td><c:out value="${rec.receipt.balChq}" /></td>
															<c:choose>
																<c:when test="${rec.bankCode=='01'}">
																	<td><c:out value="${rec.receipt.amount}" /></td>
																</c:when>
																<c:otherwise>
																	<td><c:out value="0.0" /></td>
																</c:otherwise>
															</c:choose>
															<c:choose>
																<c:when test="${rec.bankCode!='01'}">
																	<td><c:out value="${rec.receipt.amount}" /></td>
																</c:when>
																<c:otherwise>
																	<td><c:out value="0.0" /></td>
																</c:otherwise>
															</c:choose>
															<td><c:out value="${rec.receipt.cDd}" /></td>
															<td><c:out value="${rec.receipt.branch}" /></td>
															<td><c:out value="${rec.receipt.remarks}" /></td>


														</tr>
													</c:forEach>
												</tbody>
												<!-- Table Body -->

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
														<th>Transaction Date</th>
														<th>Transaction No</th>
														<th>Amount</th>
														<th>Remark</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${requestScope.refPayList}" var="refund">
														<tr>
															<td><fmt:formatDate type="date" pattern="dd/MM/yyyy"
																	value="${refund.cdDate}" /></td>
															<td><c:out value="${refund.transactionNo}" /></td>

															<td><c:out value="${refund.amount}" /></td>
															<td><c:out value="${refund.remarks}" /></td>
														</tr>
													</c:forEach>
												</tbody>
												<!-- Table Body -->

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
														<th>Transfer Date</th>
														<th>Voucher Number</th>
														<th>Account Code</th>
														<th>Amount</th>
														<th>Remark</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<c:forEach items="${requestScope.transferList}"
															var="transfer">
															<tr>
																<td><fmt:formatDate type="date"
																		pattern="dd/MM/yyyy" value="${transfer.docDte}" /></td>
																<td><c:out value="${transfer.vrNo}" /></td>
																<td><c:out value="${transfer.acCode}" /></td>
																<td><c:out value="${transfer.amt}" /></td>

																<td><c:out value="${transfer.parti}" /></td>
															</tr>
														</c:forEach>
												</tbody>
												<!-- Table Body -->

											</table>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6" align="left">
											<table  >
												<tbody style="padding: 1px; font-size: 14px;">
													<tr>
														<td><label>&emsp;Total Receipt Amount &emsp;</label>
														</td>
														<td><label>:&emsp;</label></td>
														<td align="right"><span><fmt:setLocale
																	value="en_IN" /> <fmt:formatNumber
																	value="${requestScope.receiptTotalAmount}"
																	type="currency" /></span></td>
													</tr>

													<tr>
														<td><div id="refundAmount">

																<label>&emsp;Refund Amount &emsp;</label>

															</div></td>
														<td><div id="refundAmount">
																<label>:&emsp;</label>
															</div></td>
														<td align="right"><div id="refundAmount">

																<span><fmt:setLocale value="en_IN" /> <fmt:formatNumber
																		value="${requestScope.refundTotalAmount}"
																		type="currency" /></span>

															</div></td>
													</tr>

													<tr>
														<td colspan="3">-----------------------------------------------------------------------------------------------</td>
													</tr>

													<tr>
														<td><label>&emsp;Balance Amount &emsp;</label></td>
														<td><label>:&emsp;</label></td>
														<td align="right"><span><fmt:setLocale
																	value="en_IN" /> <fmt:formatNumber
																	value="${requestScope.balanceAmount}" type="currency" /></span>
														</td>
													</tr>
													<tr>
														<td colspan="3">------------------------------------------------------------------------------------------------</td>
													</tr>
													<tr>
														<td><div>

																<label>&emsp;Other Receipt &emsp;</label>

															</div></td>
														<td><div>
																<label>:&emsp;</label>
															</div></td>
														<td align="right"><div>

																<span><fmt:setLocale value="en_IN" /> <fmt:formatNumber
																		value="${requestScope.receiptTotalAmount}"
																		type="currency" /></span>

															</div></td>
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