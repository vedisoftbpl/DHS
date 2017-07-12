<!-- daterange picker -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="../../plugins/datepicker/datepicker3.css">
<!-- select style -->
<link rel="stylesheet" href="../../plugins/select2/select2.css">
<%@ include file="../design/Top.jsp"%>
<body class="hold-transition skin-blue sidebar-mini" onload="formin();">
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
				<h1>Member</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Master Data</a></li>
					<li class="active">Member</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<!-- User Form -->
				<form action="./addAccountForm.htm" method="post"
					onsubmit="return validateForm(this)" name="membershipEditForm"
					id="membershipEditForm">
					<!-- Default box -->
					<div class="box">
						<div class="box-header with-border">
							<h3 class="box-title">Member View Form</h3>
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
						<div class="box-body">
							<!-- START CUSTOM TABS -->
							<h2 class="page-header">Note : Check details in all TABS.</h2>

							<div class="row">
								<div class="col-md-12">
									<!-- Custom Tabs -->
									<div class="nav-tabs-custom">
										<ul class="nav nav-tabs">
											<li class="active"><a href="#tab_1" data-toggle="tab">Tab
													1</a></li>
											<li><a href="#tab_2" data-toggle="tab">Tab 2</a></li>


										</ul>
										<div class="tab-content">
											<div class="tab-pane active" id="tab_1">
												<div class="row">
													<div class="col-md-6">

														<!--  form-group -->
														<!-- Full Name -->
														<div class="form-group" id="divMemberFormName">
															<label>Full Name</label>
															<div class="input-group">
																<span class="input-group-addon"><i
																	class="fa fa-user"></i></span> <span class="col-xs-2"><select
																	class="form-control select2" id="prefix" name="prefix"
																	style="width: 80px;" required="required">
																		<option>Mr.</option>
																		<option>Mrs.</option>
																		<option>Miss</option>
																</select> </span> <span class="col-md-10"> <input type="text"
																	class="form-control" placeholder="Full Name"
																	id="memberFullName" name="memberFullName" />
																</span>
															</div>
															<p id="errorFullName"></p>
														</div>
														<!-- End Full Name -->
														<!-- /.form-group -->

														<!--  form-group -->
														<!-- Relative Name -->
														<div class="form-group" id="divMemberFormRelativeName">
															<label>Relative Name</label>
															<div class="input-group">
																<span class="input-group-addon"><i
																	class="fa fa-user"></i></span> <span class="col-xs-2"><select
																	class="form-control select2" id="relation"
																	name="relation" style="width: 80px;"
																	required="required">
																		<option>S/O</option>
																		<option>D/O</option>
																		<option>W/O</option>
																</select> </span> <span class="col-md-10"> <input type="text"
																	class="form-control" placeholder="Full Name"
																	id="relativeFullName" name="relativeFullName" />
																</span>
															</div>
															<p id="errorRelativeName"></p>
														</div>
														<!-- End Relative Name -->
														<!-- /.form-group -->

														<!-- form group -->
														<!-- Dob -->
														<div class="form-group" id="divAccountFormDob">
															<label>Date of Birth:</label>

															<div class="input-group date">
																<div class="input-group-addon">
																	<i class="fa fa-calendar"></i>
																</div>
																<input type="text" class="form-control pull-right"
																	id="dob" name="dob" required="required" />
															</div>
															<p id="errorDob"></p>
															<!-- /.input group -->
														</div>

														<!--End Dob -->
														<!-- /.form group -->

														<!--  form group -->
														<!-- Category -->
														<div class="form-group" id="divMemberFormCategory">
															<label>Category</label>
															<div class="input-group">
																<div class="input-group-addon">
																	<i class="fa   fa-group"></i>
																</div>
																<select class="form-control select2" id="category"
																	name="category" style="width: 100%;"
																	required="required">
																	<option>General</option>
																	<option>Scheduled Caste(SC)</option>
																	<option>Scheduled Tribe(ST)</option>
																	<option>Other Backward Classes(OBC)</option>
																	<option>Others</option>
																</select>
															</div>
														</div>
														<!-- End Category -->
														<!-- /. form group -->

														<!--  form group -->
														<!-- Email -->
														<div class="form-group" id="divMemberFormEmail">
															<label>Email</label>
															<div class="input-group">
																<span class="input-group-addon"><i
																	class="fa fa-envelope"></i></span> <input type="email"
																	class="form-control" placeholder="example@email.com"
																	id="memberEmail" name="memberEmail" />
															</div>
															<p id="errorEmail"></p>
														</div>
														<!-- End Email -->
														<!-- /. form-group -->

														<!-- form group -->
														<!-- Occupation -->
														<div class="form-group" id="divMemberFormOccupation">
															<label>Occupation</label>
															<div class="input-group">
																<span class="input-group-addon"><i
																	class="fa fa-black-tie"></i></span> <input type="text"
																	class="form-control" placeholder="Occupation"
																	id="memberOccupation" name="memberOccupation">
															</div>
															<p id="errorOccupation"></p>
														</div>

														<!--End Occupation -->
														<!-- /.form group -->

														<!-- form group -->
														<!-- Phone -->
														<div class="form-group" id="divMemberFormPhone">
															<label> Phone Number:</label>
															<!-- .input group -->
															<div class="input-group">
																<div class="input-group-addon">
																	<i class="fa fa-mobile"></i>
																</div>
																<input type="text" class="form-control"
																	data-inputmask='"mask": "(+91) 99999-99999"' data-mask
																	id="memberPhone" name="memberPhone"
																	placeholder="(+91) 99999-99999" />
															</div>
															<p id="errorPhone"></p>
															<!-- /.input group -->
														</div>
														<!-- End Phone -->
														<!-- /.form group -->

														<!-- form group -->
														<!-- Phone -->
														<div class="form-group" id="divMemberFormAdhaar">
															<label> Adhaar Number:</label>
															<!-- .input group -->
															<div class="input-group">
																<div class="input-group-addon">
																	<i class="fa fa-credit-card"></i>
																</div>
																<input type="text" class="form-control"
																	id="memberAdhaar" name="memberAdhaar"
																	placeholder="12 digit adhaar number" />
															</div>
															<p id="errorAdhaar"></p>
															<!-- /.input group -->
														</div>
														<!-- End Adhaar -->
														<!-- /.form group -->

														<!-- form group -->
														<!-- Upload Photo -->
														<div class="form-group" id="divMemberFormPhoto">
															<label for="exampleInputFile">Upload Photo</label>
															<div class="input-group">
																<div class="input-group-addon">
																	<i class="fa fa-photo"></i>
																</div>
																<input type="file" id="memberPhoto" name="memberPhoto"
																	class="btn btn-block btn-default btn"
																	required="required" />
															</div>
															<p id="errorPhoto"></p>
														</div>
														<!-- End Upload Photo -->
														<!-- /.form group -->

														<!-- form group -->

														<!-- /.form group -->

														<!-- form group -->

														<!-- /.form group -->

													</div>
													<!-- /.col -->
													<div class="col-md-6">




														<!--  form-group -->
														<!-- Address Line 1 -->
														<div class="form-group" id="divMemberFormAddress1">
															<label>Address Line 1</label>
															<div class="input-group">
																<span class="input-group-addon"><i
																	class="fa fa-home"></i></span> <input type="text"
																	class="form-control" placeholder="Address Line 1"
																	id="memberAddress1" name="memberAddress1" />
															</div>
															<p id="errorAddress1"></p>
														</div>
														<!-- End Address Line 1 -->
														<!-- /.form-group -->

														<!--  form-group -->
														<!-- Address Line 2 -->
														<div class="form-group" id="divMemberFormAddress2">
															<label>Address Line 2</label>
															<div class="input-group">
																<span class="input-group-addon"><i
																	class="fa fa-home"></i></span> <input type="text"
																	class="form-control" placeholder="Address Line 2"
																	id="memberAddress2" name="memberAddress2" />
															</div>
															<p id="errorAddress2"></p>
														</div>
														<!-- End Address Line 2 -->
														<!-- /.form-group -->

														<!--  form-group -->
														<!-- City -->
														<div class="form-group" id="divMemberFormCity">
															<label>City</label>
															<div class="input-group">
																<span class="input-group-addon"><i
																	class="fa fa-map-marker"></i></span> <input type="text"
																	class="form-control" placeholder="City" id="memberCity"
																	name="memberCity" />
															</div>
															<p id="errorCity"></p>
														</div>
														<!-- End City -->
														<!-- /.form-group -->

														<!-- form group -->
														<!-- Address Proof -->
														<div class="form-group" id="divMemberFormAddressProof">
															<label>Address Proof Provided</label>
															<div class="input-group">
																<div class="input-group-addon">
																	<i class="fa   fa-building-o"></i>
																</div>
																<select class="form-control select2" id="addressProof"
																	name="addressProof" style="width: 100%;"
																	required="required">
																	<option>Voter Id</option>
																	<option>Driving License</option>
																	<option>Passport</option>
																	<option>PAN Card</option>
																	<option>Ration Card</option>
																</select>
															</div>
														</div>
														<!-- End Address Proof -->
														<!-- /.form group -->

														<!--  form-group -->
														<!-- Nominee Name -->
														<div class="form-group" id="divMemberFormNominee">
															<label>Nominee Name</label>
															<div class="input-group">
																<span class="input-group-addon"><i
																	class="fa fa-user"></i></span> <input type="text"
																	class="form-control" placeholder="Full Name"
																	id="memberNomineeName" name="memberNomineeName" />
															</div>
															<p id="errorNomineeName"></p>
														</div>
														<!-- End Nominee Name -->
														<!-- /.form-group -->

														<!--  form-group -->
														<!-- Nominee Relation -->
														<div class="form-group" id="divMemberFormNomineeRelation">
															<label>Relationship with Nominee</label>
															<div class="input-group">
																<span class="input-group-addon"><i
																	class="fa fa-exchange"></i></span> <input type="text"
																	class="form-control" placeholder="Relationship"
																	id="memberNomineeRelation" name="memberNomineeRelation" />
															</div>
															<p id="errorNomineeRelation"></p>
														</div>
														<!-- End Nominee Relation -->
														<!-- /.form-group -->

														<!-- form group -->
														<!-- Membership Fee -->
														<div class="form-group" id="divMemberFormMembershipFee">
															<label>Membership Fee</label>
															<div class="input-group">
																<span class="input-group-addon"> <i
																	class="fa  fa-inr"></i></span> <input type="text"
																	class="form-control" id="membershipFee"
																	name="membershipFee" />
															</div>
															<p id="errorMembershipFee"></p>
														</div>
														<!-- End Membership Fee -->
														<!-- /.form group -->

														<!-- form group -->
														<!-- Entrance Fee -->
														<div class="form-group" id="divMemberFormEntranceFee">
															<label>Entrance Fee</label>
															<div class="input-group">
																<span class="input-group-addon"> <i
																	class="fa  fa-inr"></i></span> <input type="text"
																	class="form-control" id="entranceFee"
																	name="entranceFee" />
															</div>
															<p id="errorEntranceFee"></p>
														</div>
														<!-- End Entrance Fee -->
														<!-- /.form group -->

														<input type="hidden" class="form-control" id="operation"
															name="operation" value="create" />


														<!-- form group -->


														<!-- /.form group -->

														<!--  form group -->

														<!-- /. form group -->

														<!-- form group -->
														<br>


													</div>
													<!-- /.box-body -->
												</div>
											</div>
											<!-- /.tab-pane -->




											<!-- new tab -->
											<div class="tab-pane" id="tab_2">
												<div class="row">
													<div class="col-md-6">

														<!--  form-group -->
														<!-- Project Code -->
														<div class="form-group" id="divProjectCode">
															<label>Project Code</label>
															<div class="input-group">
																<div class="input-group-addon">
																	<i class="fa  fa-bars"></i>
																</div>
																<select class="form-control select2" id="projectCode"
																	name="projectCode" style="width: 100%;">
																	<option selected="selected">0</option>
																	<option>1</option>
																	<option>2</option>
																	<option>3</option>
																</select>
															</div>
														</div>

														<!-- End Project Code -->
														<!-- /.form-group -->



														<!--  form-group -->
														<!-- Member No. -->

														<div class="form-group" id="divMemberNo">
															<label>Member No.</label>
															<div class="input-group">
																<span class="input-group-addon"><i
																	class="fa fa-user"></i></span> <input type="text"
																	class="form-control" id="memberNo" name="memberNo" />
															</div>
															<p id="errorMemberNo"></p>
														</div>

														<!-- End Member No. -->

														<!-- /.form-group -->

														<!-- form group -->
														<!-- Member Age -->

														<div class="form-group" id="divMemberAge">
															<label>Member Age</label>
															<div class="input-group">
																<span class="input-group-addon"><i
																	class="fa fa-user"></i></span> <input type="text"
																	class="form-control" id="memberAge" name="memberAge" />
															</div>
															<p id="errorMemberAge"></p>
														</div>

														<!-- End Member Age -->

														<!-- /.form group -->


														<!-- Plot Size -->
														<div class="form-group" id="divPlotSize">
															<label>Plot Size</label>
															<div class="input-group">
																<span class="input-group-addon"><i
																	class="fa fa-info-circle "></i></span> <input type="text"
																	class="form-control" id="plotSize" name="plotSize" />
															</div>
															<p id="errorPlotSize"></p>
														</div>

														<!-- Plot Size -->
														<!-- /.form group -->



														<!--Net Plot Size -->
														<div class="form-group" id="divNetPlotSize">
															<label>Net Plot Size</label>
															<div class="input-group">
																<span class="input-group-addon"><i
																	class="fa fa-info-circle "></i></span> <input type="text"
																	class="form-control" id="netPlotSize"
																	name="netPlotSize" />
															</div>
															<p id="errorNetPlotSize"></p>
														</div>

														<!--Net Plot Size -->
														<!-- /.form group -->

														<!-- Plot No. -->
														<div class="form-group" id="divPlotNo">
															<label>Plot No.</label>
															<div class="input-group">
																<span class="input-group-addon"><i
																	class="fa fa-info-circle "></i></span> <input type="text"
																	class="form-control" id="plotNo" name="plotNo" />
															</div>
															<p id="errorPlotNo"></p>
														</div>

														<!--Plot No. -->
														<!-- /.form group -->


														<!-- form group -->
														<!--Receipt Date-->
														<div class="form-group" id="divReceiptDate">
															<label>Receipt Date</label>

															<div class="input-group date">
																<div class="input-group-addon">
																	<i class="fa fa-calendar"></i>
																</div>
																<input type="text" class="form-control pull-right"
																	id="datepicker1" name="datepicker1"  />
															</div>
															<p id="errorReceiptDate"></p>
													<!-- /.input group -->
														</div>
														<!--End Receipt Date -->
														<!-- /.form group -->



													</div>
													<!-- /.col -->
													<div class="col-md-6">

														<!--  form-group -->
														<!-- Residential/Commercial -->
														<div class="form-group" id="divResidentialCommercial">
															<label> Residential/Commercial</label>
															<div class="input-group">
																<div class="input-group-addon">
																	<i class="fa  fa-bars"></i>
																</div>
																<select class="form-control select2"
																	id=" residentialCommercial"
																	name="residentialCommercial" style="width: 100%;">
																	<option selected="selected">Residential</option>
																	<option>Commercial</option>

																</select>
															</div>
														</div>

														<!-- End  Residential/Commercial -->
														<!-- /.form-group -->

														<!--  form-group -->
														<!-- Member Status -->
														<div class="form-group" id="divMemberStatus">
															<label>Member Status(L/D)</label>
															<div class="input-group">
																<div class="input-group-addon">
																	<i class="fa  fa-bars"></i>
																</div>
																<select class="form-control select2"
																	id=" residentialCommercial"
																	name="residentialCommercial" style="width: 100%;">
																	<option selected="selected">Live</option>
																	<option>Dead</option>

																</select>
															</div>
														</div>

														<!-- End  Member Status -->
														<!-- /.form-group -->



														<!-- form group -->
														<!-- Diversion -->
														<div class="form-group" id="divDiversion">
															<label>Diversion</label>
															<div class="input-group">
																<span class="input-group-addon"> <i
																	class="fa  fa-inr"></i></span> <input type="text"
																	class="form-control" id="diversion" name="diversion">
															</div>
															<p id="errorDiversion"></p>
														</div>
														<!-- Diversion -->
														<!-- /.form group -->

														<!-- form group -->
														<!-- Extra Amount -->
														<div class="form-group" id="divExtraAmount">
															<label>Extra Amount</label>
															<div class="input-group">
																<span class="input-group-addon"> <i
																	class="fa  fa-inr"></i></span> <input type="text"
																	class="form-control" id="extraAmount"
																	name="extraAmount">
															</div>
															<p id="errorExtraAmount"></p>
														</div>
														<!-- Extra Amount -->

														<!-- /.form group -->


														<!--  form group -->
														<!-- Cost -->
														<div class="form-group" id="divCost">
															<label>Cost</label>
															<div class="input-group">
																<span class="input-group-addon"> <i
																	class="fa  fa-inr"></i></span> <input type="text"
																	class="form-control" id="cost" name="cost">
															</div>
															<p id="errorCost"></p>
														</div>
														<!-- Cost -->


														<!-- form group -->
														<!-- Created By -->
														<div class="form-group" id="divCreatedBy">
															<label>Created By</label>
															<div class="input-group">
																<div class="input-group-addon">
																	<i class="fa  fa-user-plus"></i>
																</div>
																<input type="text" class="form-control"
																	value="${requestScope.createdby}" id="createdBy"
																	name="createdBy" readonly="readonly">

															</div>
														</div>
														<!-- End Created By -->

														<!-- /.form group -->




														<!-- form group -->
														<!--Last Update-->
														<div class="form-group" id="divLastUpdate">
															<label>Last Update</label>

															<div class="input-group date">
																<div class="input-group-addon">
																	<i class="fa fa-calendar"></i>
																</div>
																<input type="text" class="form-control pull-right"
																	value="${requestScope.lastUpdate}" id="datepicker2"
																	name="datepicker2" readonly="readonly" required />
															</div>
															<p id="errorLastUpdate"></p>
															<!-- /.input group -->
														</div>
														<!--Last Update -->
														<!-- /.form group -->
														<input type="hidden" class="form-control" id="operation"
															name="operation" value="create" />
														<!-- / .form group -->
													</div>
													<!-- /.box-body -->
												</div>
											</div>

										</div>
										<!-- /.tab-content -->
									</div>
									<!-- nav-tabs-custom -->
								</div>
								<!-- /.col -->
							</div>
							<!-- /.row -->
							<!-- END CUSTOM TABS -->
							<div class="col-md-6"></div>
							<div class="col-md-6">
								<div class="col-xs-4" align="center">
									<button type="button" id="editbtn" value="edit" name="editbtn"
										onclick="editfxn();"
										class="btn btn-primary btn-block btn-flat">Edit</button>
								</div>
								<div class="col-xs-4" align="center">
									<button type="reset" value="cancel" name="cancel" id="cancel"
										class="btn btn-block btn-danger">Cancel</button>
								</div>
							</div>
							<!-- /.box-body -->
							<div class="box-footer">Member Detail.</div>
							<!-- /.box-footer-->
						</div>
						<!-- /.box -->
						
						
						
						
						
						
				</div>	
				</form>

					<!-- User Form -->		
						
						
						
						
						
						
						
						
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
	<!-- iCheck -->
	<!-- jQuery 2.2.3 -->
	<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>

	<script>
		<c:choose>
		<c:when test="${param.msg=='1'}">
		$(document).ready(function() {
			$("#typeError").addClass("form-group has-error");
			$("#errorTop").html("Record Added Successfully.");
		});
		</c:when>
		<c:when test="${param.msg=='2'}">
		$(document).ready(function() {
			$("#typeError").addClass("form-group has-error");
			$("#errorTop").html("Fail to Add Record.");
		});
		</c:when>
		</c:choose>

		function formin() {
			var form = document.getElementById("membershipEditForm");
			var elements = form.elements;
			for (var i = 0, len = elements.length; i < len; ++i) {
				elements[i].disabled = true;
			}
			document.getElementById("editbtn").disabled = false;
			document.getElementById("cancel").disabled = false;
		}

		function editfxn() {
			if (document.getElementById("editbtn").value == "edit") {
				document.getElementById("editbtn").innerHTML = "Update";
				document.getElementById("editbtn").value = "update";
				var form = document.getElementById("membershipEditForm");
				var elements = form.elements;

				for (var i = 0, len = elements.length; i < len; ++i) {
					elements[i].disabled = false;
				}
			} else if (document.getElementById("editbtn").value == "update"
					&& validateForm(form)) {
				document.membershipEditForm.submit();
			}

		}

		function validateForm(form) {
			error = "Please fill this field .";

			//Full Name Validation
			var name = document.getElementById("memberFullName").value;
			if (name == null || name === "") {
				document.getElementById("errorFullName").innerHTML = error;
				document.getElementById("divMemberFormName").className = 'alert alert-danger alert-dismissible';
				return false;
			}

			if (!(name == null || name === "")) {
				var nameValid = /^[a-zA-Z-. ]+$/;
				if (!nameValid.test(name)) {
					document.getElementById("errorFullName").innerHTML = 'Invalid Name';
					document.getElementById("divMemberFormName").className = 'alert alert-danger alert-dismissible';
					return false;
				}
				document.getElementById("errorFullName").innerHTML = "";
				document.getElementById("divMemberFormName").className = 'form-group has-success';
			}

			//End Full Name Validation

			//Relative Name Validation
			var name = document.getElementById("relativeFullName").value;
			if (name == null || name === "") {
				document.getElementById("errorRelativeName").innerHTML = error;
				document.getElementById("divMemberFormRelativeName").className = 'alert alert-danger alert-dismissible';
				return false;
			}

			if (!(name == null || name === "")) {
				var nameValid = /^[a-zA-Z-. ]+$/;
				if (!nameValid.test(name)) {
					document.getElementById("errorRelativeName").innerHTML = 'Invalid Name';
					document.getElementById("divMemberFormRelativeName").className = 'alert alert-danger alert-dismissible';
					return false;
				}
				document.getElementById("errorRelativeName").innerHTML = "";
				document.getElementById("divMemberFormRelativeName").className = 'form-group has-success';
			}

			//End Relative Name Validation

			//Email Validation
			var email = document.getElementById("memberEmail").value;

			if (email == null || email === "") {
				document.getElementById("errorEmail").innerHTML = error;
				document.getElementById("divMemberFormEmail").className = 'alert alert-danger alert-dismissible';
				return false;

			}

			if (!(email == null || email === "")) {
				var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;

				if (!emailReg.test(email)) {
					document.getElementById("errorEmail").innerHTML = "Invaild Email Id ";
					document.getElementById("divMemberFormEmail").className = 'alert alert-warning alert-dismissible';
					return false;
				}
				document.getElementById("errorEmail").innerHTML = "";
				document.getElementById("divMemberFormEmail").className = 'form-group has-success';
			}
			//End Email Validation

			//Occupation Validation
			var desig = document.getElementById("memberOccupation").value;
			if (desig == null || desig === "") {
				document.getElementById("errorOccupation").innerHTML = error;
				document.getElementById("divMemberFormOccupation").className = 'alert alert-danger alert-dismissible';
				return false;

			}
			document.getElementById("errorOccupation").innerHTML = "";
			document.getElementById("divMemberFormOccupation").className = 'form-group has-success';
			//End Occupation Validation

			//Phone Validation
			var phone = document.getElementById("memberPhone").value;
			if (phone == null || phone === "") {

				document.getElementById("errorPhone").innerHTML = error;
				document.getElementById("divMemberFormPhone").className = 'alert alert-danger alert-dismissible';
				return false;

			}

			if (!(phone == null || phone === "")) {
				var phoneno = /^\d{10}$/;
				if (!(phone.match(phoneno))) {
					document.getElementById("errorPhone").innerHTML = "Invalid Phone Number";
					document.getElementById("divMemberFormPhone").className = 'alert alert-warning alert-dismissible';
					return false;
				}
				document.getElementById("errorPhone").innerHTML = "";
				document.getElementById("divMemberFormPhone").className = 'form-group has-success';
			}
			//End Phone Validation

			//Adhaar Validation
			var adhaar = document.getElementById("memberAdhaar").value;
			if (adhaar == null || adhaar === "") {
				document.getElementById("errorAdhaar").innerHTML = error;
				document.getElementById("divMemberFormAdhaar").className = 'alert alert-danger alert-dismissible';
				return false;

			}

			if (!(adhaar == null || adhaar === "")) {
				var adhaarno = /^[0-9]{12}$/;
				if (!(adhaar.match(adhaarno))) {
					document.getElementById("errorAdhaar").innerHTML = "Invalid Adhaar Number";
					document.getElementById("divMemberFormAdhaar").className = 'alert alert-warning alert-dismissible';
					return false;
				}
				document.getElementById("errorAdhaar").innerHTML = "";
				document.getElementById("divMemberFormAdhaar").className = 'form-group has-success';
			}
			//End Adhaar Validation

			//Address 1 Validation
			var desig = document.getElementById("memberAddress1").value;
			if (desig == null || desig == "") {
				document.getElementById("errorAddress1").innerHTML = error;
				document.getElementById("divMemberFormAddress1").className = 'alert alert-danger alert-dismissible';
				return false;

			}
			document.getElementById("errorAddress1").innerHTML = "";
			document.getElementById("divMemberFormAddress1").className = 'form-group has-success';
			//End Address 1 Validation

			//Address 2 Validation
			var desig = document.getElementById("memberAddress2").value;
			if (desig == null || desig == "") {
				document.getElementById("errorAddress2").innerHTML = error;
				document.getElementById("divMemberFormAddress2").className = 'alert alert-danger alert-dismissible';
				return false;

			}
			document.getElementById("errorAddress2").innerHTML = "";
			document.getElementById("divMemberFormAddress2").className = 'form-group has-success';
			//End Address 2 Validation

			//City Validation
			var desig = document.getElementById("memberCity").value;
			if (desig == null || desig == "") {
				document.getElementById("errorCity").innerHTML = error;
				document.getElementById("divMemberFormCity").className = 'alert alert-danger alert-dismissible';
				return false;

			}
			document.getElementById("errorCity").innerHTML = "";
			document.getElementById("divMemberFormCity").className = 'form-group has-success';
			//End City Validation

			//Nominee Name Validation
			var name = document.getElementById("memberNomineeName").value;
			if (name == null || name === "") {
				document.getElementById("errorNomineeName").innerHTML = error;
				document.getElementById("divMemberFormNominee").className = 'alert alert-danger alert-dismissible';
				return false;
			}

			if (!(name == null || name === "")) {
				var nameValid = /^[a-zA-Z-. ]+$/;
				if (!nameValid.test(name)) {
					document.getElementById("errorNomineeName").innerHTML = 'Invalid Name';
					document.getElementById("divMemberFormNominee").className = 'alert alert-danger alert-dismissible';
					return false;
				}
				document.getElementById("errorNomineeName").innerHTML = "";
				document.getElementById("divMemberFormNominee").className = 'form-group has-success';
			}

			//End Nominee Name Validation

			//Nominee Relation Validation
			var desig = document.getElementById("memberNomineeRelation").value;
			if (desig == null || desig === "") {
				document.getElementById("errorNomineeRelation").innerHTML = error;
				document.getElementById("divMemberFormNomineeRelation").className = 'alert alert-danger alert-dismissible';
				return false;

			}
			document.getElementById("errorNomineeRelation").innerHTML = "";
			document.getElementById("divMemberFormNomineeRelation").className = 'form-group has-success';
			//End Nominee Relation Validation

			//Membership Fee Validation
			var bal = document.getElementById("membershipFee").value;
			if (bal == null || bal === "") {
				document.getElementById("errorMembershipFee").innerHTML = error;
				document.getElementById("divMemberFormMembershipFee").className = 'alert alert-danger alert-dismissible';
				return false;
			}
			if (!(bal == null || bal === "")) {
				var balanceValid = /^\d+(\.\d+)?$/;
				if (!(bal.match(balanceValid))) {
					document.getElementById("errorMembershipFee").innerHTML = "Invalid Amount";
					document.getElementById("divMemberFormMembershipFee").className = 'alert alert-warning alert-dismissible';
					return false;
				}
				document.getElementById("errorMembershipFee").innerHTML = "";
				document.getElementById("divMemberFormMembershipFee").className = 'form-group has-success';
			}
			//End Membership Fee Validation

			//Entrance Fee Validation
			var bal = document.getElementById("entranceFee").value;
			if (bal == null || bal === "") {
				document.getElementById("errorEntranceFee").innerHTML = error;
				document.getElementById("divMemberFormEntranceFee").className = 'alert alert-danger alert-dismissible';
				return false;
			}
			if (!(bal == null || bal === "")) {
				var balanceValid = /^\d+(\.\d+)?$/;
				if (!(bal.match(balanceValid))) {
					document.getElementById("errorEntranceFee").innerHTML = "Invalid Amount";
					document.getElementById("divMemberFormEntranceFee").className = 'alert alert-warning alert-dismissible';
					return false;
				}
				document.getElementById("errorEntranceFee").innerHTML = "";
				document.getElementById("divMemberFormEntranceFee").className = 'form-group has-success';
			}
			//End Entrance Fee Validation

			//Member No. Validation
			var memberNo = document.getElementById("memberNo").value;
			if (!(memberNo == null || memberNo === "")) {
				var memno = /^\d$/;
				if (!(memberNo.match(memno))) {
					document.getElementById("errorMemberNo").innerHTML = "Invalid Member Number";
					document.getElementById("divMemberNo").className = 'alert alert-warning alert-dismissible';
					return false;
				}
				document.getElementById("errorMemberNo").innerHTML = "";
				document.getElementById("divMemberNo").className = 'form-group has-success';
			}
			//End Member No. Validation

			//Member Age Validation
			var memberAge = document.getElementById("memberAge").value;
			if (!(memberAge == null || memberAge === "")) {
				var memage = /^\d$/;
				if (!(memberAge.match(memage))) {
					document.getElementById("errorMemberAge").innerHTML = "Invalid Member Age";
					document.getElementById("divMemberAge").className = 'alert alert-warning alert-dismissible';
					return false;
				}
				document.getElementById("errorMemberAge").innerHTML = "";
				document.getElementById("divMemberAge").className = 'form-group has-success';
			}
			//End Member Age Validation

			//Plot Size Validation
			var plotSize = document.getElementById("plotSize").value;

			if (!(plotSize == null || plotSize === "")) {
				var plotSizeValid = /^[X-*-x-\d ]+$/; 											//  which validation ?????????????????????????????????
				if (!plotSizeValid.test(plotSize)) {
					document.getElementById("errorPlotSize").innerHTML = 'Invalid Plot Size';
					document.getElementById("divPlotSize").className = 'alert alert-danger alert-dismissible';
					return false;
				}
				document.getElementById("errorPlotSize").innerHTML = "";
				document.getElementById("divPlotSize").className = 'form-group has-success';
			}

			//End Plot Size Validation

			//Net Plot Size Validation
			var netPlotSize = document.getElementById("netPlotSize").value;
			if (!(netPlotSize == null || netPlotSize === "")) {
				var netPlotSizeValid = /^\d+(\.\d+)?$/;
				if (!(netPlotSize.match(netPlotSizeValid))) {
					document.getElementById("errorNetPlotSize").innerHTML = "Invalid Net Plot Size";
					document.getElementById("divNetPlotSize").className = 'alert alert-warning alert-dismissible';
					return false;
				}
				document.getElementById("errorNetPlotSize").innerHTML = "";
				document.getElementById("divNetPlotSize").className = 'form-group has-success';
			}
			//End Net Plot Size Validation

			//Plot No. Validation
			var plotNo = document.getElementById("plotSize").value;

			if (!(plotNo == null || plotNo === "")) {
				var plotNoValid = /^[a-zA-Z-X-*-x--\-/-\d ]+$/; 									//  which validation  ????????????????????????????
				if (!plotNoValid.test(plotNo)) {
					document.getElementById("errorPlotNo").innerHTML = 'Invalid Plot No.';
					document.getElementById("divPlotNo").className = 'alert alert-danger alert-dismissible';
					return false;
				}
				document.getElementById("errorPlotNo").innerHTML = "";
				document.getElementById("divPlotNo").className = 'form-group has-success';
			}

			//End Plot No. Validation

			// Diversion Validation
			var diversion = document.getElementById("diversion").value;
			if (!(diversion == null || diversion === "")) {
				var diversionValid = /^\d+(\.\d+)?$/;
				if (!(diversion.match(diversionValid))) {
					document.getElementById("errorDiversion").innerHTML = "Invalid amount";
					document.getElementById("divDiversion").className = 'alert alert-warning alert-dismissible';
					return false;
				}
				document.getElementById("errorDiversion").innerHTML = "";
				document.getElementById("divDiversion").className = 'form-group has-success';
			}
			//End Diversion Validation

			// Extra Amount Validation
			var extraAmount = document.getElementById("extraAmount").value;
			if (!(extraAmount == null || extraAmount === "")) {
				var extraAmountValid = /^\d+(\.\d+)?$/;
				if (!(extraAmount.match(extraAmountValid))) {
					document.getElementById("errorExtraAmount").innerHTML = "Invalid amount";
					document.getElementById("divExtraAmount").className = 'alert alert-warning alert-dismissible';
					return false;
				}
				document.getElementById("errorExtraAmount").innerHTML = "";
				document.getElementById("divExtraAmount").className = 'form-group has-success';
			}
			//End Extra Amount Validation

			// Cost Validation
			var cost = document.getElementById("cost").value;
			if (!(cost == null || cost === "")) {
				var costValid = /^\d+(\.\d+)?$/;
				if (!(cost.match(costValid))) {
					document.getElementById("errorCost").innerHTML = "Invalid amount";
					document.getElementById("divCost").className = 'alert alert-warning alert-dismissible';
					return false;
				}
				document.getElementById("errorCost").innerHTML = "";
				document.getElementById("divCost").className = 'form-group has-success';
			}
			//End Cost Validation

			return true;
		}
		$(function() {
			//Initialize Select2 Elements
			$(".select2").select2();

			//Date picker
			$('#dob').datepicker({
				format : 'dd/mm/yyyy',
				autoclose : true
			});
			$('#dor').datepicker({
				format : 'dd/mm/yyyy',
				autoclose : true
			});

		});

		$(function() {
			$('#datepicker1').datepicker({
				format : 'dd/mm/yyyy',
				autoclose : true
			});
			//$('#datepicker2').datepicker({
			//	format : 'dd/mm/yyyy',
			//	autoclose : true
			//});
		});
	</script>