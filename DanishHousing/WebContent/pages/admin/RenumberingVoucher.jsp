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
				<h1>Receipts</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Examples</a></li>
					<li class="active">Renumbering Voucher</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- Default box -->
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">Renumbering Voucher</h3>
						<div class="box-tools pull-right">
							<span id="today"><fmt:formatDate type="date"
									pattern="dd/MM/yyyy" value="${requestScope.today}" /></span>
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
						action="${pageContext.request.contextPath}/admin/pages/RenumberingVoucherController"
						method="post" onsubmit="return validateForm(this)">
						<div class="box-body">
							<div class="row">
								<!-- col -->
								<div class="col-md-4">

									<!--  Voucher Number -->
									<div class="form-group" id="divFormVoucherNumber">
										<label>Starting Voucher Number</label>
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa  fa-info-circle "></i></span> <input type="text"
												class="form-control" id="voucherNumber" name="voucherNumber" />
										</div>
										<p id="errorVoucherNumber"></p>
									</div>
									<!--  End Receipt Number -->
									<!-- /. form-group -->
								</div>
								<!-- /.col -->

								<div class="col-md-4">
									<!-- Starting Date -->
									<div class="form-group" id="divStartDate">
										<label>Starting Date :</label>
										<div class="input-group date">
											<div class="input-group-addon">
												<i class="fa fa-calendar"></i>
											</div>
											<input type="text" class="form-control pull-right datepicker"
												id="startDate" name="startDate" required />
										</div>
										<p id="errorStartDate"></p>
										<!-- /.input group -->
									</div>


									<!--End Closing Date -->
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
												id="closingDate" name="closingDate" required />
										</div>
										<p id="errorClosingDate"></p>
										<!-- /.input group -->
									</div>


									<!--End Closing Date -->
								</div>
							</div>
							<!-- /.row -->

							<!-- Row Default box -->


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
								<button type="submit" class="btn btn-primary btn-block btn-flat">Submit</button>
							</div>

						</div>

					</form>

					<!-- User Form -->

					<!-- /.box-body -->
					<div class="box-footer">Provide the Details For Renumbering Voucher</div>
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


	<script>
		<c:choose>
		<c:when test="${requestScope.msg == '1'}">
		$(document).ready(function() {
			$("#typeError").addClass("form-group has-success");
			$("#errorTop").html("Renumbering Done Succesfully");

		});
		</c:when>
		<c:when test="${requestScope.msg=='2'}">
		$(document).ready(function() {
			$("#typeError").addClass("form-group has-error");
			$("#errorTop").html("Problem Occured in Renumbering Voucher");
		});
		</c:when>
		</c:choose>
	</script>
	<script>
		function validateForm(form) {
			error = "Please fill this field .";

			//Transaction Number validation
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

			//End Transaction Number validation

			return true;
		}
	</script>