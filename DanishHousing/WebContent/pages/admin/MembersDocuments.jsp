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
				<h1>Member Documents</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Master Data</a></li>
					<li class="active">Member Documents</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<!-- Default box -->
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">Member Documents Uploading Form</h3>
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
						action="${pageContext.request.contextPath}/admin/pages/MemberDocumentsController"
						method="post" onsubmit="return validateForm(this)">
						<div class="box-body">
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
									<button type="button"
											class="btn btn-primary btn-block btn-flat" id="checkMember" >Check</button>	
								</div>
							</div>
							<div class="row" align="center">
								<div class="box-header with-border">
									<h3 class="box-title">Member Details</h3>
								</div>
								<div class="box-body">
									<dl class="dl-horizontal" id="memberDetails">
									</dl>

								</div>
								<!-- /.box-body -->
							</div>
							<div class="row" id="memberDocuments" style="display: none;">
								<div class="box-header with-border" align="center">
									<h3 class="box-title">Member Documents Details</h3>
								</div>
								<div class="box-body">
									<div class="col-md-6">
										<!--  form-group -->

										<!-- Zone Id -->
										<div class="form-group" id="divFormMemberDocTitle">
											<label>Member Document Title</label>
											<div class="input-group">
												<span class="input-group-addon"><i
													class="fa  fa-file-text-o"></i></span> <select
													class="form-control" id="memberDocTitle"
													name="memberDocTitle">
													<option value="0">N/A</option>
													<c:forEach items="${requestScope.documentsList}" var="doc">
														<option value="${doc.getValue()}">${doc.getValue()}</option>
													</c:forEach>
												</select>
											</div>
											<p id="errorMemberDocTitle"></p>
										</div>
										<!--End Zone Id-->
										<!-- /.form-group -->

										<!-- form-group -->
										<!-- Upload Photo -->
										<div class="form-group" id="divMemberDocFile">
											<label for="exampleInputFile">Upload File</label>
											<div class="input-group">
												<div class="input-group-addon">
													<i class="fa fa-photo"></i>
												</div>
												<input type="file" id="memberDocFile" name="memberDocFile"
													class="btn btn-block btn-default btn" />
											</div>
											<p id="errorMemberDocFile"></p>
										</div>
										<!-- End Upload Photo -->

										<!-- /.form-group -->


									</div>
									<!-- /.col -->
									<div class="col-md-6">

										<!-- form group -->

										<!-- Zone Name -->

										<!-- Address -->
										<div class="form-group" id="divMemberDocDetails">
											<label>Details</label>
											<div class="input-group">
												<div class="input-group-addon">
													<i class="fa  fa-align-left"></i>
												</div>
												<textarea class="form-control" rows="5"
													placeholder="Enter Member Document Details here"
													id="memberDocDetails" name="memberDocDetails"></textarea>
											</div>
											<p id="errorMemberDocDetails"></p>
										</div>
										<input type="hidden" id="operation" name="operation"
											value="create" />
										<!-- End Address -->
										<!-- End Project Name -->


										<!-- /.form group -->


										<!-- form group -->


										<!-- / .form group -->
									</div>
								</div>
								<!-- /.box-body -->
							</div>
							<!-- /.box -->
							<div class="row" id="uploadButton" style="display: none;">
								<div class="col-xs-4" align="right"></div>
								<div class="col-xs-4" align="right">
									<button type="submit"
										class="btn btn-primary btn-block btn-flat">Upload</button>
								</div>
							</div>
						</div>
					</form>

					<!-- User Form -->

					<!-- /.box-body -->
					<div class="box-footer">Provide Member Documents Details</div>
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
		<c:when test="${requestScope.msg=='1'}">
		$(document).ready(function() {
			$("#typeError").addClass("form-group has-success");
			$("#errorTop").html("Document Uploaded Successfully.");
		});
		</c:when>
		<c:when test="${requestScope.msg=='2'}">
		$(document).ready(function() {
			$("#typeError").addClass("form-group has-error");
			$("#errorTop").html("Fail to Add Receipt Record.");
		});
		</c:when>
		</c:choose>
		function validateForm(form) {
			error = "Please enter this field";

			//Contract Document Title Validation
			var contractTypeName = document.getElementById("memberDocTitle").value;
			if (contractTypeName == null || contractTypeName === "") {
				document.getElementById("divFormMemberDocTitle").className = 'alert alert-danger alert-dismissible';
				document.getElementById("errorMemberDocTitle").innerHTML = error;
				return false;
			}
			document.getElementById("divFormMemberDocTitle").className = 'form-group has-success';
			document.getElementById("errorMemberDocTitle").innerHTML = "";

			//Contract Document Details ValiDation
			var contractTypeDetails = document
					.getElementById("memberDocDetails").value;
			if (contractTypeDetails == null || contractTypeDetails === "") {

				document.getElementById("divMemberDocDetails").className = 'alert alert-danger alert-dismissible';
				document.getElementById("errorMemberDocDetails").innerHTML = error;
				return false;
			}
			document.getElementById("divMemberDocDetails").className = 'form-group has-success';
			document.getElementById("errorMemberDocDetails").innerHTML = "";

			var desig = document.getElementById("memberDocFile").value;
			if (desig == null || desig === "") {
				document.getElementById("errorMemberDocFile").innerHTML = 'Please Upload Member Document file';
				document.getElementById("divMemberDocFile").className = 'alert alert-danger alert-dismissible';
				return false;

			}
			document.getElementById("errorMemberDocFile").innerHTML = "";
			document.getElementById("divMemberDocFile").className = 'form-group has-success';

		}

		//Auto fill data
		$(document)
				.ready(
						function() {
							//Member Auto Fill
							$('#checkMember')
									.bind(
											"click",
											function(e) {
												e.preventDefault();
												var id = $('#memberID').val();
												if (id.length > 0) {
													$
															.ajax({
																url : 'http://localhost:8080/DanishHousing/ReceiptAutoFill',
																dataType : 'json',
																type : 'post',
																data : {
																	'id' : id
																},

																success : function(
																		data) {
																	var data0 = data["data"][0];
																	var data1 = data["data"][1];
																	var bool = data0["memberId"] === 0;
																	$(
																			'#divFormMemberID')
																			.toggleClass(
																					'alert alert-danger alert-dismissible',
																					bool);
																	$(
																			'#memberDetails')
																			.empty();
																	$(
																			'#errorMemberID')
																			.empty();
																	if (data0["memberId"] === 0) {
																		$(
																				'#errorMemberID')
																				.text(
																						'MemberID doesn\'t exist');
																		$(
																				'#memberDocuments')
																				.hide();
																		$(
																				'#uploadButton')
																				.hide();
																	} else {
																		$(
																				'#memberDetails')
																				.append(
																						'<dt>Full Name</dt><dd>'
																								+ data0["prefix"]
																								+ ' '
																								+ data0["memName"]
																								+ ' '
																								+ data0["fHRelation"]
																								+ ' '
																								+ data0["fHRelName"]
																								+ '</dd>'
																								+ '<dt>Address</dt><dd>'
																								+ data0["address1"]
																								+ '</dd><dd>'
																								+ data0["address2"]
																								+ '</dd><dd>'
																								+ data0["address3"]
																								+ '</dd>'
																								+ '<dt>Plot Number</dt><dd>'
																								+ data0["plotNo"]
																								+ '</dd>'
																								+ '<dt>Plot Size</dt><dd>'
																								+ data0["plotSize"]
																								+ '</dd>'
																								+ '<dt>Net Plot Size</dt><dd>'
																								+ data0["netPlotSize"]
																								+ '</dd>'
																								+ '<dt>Project</dt><dd>'
																								+ data1["projectName"]
																								+ ' - '
																								+ data1["projectId"]
																								+ '</dd>'
																								+ '<dt>Project Type</dt><dd>'
																								+ data1["bungProject"]
																								+ '</dd>');
																		$(
																				'#memberDocuments')
																				.show();
																		$(
																				'#uploadButton')
																				.show();
																	}
																},

																error : function(
																		req,
																		status,
																		err) {
																	alert('Error');
																	console
																			.log(req
																					+ ' '
																					+ status
																					+ ' '
																					+ err);
																}

															});
												}

											});

						});
	</script>