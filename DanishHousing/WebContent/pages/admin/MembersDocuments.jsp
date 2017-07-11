<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
				<h1>Contracts Type</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Master Data</a></li>
					<li class="active">Contracts Type</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<!-- Default box -->
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">New Contract Type Creation Form</h3>
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
					<form enctype="multipart/form-data"
						action="${pageContext.request.contextPath}/admin/pages/ContractDocumentsController"
						method="post" onsubmit="return validateForm(this)">
						<div class="box-body">
							<div class="row">
								<div class="col-md-6">
									<!--  form-group -->

									<!-- Zone Id -->
									<div class="form-group" id="divFormContractDocTitle" >
										<label>Contract Document Title</label>
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa  fa-file-text-o"></i></span> <input type="text"
												class="form-control" placeholder="Contract Document Title"
												id="contractDocTitle" name="contractDocTitle">
										</div>
										<p id="errorContractDocTitle"></p>
									</div>
									<!--End Zone Id-->
									<!-- /.form-group -->

									<!-- form-group -->
									<!-- Upload Photo -->
									<div class="form-group" id="divContractDocFile">
										<label for="exampleInputFile">Upload File</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-photo"></i>
											</div>
											<input type="file" id="contractDocFile"
												name="contractDocFile" class="btn btn-block btn-default btn" />
										</div>
										<p id="errorContractDocFile"></p>
									</div>
									<!-- End Upload Photo -->

									<!-- /.form-group -->


								</div>
								<!-- /.col -->
								<div class="col-md-6">

									<!-- form group -->

									<!-- Zone Name -->

									<!-- Address -->
									<div class="form-group" id="divContractDocDetails">
										<label>Details</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa  fa-align-left"></i>
											</div>
											<textarea class="form-control" rows="5"
												placeholder="Enter Contract Document Details here"
												id="contractDocDetails" name="contractDocDetails"></textarea>
										</div>
										<p id="errorcontractDocDetails"></p>
									</div>
									<input type="hidden" id="operation" name="operation"
										value="create" />
									<!-- End Address -->
									<!-- End Project Name -->


									<!-- /.form group -->


									<!-- form group -->


									<!-- / .form group -->
								</div>
								<!-- /.box-body -->
							</div>
							<!-- /.box -->
							<div class="col-xs-4" align="right"></div>
							<div class="col-xs-4" align="right">
								<button type="submit" class="btn btn-primary btn-block btn-flat">Register</button>
							</div>
						</div>
					</form>

					<!-- User Form -->

					<!-- /.box-body -->
					<div class="box-footer">Provide New Contract Type Details</div>
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

	<script>
	<c:choose>
	<c:when test="${param.msg=='1'}">
	$(document).ready(function() {
		$("#typeError").addClass("form-group has-error");
		$("#errorTop")
		.html(
				"Record Added Successfully.");
	});
	</c:when>
	<c:when test="${param.msg=='2'}">
	$(document).ready(function() {
		$("#typeError").addClass("form-group has-error");
		$("#errorTop")
		.html(
				"Fail to Add Record.");
	});
	</c:when>
	</c:choose>
		function validateForm(form) {
			error = "Please enter this field";

			//Contract Document Title Validation
			var contractTypeName = document.getElementById("contractDocTitle").value;
			if (contractTypeName == null || contractTypeName === "") {
				document.getElementById("divFormContractDocTitle").className = 'alert alert-danger alert-dismissible';
				document.getElementById("errorContractDocTitle").innerHTML = error;
				return false;
			}
			document.getElementById("divFormContractDocTitle").className = 'form-group has-success';
			document.getElementById("errorContractDocTitle").innerHTML = "";

			//Contract Document Details ValiDation
			var contractTypeDetails = document
					.getElementById("contractDocDetails").value;
			if (contractTypeDetails == null || contractTypeDetails === "") {

				document.getElementById("divContractDocDetails").className = 'alert alert-danger alert-dismissible';
				document.getElementById("errorcontractDocDetails").innerHTML = error;
				return false;
			}
			document.getElementById("divContractDocDetails").className = 'form-group has-success';
			document.getElementById("errorcontractDocDetails").innerHTML = "";

			var desig = document.getElementById("contractDocFile").value;
			if (desig == null || desig === "") {
				document.getElementById("errorContractDocFile").innerHTML = 'Please Upload Contract Document file';
				document.getElementById("divContractDocFile").className = 'alert alert-danger alert-dismissible';
				return false;

			}
			document.getElementById("errorContractDocFile").innerHTML = "";
			document.getElementById("divContractDocFile").className = 'form-group has-success';

		}
	</script>