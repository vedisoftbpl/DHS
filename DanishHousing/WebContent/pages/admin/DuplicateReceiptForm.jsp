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
					<li class="active">Receipts</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- Default box -->
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">Duplicate Receipts Form</h3>
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
						action="${pageContext.request.contextPath}/admin/pages/ReceiptFormController"
						method="post" onsubmit="return validateForm(this)">
						<div class="box-body">
							<div class="row">
								<!-- col -->
								<div class="col-md-4">
								
									<!--  Receipt Number -->
									<div class="form-group" id="divFormReceiptNumber">
										<label>Receipt Number</label>
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa  fa-info-circle "></i></span> <input type="text"
												class="form-control" value="${requestScope.recNo}"
												id="receiptNumber" name="receiptNumber" />
										</div>
										<p id="errorReceiptNumber"></p>
									</div>
									<!--  End Receipt Number -->
									<!-- /. form-group -->
								</div>
								<!-- /.col -->
								<!-- col -->
								
								
									
								</div>
								<!-- /.col -->
								<!-- col -->
								<div class="col-md-4">
									<!--  form group -->
								<!-- /.col -->
							</div>
							<!-- /.row -->
							
							<!-- Row Default box -->
							
								
							<!-- /.Row Default box -->
						</div>
						<!-- /.box-body -->

						<input id="operation" name="operation" type="hidden"
							value="duplicate">

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
					<div class="box-footer">Provide the Details For duplicate 
						receipt</div>
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
		<c:when test="${param.msg == '1'}">
		$(document)
				.ready(
						function() {
							$("#typeError").addClass("form-group has-success");
							$("#errorTop").html(
									"Receipt available of receipt no: ${param.docNo}");
							window
									.open(
											"../../admin/pages/ReceiptPrintController?docNo=${param.docNo}",
											"Receipt : ${requestScope.docNo}",
											"_blank");
						});
		</c:when>
		<c:when test="${param.msg=='2'}">
		$(document).ready(function() {
			$("#typeError").addClass("form-group has-error");
			$("#errorTop").html("Receipt not found.");
		});
		</c:when>
		</c:choose>
	</script>
	<script>
		function validateForm(form) {
			error = "Please fill this field .";


			//Receipt Number validation
			var rec = document.getElementById("receiptNumber").value;
			if (rec == null || rec === "") {
				document.getElementById("errorReceiptNumber").innerHTML = error;
				document.getElementById("divFormReceiptNumber").className = 'alert alert-danger alert-dismissible';
				document.getElementById("divFormReceiptNumber")
						.scrollIntoView();
				return false;
			}

			if (!(rec == null || rec === "")) {
				var recValid = /^\d+$/;
				if (!rec.match(recValid)) {
					document.getElementById("errorReceiptNumber").innerHTML = 'Invalid Receipt Number';
					document.getElementById("divFormReceiptNumber").className = 'alert alert-warning alert-dismissible';
					document.getElementById("divFormReceiptNumber")
							.scrollIntoView();
					return false;
				}
				document.getElementById("errorReceiptNumber").innerHTML = "";
				document.getElementById("divFormReceiptNumber").className = 'form-group has-success';
			}

			//End Receipt Number validation

			

			return true;
		}

	</script>