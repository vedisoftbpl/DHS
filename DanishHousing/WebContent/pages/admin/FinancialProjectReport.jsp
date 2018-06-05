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
				<h1>Financial Project Report</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Reports</a></li>
					<li class="active">Financial Project Report</li>
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
							action="${pageContext.request.contextPath}/admin/pages/FinancialProjectReportController"
							method="post" onsubmit="return validateForm(this)">

							<div class="row">
								<div class="col-md-4">

									<div class="form-group" id="divFormProjectCode">
										<label>Project Code :</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-navicon"></i>
											</div>
											<input type="text" class="form-control "
												placeholder="Project Code" id="projectCode"
												name="projectCode" />
										</div>
										<p id="errorProjectCode"></p>
									</div>

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

					<div class="invoice-box" id="printFinancialProjectReport"
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
										<h5>FINANCIAL POSITION OF MEMBERS AS ON
											${requestScope.date1}</h5>
										<h5>${requestScope.projectName}</h5>
									</div>
								</div>

								<div class="row" align="left">

									<c:set var="sumCost" value="0.0"></c:set>
									<c:set var="sumExtWork" value="0.0"></c:set>
									<c:set var="sumTotalCost" value="0.0"></c:set>
									<c:set var="sumRecAmt" value="0.0"></c:set>
									<c:set var="sumRefAmt" value="0.0"></c:set>
									<c:set var="sumBalAmt" value="0.0"></c:set>

									<div class="col-md-12">

										<table class="table" align="center">

											<!-- Table Header -->
											<thead
												style="border-top: 2px solid black; border-bottom: 2px solid black;">
												<tr>
													<th style="text-align: center;">S No.</th>
													<th style="text-align: center;">Member No.</th>
													<th style="text-align: center;">Member Name</th>
													<th style="text-align: center;">B. No.</th>
													<th style="text-align: center;">Size</th>
													<th style="text-align: center;">Cost</th>
													<th style="text-align: center;">Ext. Work</th>
													<th style="text-align: center;">Total Cost</th>
													<th style="text-align: center;">Received Amt</th>
													<th style="text-align: center;">Refund Amt</th>
													<th style="text-align: center;">Balance Amt</th>
													<th style="text-align: center;">Remark</th>
												</tr>
											</thead>
											<tbody>


												<c:forEach items="${requestScope.projectReportList}"
													var="rep" varStatus="loop">
													<tr>
														<td><c:out value="${loop.index+1}" /></td>
														<td><c:out value="${rep.memberNo}" /></td>
														<td><c:out value="${rep.memberName}" /></td>
														<td><c:out value="${rep.plotNo}" /></td>
														<td><c:out value="${rep.plotSize}" /></td>
														<td align="right"><fmt:setLocale value="en_IN" /> <fmt:formatNumber
																value="${rep.plotCost}" type="currency"
																currencySymbol=" " />
															<c:set var="sumCost" value="${sumCost+rep.plotCost}"></c:set></td>
														<td align="right"><fmt:setLocale value="en_IN" /> <fmt:formatNumber
																value="${rep.extraWork}" type="currency"
																currencySymbol=" " />
															<c:set var="sumExtWork"
																value="${sumExtWork+rep.extraWork}"></c:set></td>
														<td align="right"><fmt:setLocale value="en_IN" /> <fmt:formatNumber
																value="${rep.totalCost}" type="currency"
																currencySymbol=" " />
															<c:set var="sumTotalCost"
																value="${sumTotalCost+rep.totalCost}"></c:set></td>
														<td align="right"><fmt:setLocale value="en_IN" /> <fmt:formatNumber
																value="${rep.recAmount}" type="currency"
																currencySymbol=" " />
															<c:set var="sumRecAmt" value="${sumRecAmt+rep.recAmount}"></c:set></td>
														<td align="right"><fmt:setLocale value="en_IN" /> <fmt:formatNumber
																value="${rep.refAmount}" type="currency"
																currencySymbol=" " />
															<c:set var="sumRefAmt" value="${sumRefAmt+rep.refAmount}"></c:set></td>
														<td align="right"><fmt:setLocale value="en_IN" /> <fmt:formatNumber
																value="${rep.balAmount}" type="currency"
																currencySymbol=" " />
															<c:set var="sumBalAmt" value="${sumBalAmt+rep.balAmount}"></c:set></td>
														<td>&nbsp;</td>
													</tr>
												</c:forEach>



												<tr>
													<td colspan="5" align="center"><h5>
															<b>Total</b>
														</h5></td>
													<td align="right"><h5>
															<b><fmt:setLocale value="en_IN" /> <fmt:formatNumber
																	value="${sumCost}" type="currency" currencySymbol=" " /></b>
														</h5></td>
													<td align="right"><h5>
															<b><fmt:setLocale value="en_IN" /> <fmt:formatNumber
																	value="${sumExtWork}" type="currency"
																	currencySymbol=" " /></b>
														</h5></td>
													<td align="right"><h5>
															<b><fmt:setLocale value="en_IN" /> <fmt:formatNumber
																	value="${sumTotalCost}" type="currency"
																	currencySymbol=" " /></b>
														</h5></td>
													<td align="right"><h5>
															<b><fmt:setLocale value="en_IN" /> <fmt:formatNumber
																	value="${sumRecAmt}" type="currency" currencySymbol=" " /></b>
														</h5></td>
													<td align="right"><h5>
															<b><fmt:setLocale value="en_IN" /> <fmt:formatNumber
																	value="${sumRefAmt}" type="currency" currencySymbol=" " /></b>
														</h5></td>
													<td align="right"><h5>
															<b><fmt:setLocale value="en_IN" /> <fmt:formatNumber
																	value="${sumBalAmt}" type="currency" currencySymbol=" " /></b>
														</h5></td>
													<td>&nbsp;</td>
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
											onclick="printFunction('printFinancialProjectReport');">&emsp;Print&emsp;</button>
									</div>
								</div>
							</div>
						</div>
						<!-- User Form -->

						<!-- /.box-body -->



					</div>
					<div class="box-footer">Trial Balance</div>
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

		$('#projectCode').on('keyup', function(e) {
			e.preventDefault();
			var s = $(this).val();
			console.log(s);
			if (s.length >= 1) {
				$.ajax({
					url : "../../AutoCompleteProject",
					type : "post",
					data : {
						'val' : s
					},
					success : function(data) {
						$('#projectCode').autocomplete({
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
			$("#typeError").addClass("form-group has-success");
			$("#errorTop").html("Records shown below.");
			$("#printFinancialProjectReport").show();
		});
		</c:when>
		<c:when test="${requestScope.msg=='2'}">
		$(document).ready(function() {
			$("#typeError").addClass("form-group has-error");
			$("#errorTop").html("Could Not Fetch Records of given period.");
			$("#printFinancialProjectReport").hide();
		});
		</c:when>
		</c:choose>
		function validateForm(form) {
			error = "Please enter this field";

			//Project Code Validation
			var projectCode = document.getElementById("projectCode").value;
			if (projectCode == null || projectCode === "") {
				document.getElementById("divProjectCode").className = 'alert alert-danger alert-dismissible';
				document.getElementById("errorProjectCode").innerHTML = error;
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
	</script>