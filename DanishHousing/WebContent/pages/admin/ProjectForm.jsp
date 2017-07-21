<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../design/Top.jsp"%>
<!-- select style -->
<link rel="stylesheet" href="../../plugins/select2/select2.css">
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
				<h1>Project</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Master Data</a></li>
					<li class="active">Project</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<!-- Default box -->
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">Project Form</h3>
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

					<!-- Project Form -->
					
					<div class="form-group" id="typeError">
				<label class="control-label" id="errorTop"></label>
			</div>
			
			
					<form action="${pageContext.request.contextPath}/admin/pages/ProjectFormController" method="post"
						onsubmit="return validateForm(this)">
						<div class="box-body">
							<div class="row">
								<div class="col-md-6">

									<!--  form-group -->
									<!-- Project Name -->
									<div class="form-group" id="divProjectFormName">
										<label>Project Name</label>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-building"></i></span>
											<input type="text" class="form-control"
												placeholder="Project Name" id="ProjectName"
												name="ProjectName" />
										</div>
										<p id="errorProjectName"></p>
									</div>
									<!-- End Project Name -->
									<!-- /.form-group -->



								<!--  form-group -->
									<!-- Project Type -->
		
		
									<div class="form-group" id="divProjectType">
										<label>Project Type</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa  fa-info-circle"></i>
											</div>
									
											<select class="form-control select2" id="ProjectType" name="ProjectType"
												style="width: 100%;">
												<c:forEach items="${requestScope.enumList}" var="val">
													<option value="${val.getValue()}">${val}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<!-- End Project Type-->
									<!-- /.form-group -->

    
								
									<!-- form group -->


									<!-- /.form group -->

									<!-- form group -->

									<!-- /.form group -->

									<!-- form group -->

									<!-- /.form group -->

								</div>
								<!-- /.col -->
								<div class="col-md-6">

										<input type="hidden" class="form-control"
												 id="operation" name="operation" value = "create"/>


									

									<!-- form group -->


									<!-- /.form group -->

									<!--  form group -->

									<!-- /. form group -->

									<!-- form group -->
									<br>		<br>		<br>		<br>		<br>
									
									<div class="row"></div>
									<div class="col-xs-4" align="center">
										<button type="submit"
											class="btn btn-primary btn-block btn-flat">Add Project</button>
									</div>
									<div class="col-xs-4" align="center">
										<button type="reset" class="btn btn-block btn-danger">Cancel</button>
									</div>

									<!-- / .form group -->
								</div>
								<!-- /.box-body -->
							</div>
							<!-- /.box -->
						</div>
						<!-- /.col -->
					</form>

					<!-- User Form -->

					<!-- /.box-body -->
					<div class="box-footer">Provide the Project Detail </div>
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
	<!-- select2 -->
	<script src="../../plugins/select2/select2.js"></script>
	<!-- iCheck -->
	<!-- jQuery 2.2.3 -->
	<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>

	<script>
	<c:choose>
	<c:when test="${requestScope.msg=='1'}">
	$(document).ready(function() {
		$("#typeError").addClass("form-group has-success");
		$("#errorTop")
		.html(
				"Record Added Successfully.");
	});
	</c:when>
	<c:when test="${requestScope.msg=='2'}">
	$(document).ready(function() {
		$("#typeError").addClass("form-group has-error");
		$("#errorTop")
		.html(
				"Fail to Add Record.");
	});
	</c:when>
	</c:choose>
		function validateForm(form) {
			error = "Please fill this field .";

			//Project Name Validation
			var name = document.getElementById("ProjectName").value;
			if (name == null || name === "") {
				document.getElementById("errorProjectName").innerHTML = error;
				document.getElementById("divProjectFormName").className = 'alert alert-danger alert-dismissible';
				return false;
			}

			if (!(name == null || name === "")) {
				var nameValid = /^[a-zA-Z-.\d ]+$/;  						 //  which validation
				if (!nameValid.test(name)) {
					document.getElementById("errorProjectName").innerHTML = 'Invalid Name';
					document.getElementById("divProjectFormName").className = 'alert alert-danger alert-dismissible';
					return false;
				}
				document.getElementById("errorProjectName").innerHTML = "";
				document.getElementById("divProjectFormName").className = 'form-group has-success';
			}

			//End Project Name Validation
			return true;
		}
		$(function() {
			//Initialize Select2 Elements
			$(".select2").select2();

		});
	</script>