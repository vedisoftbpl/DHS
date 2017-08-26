<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
		<style>
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
						<form enctype="multipart/form-data"
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
						<div class=" row" id="printMemberReport">
							<div class=" invoice-box row">
								<div align="center">
									<h1>
										<b>MEMBER REPORT</b>
									</h1>
								</div>
								<div class="row" align="left">
									<div class="col-md-1"></div>
									<div class="col-md-10">
										<h3>
											<u>Member Details</u>
										</h3>
										<label>Member No :&emsp;<span>3362</span></label>&emsp;&emsp;
										<label>Mr. Rajendra Singh&emsp;S/O Mr. Mahendra Singh</label><br>
										<label>Plot No :&emsp;<span>K-4/555</span>&emsp;&emsp;Size
											:&emsp;<span>30*50 Sqft</span>&emsp;&emsp;Project Name
											:&emsp;<span>Danish Kunj -4</span></label>
									</div>
								</div>
								<div class="row" align="left">

									<div class="col-xs-1"></div>
									<div class="col-md-10">
										<h3>
											<u>Receipt Details</u>
										</h3>
										<table class="table" align="center">

											<!-- Table Header -->
											<thead
												style="border-top: 3px solid black; border-bottom: 3px solid black;">
												<tr>
													<th>Recept No.</th>
													<th>Cash</th>
													<th>Cheque Amount</th>
													<th>Chl/Tr</th>
													<th>Cheque No</th>
													<th>Remark</th>
													<th>Date</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>0374/2</td>
													<td>0.00</td>
													<td>5250.00</td>
													<td>0.00</td>
													<td>0549578</td>
													<td>Plot Cost</td>
													<td>06/01/1993</td>

												</tr>
												<tr>
													<td>0374/2</td>
													<td>0.00</td>
													<td>5250.00</td>
													<td>0.00</td>
													<td>0549578</td>
													<td>Plot Cost</td>
													<td>06/01/1993</td>
												</tr>
												<tr>
													<td>0374/2</td>
													<td>0.00</td>
													<td>5250.00</td>
													<td>0.00</td>
													<td>0549578</td>
													<td>Plot Cost</td>
													<td>06/01/1993</td>
												</tr>
												<tr>
													<td>0374/2</td>
													<td>0.00</td>
													<td>5250.00</td>
													<td>0.00</td>
													<td>0549578</td>
													<td>Plot Cost</td>
													<td>06/01/1993</td>
												</tr>
											</tbody>
											<!-- Table Body -->

										</table>
									</div>
								</div>
								<div class="row" align="left">

									<div class="col-xs-1"></div>
									<div class="col-md-10">
										<h3>
											<u>Refund Details</u>
										</h3>
										<table class="table" align="center">

											<!-- Table Header -->
											<thead
												style="border-top: 3px solid black; border-bottom: 3px solid black">
												<tr>
													<th>Cheque No</th>
													<th>Cheque Date</th>
													<th>Amount</th>
													<th>Remark</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>0549578</td>
													<td>06/01/1993</td>
													<td>5250.00</td>
													<td>Plot Cost</td>
												</tr>
												<tr>
												<tr>
													<td>0549578</td>
													<td>06/01/1993</td>
													<td>5250.00</td>
													<td>Plot Cost</td>
												</tr>


											</tbody>
											<!-- Table Body -->

										</table>
										<br>
										<div class="row">
											<div class="col-md-6" align="left">
												<table>
													<tr>
														<td><label>&emsp;Total Receipt Amount &emsp;</label></td>
														<td><label>:&emsp;Rs &nbsp;</label></td>
														<td><span>8357.00</span></td>
													</tr>

													<tr>
														<td><label>&emsp;Refund Amount &emsp;</label></td>
														<td><label>:&emsp;Rs &nbsp;</label></td>
														<td><span>8357.00</span></td>
													</tr>

													<tr>
														<td colspan="3">----------------------------------------------------------------------</td>
													</tr>

													<tr>
														<td><label>&emsp;Balance Amount &emsp;</label></td>
														<td><label>:&emsp;Rs &nbsp;</label></td>
														<td><span>8357.00</span></td>
													</tr>
													<tr>
														<td colspan="3">----------------------------------------------------------------------</td>
													</tr>
												</table>
											</div>
											<div class="col-md-6" align="right">
												<table>
													<tr>
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td><label>Other Receipt Rs :&nbsp;<span>8357.00</span>&emsp;
														</label></td>
													</tr>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- User Form -->
							<div class="row" align="center">

								<div>
									<button type=button class="btn btn-info "
										onclick="printFunction('printMemberReport');">&emsp;Print&emsp;</button>
								</div>
							</div>
							<!-- /.box-body -->
							<div class="box-footer">View Member Report</div>

							<!-- /.box-footer-->
						</div>
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

	<script>
		<c:choose>
		<c:when test="${requestScope.msg=='1'}">
		$(document).ready(function() {
			$("#typeMemberId").addClass("form-group has-success");
			$("#typeMemberId").html("");
			$("#memberReport").show();
		});
		</c:when>
		<c:when test="${requestScope.msg=='2'}">
		$(document).ready(function() {
			$("#typeMemberId").addClass("form-group has-error");
			$("#errorMemberId").html("Member doesn't exist");
			$("#memberReport").hide();
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
		function printFunction(printMemberReport) {
			var printContents = document.getElementById(printMemberReport).innerHTML;
			var originalContents = document.body.innerHTML;

			//document.body.innerHTML = printContents;
			
			document.body.innerHTML = 
		          "<html><head><title></title></head><body>" + 
		          printContents + "</body>";

			window.print();

			document.body.innerHTML = originalContents;
		}
	</script>