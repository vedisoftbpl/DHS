<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				<h1>Account Master</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Master Data</a></li>
					<li class="active">Account Master</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<!-- Default box -->
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">Account Master Form</h3>
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
					<form
						action="${pageContext.request.contextPath}/admin/pages/MasterAccountFormController"
						method="post" onsubmit="return validateForm(this)">
						<div class="box-body">
							<div class="row">
								<div class="col-md-6">

									<!--  form-group -->
									<!-- Full Name -->
									<div class="form-group" id="divAccountCode">
										<label>Account Code</label>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-bars"></i></span>
											<input type="text" class="form-control"
												placeholder="Account Code" id="accountCode"
												name="accountCode" />
										</div>
										<p id="errorAccountCode"></p>
									</div>
									<!-- End Account Code -->
									<!-- /.form-group -->

									<!--  form-group -->
									<!-- ANX Code -->
									<div class="form-group" id="divAnxCode">
										<label>ANX Code</label>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-bars"></i></span>
											<input type="text" class="form-control"
												placeholder="ANX Code" id="anxCode" name="anxCode" />
										</div>
										<p id="errorAnxCode"></p>
									</div>
									<!-- End ANX Code -->
									<!-- /.form-group -->


									<!--  form group -->
									<div class="form-group" id="divAccountName">
										<label>Account Name</label>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-user"></i></span>
											<input type="text" class="form-control"
												placeholder="account Name" id="accountName"
												name="accountName" />
										</div>
										<p id="errorAccountName"></p>
									</div>
									<!-- /. form-group -->

									<div class="form-group" id="divAccountClass">
										<label>Account Class</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa  fa-list-ul"></i>
											</div>
											<select class="form-control select2" id="accountClass"
												name="accountClass" style="width: 100%;">
												<option selected="selected" value="A">Assets</option>
												<option value="I">Income</option>
												<option value="L">Liability</option>
												<option value="E">Extended</option>
											</select>
										</div>
									</div>
									<!--  form-group -->
									<div class="form-group" id="divFlag">
										<label>Flag</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa  fa-flag"></i>
											</div>
											<select class="form-control select2" id="flag" name="flag"
												style="width: 100%;">
												<c:forEach items="${requestScope.enumList}" var="val">
													<option value="${val.getValue()}">${val}</option>
												</c:forEach>
											</select>
										</div>
									</div>

									<!-- /.form-group -->



								</div>
								<!-- /.col -->
								<div class="col-md-6">

									<!--  form-group -->
									<!-- Project Code -->
									<div class="form-group" id="divProjectCode">
										<label>Project Name</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa  fa-bars"></i>
											</div>
											<select class="form-control select2" id="projectCode" name="projectCode"
												style="width: 100%;" >
												<c:forEach items="${requestScope.projectList}" var="project">
													<option value="${project.getProjectId()}" >${project.getProjectName()}</option>
												</c:forEach>
											</select>
										</div>
									</div>

									<!-- End Project Code -->
									<!-- /.form-group -->

									<!--  form-group -->
									<!-- IXPGE -->
									<div class="form-group" id="divIxpge">
										<label>IXPGE</label>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-bars"></i></span>
											<input type="text" class="form-control" placeholder="IXPGE"
												id="ixpge" name="ixpge" />
										</div>
										<p id="errorIxpge"></p>
									</div>
									<!-- End IXPGE -->
									<!-- /.form-group -->


									<!--  form-group -->

									<!-- Address-->
									<div class="form-group" id="divAddress">
										<label>Address</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-map-marker"></i>
											</div>
											<textarea class="form-control" rows="8"
												placeholder="Enter your Address" id="address" name="address"></textarea>
										</div>
										<p id="errorAddress"></p>
									</div>
									<!-- End Address -->

									<!-- /.form group -->
									<input type="hidden" class="form-control" id="operation"
										name="operation" value="create" />

									<!--  form group -->

									<!-- /. form group -->

									<!-- form group -->
									<br>
									<div class="col-xs-4" align="center">
										<button type="submit"
											class="btn btn-primary btn-block btn-flat">Add</button>
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
					<div class="box-footer">Provide the Detail For Registration</div>
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
	<!-- iCheck -->
	<!-- jQuery 2.2.3 -->
	<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>

	<script>
		<c:choose>
		<c:when test="${requestScope.msg==1}">
		$(document).ready(function() {
			$("#typeError").addClass("form-group has-success");
			$("#errorTop").html(" Record Added Successfully.");
		});
		</c:when>
		<c:when test="${requestScope.msg==2}">
		$(document).ready(function() {
			$("#typeError").addClass("form-group has-error");
			$("#errorTop").html(" Fail to Add Record.");
		});
		</c:when>
		</c:choose>
		function validateForm(form) {
			error = "Please fill this field .";

			//Account Code Validation
			var acc = document.getElementById("accountCode").value;
			if (acc == null || acc === "") {
				document.getElementById("errorAccountCode").innerHTML = error;
				document.getElementById("divAccountCode").className = 'alert alert-danger alert-dismissible';
				return false;
			}
			document.getElementById("errorAccountCode").innerHTML = "";
			document.getElementById("divAccountCode").className = 'form-group has-success';
			//End Account Code Validation

			//ANX Code Validation
			var anxCd = document.getElementById("anxCode").value;
			if (anxCd == null || anxCd === "") {
				document.getElementById("errorAnxCode").innerHTML = error;
				document.getElementById("divAnxCode").className = 'alert alert-danger alert-dismissible';
				return false;
			}
			if (!(anxCd == null || anxCd === "")) {
				var namValid = /^\d+$/;
				if (!namValid.test(anxCd)) {
					document.getElementById("errorAnxCode").innerHTML = 'Invalid Anx Code';
					document.getElementById("divAnxCode").className = 'alert alert-danger alert-dismissible';
					return false;
				}
				document.getElementById("errorAnxCode").innerHTML = "";
				document.getElementById("divAnxCode").className = 'form-group has-success';
			}
			//End ANX Code Validation

			//Account Name Validation
			var name = document.getElementById("accountName").value;
			if (name == null || name === "") {
				document.getElementById("errorAccountName").innerHTML = error;
				document.getElementById("divAccountName").className = 'alert alert-danger alert-dismissible';
				return false;
			}

			
				document.getElementById("errorAccountName").innerHTML = "";
				document.getElementById("divAccountName").className = 'form-group has-success';
			

			//End Account Name Validation

			return true;
		}
	</script>