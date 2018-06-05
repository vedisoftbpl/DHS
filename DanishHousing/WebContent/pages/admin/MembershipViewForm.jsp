<!-- daterange picker -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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



				<form
					action="${pageContext.request.contextPath}/admin/pages/MemberFormController"
					method="post" onsubmit="return validateForm(this)"
					name="membershipEditForm" id="membershipEditForm"
					enctype="multipart/form-data">
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
											<li class="active"><a href="#tab_1" data-toggle="tab">Member
													Details</a></li>
											<li><a href="#tab_2" data-toggle="tab">Plot Details</a></li>
											<li><a href="#tab_3" data-toggle="tab">More Details</a></li>

										</ul>
										<div class="tab-content">
											<div class="tab-pane active" id="tab_1">
												<div class="row">
													<div class="col-md-6">
														<!-- Profile Image -->
														<div class="box box-primary">
															<div class="box-body box-profile">
																<img class="profile-user-img img-responsive img-circle"
																	src="../../pages/photos/${requestScope.member.photo}"
																	alt="User profile picture">

																<h3 class="profile-username text-center">${requestScope.member.memName}</h3>

															</div>
															<!-- /.box-body -->
														</div>
														<!-- /.box -->

														<input type="hidden" class="form-control" id="showId"
															name="showId" value="${requestScope.member.memberId}" />


														<!--  form-group -->
														<!-- Full Name -->
														<div class="form-group" id="divMemberFormName">
															<label>Full Name</label>
															<div class="input-group">
																<span class="input-group-addon"><i
																	class="fa fa-user"></i></span> <span class="col-xs-2"><select
																	class="form-control select2" id="prefix" name="prefix"
																	style="width: 80px;" >
																	<option  value="${requestScope.member.prefix}" <c:if test="${(requestScope.member.prefix == 'Mr.')||(requestScope.member.prefix == 'Mr')||(requestScope.member.prefix == 'SHRI')}"> selected </c:if>>Mr.</option>
																		<!--   <option
																			${requestScope.member.prefix eq 'Mr.'||'SHRI' ? 'selected' : ''}>Mr.</option> -->
																			<option  value="${requestScope.member.prefix}" <c:if test="${(requestScope.member.prefix == 'Mrs.')||(requestScope.member.prefix == 'Mrs')||(requestScope.member.prefix == 'SMT.')}"> selected </c:if>>Mrs.</option> 
																<!--		<option
																			${requestScope.member.prefix eq 'Mrs.'||'Mrs'||'SMT.' ? 'selected' : ''}>Mrs.</option>    -->
																		<option
																			${requestScope.member.prefix eq 'Miss' ? 'selected' : ''}>Miss</option>
																			<option
																			${requestScope.member.prefix eq 'DR' ? 'selected' : ''}>Dr</option>
																			
																</select> </span> <span class="col-md-10"> <input type="text"
																	class="form-control" placeholder="Full Name"
																	id="memberFullName" name="memberFullName"
																	value="${requestScope.member.memName}" />
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
																	name="relation" style="width: 80px;">
																	<option value="N/A"
																			${requestScope.member.fHRelation eq 'N/A' ? 'selected' : ''}>N/A</option>
																		<option value="S/O"
																			${requestScope.member.fHRelation eq 'S/O' ? 'selected' : ''}>S/O</option>
																		<option value="D/O"
																			${requestScope.member.fHRelation eq 'D/O' ? 'selected' : ''}>D/O</option>
																		<option value="W/O"
																			${requestScope.member.fHRelation eq 'W/O' ? 'selected' : ''}>W/O</option>
																</select> </span> <span class="col-md-10"> <input type="text"
																	class="form-control" placeholder="Full Name"
																	id="relativeFullName" name="relativeFullName"
																	value="${requestScope.member.fHRelName}" />
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
																<span id="formattedDate1" name="formattedDate1"
																	style="display: none;"><fmt:formatDate
																		type="date" pattern="dd/MM/yyyy"
																		value="${requestScope.member.dob}" /></span> <input
																	type="text" class="form-control pull-right datepicker"
																	id="dob" name="dob" required="required" />
															</div>
															<p id="errorDob"></p>
															<!-- /.input group -->
														</div>

														<!--End Dob -->
														<!-- /.form group -->



														<!--  form group -->
														<!-- Email -->
														<div class="form-group" id="divMemberFormEmail">
															<label>Email</label>
															<div class="input-group">
																<span class="input-group-addon"><i
																	class="fa fa-envelope"></i></span> <input type="email"
																	class="form-control" placeholder="example@email.com"
																	id="memberEmail" name="memberEmail"
																	value="${requestScope.member.email}" />
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
																	id="memberOccupation" name="memberOccupation"
																	value="${requestScope.member.memOccupation}">
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
																	placeholder="(+91) 99999-99999"
																	value="${requestScope.member.mobile}" />
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
																	placeholder="12 digit adhaar number"
																	value="${requestScope.member.aadhar}" />
															</div>
															<p id="errorAdhaar"></p>
															<!-- /.input group -->
														</div>
														<!-- End Adhaar -->
														<!-- /.form group -->
														<!-- form group -->
														<!-- PAN -->
														<div class="form-group" id="divMemberFormPAN">
															<label> PAN Number:</label>
															<!-- .input group -->
															<div class="input-group">
																<div class="input-group-addon">
																	<i class="fa fa-credit-card"></i>
																</div>
																<input type="text" class="form-control" id="memberPAN"
																	name="memberPAN" placeholder=" PAN number"
																	value="${requestScope.member.panNo}" />
															</div>
															<p id="errorPAN"></p>
															<!-- /.input group -->
														</div>
														<!-- End PAN -->
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
																	class="btn btn-block btn-default btn" />
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

														<div class="box box-primary">
															<div class="box-body box-profile">




																<ul class="list-group list-group-unbordered">
																	<li class="list-group-item"><b>Member No.</b> <a
																		class="pull-right">${requestScope.member.memberId}</a></li>


																</ul>
																<br> <br> <br> <br>
															</div>
															<!-- /.box-body -->
														</div>

														<!--  form-group -->
														<!-- Address Line 1 -->
														<div class="form-group" id="divMemberFormAddress1">
															<label>Address Line 1</label>
															<div class="input-group">
																<span class="input-group-addon"><i
																	class="fa fa-home"></i></span> <input type="text"
																	class="form-control" placeholder="Address Line 1"
																	id="memberAddress1" name="memberAddress1"
																	value="${requestScope.member.address1}" />
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
																	id="memberAddress2" name="memberAddress2"
																	value="${requestScope.member.address2}" />
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
																	name="memberCity"
																	value="${requestScope.member.address3}" />
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
																	name="addressProof" style="width: 100%;">
																	<option value="N/A"
																		${requestScope.member.addProof eq 'N/A' ? 'selected' : ''}>N/A</option>
																	<option value="Voter Id"
																		${requestScope.member.addProof eq 'Voter Id' ? 'selected' : ''}>Voter
																		Id</option>
																	<option value="Driving License"
																		${requestScope.member.addProof eq 'Driving License' ? 'selected' : ''}>Driving
																		License</option>
																	<option value="Passport"
																		${requestScope.member.addProof eq 'Passport' ? 'selected' : ''}>Passport</option>
																	<option value="PAN Card"
																		${requestScope.member.addProof eq 'PAN Card' ? 'selected' : ''}>PAN
																		Card</option>
																	<option value="Ration Card"
																		${requestScope.member.addProof eq 'Ration Card' ? 'selected' : ''}>Ration
																		Card</option>
																</select>
															</div>
														</div>
														<!-- End Address Proof -->
														<!-- /.form group -->
														<!--  form-group -->
														<!--Mother's Name -->
														<div class="form-group" id="divMemberFormMotherName">
															<label> Mother's Name:</label>
															<!-- .input group -->
															<div class="input-group">
																<div class="input-group-addon">
																	<i class="fa fa-user"></i>
																</div>
																<input type="text" class="form-control"
																	id="memberMotherName" name="memberMotherName"
																	placeholder=" Mother's Name "
																	value="${requestScope.member.motherName}" />
															</div>
															<p id="errorMemberMotherName"></p>
															<!-- /.input group -->
														</div>
														<!-- End Mother's Name -->
														<!-- /.form group -->
														<!--  form-group -->
														<!-- Nominee Name -->
														<div class="form-group" id="divMemberFormNominee">
															<label>Nominee Name</label>
															<div class="input-group">
																<span class="input-group-addon"><i
																	class="fa fa-user"></i></span> <input type="text"
																	class="form-control" placeholder="Full Name"
																	id="memberNomineeName" name="memberNomineeName"
																	value="${requestScope.member.nomineeName}" />
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
																	id="memberNomineeRelation" name="memberNomineeRelation"
																	value="${requestScope.member.nomineeRelation}" />
															</div>
															<p id="errorNomineeRelation"></p>
														</div>
														<!-- End Nominee Relation -->
														<!-- /.form-group -->

														<!-- form group -->
														<!-- Gender -->
														<div class="form-group" id="divMemberFormGender">
															<label>Gender</label>
															<div class="input-group">
																<div class="input-group-addon">
																	<i class="fa   fa-group"></i>
																</div>
																<select class="form-control select2" id="gender"
																	name="gender" style="width: 100%;" >
																	<option value="N/A"
																		${requestScope.member.gender eq 'N/A' ? 'selected' : ''}>N/A</option>
																	<option value="Male"
																		${requestScope.member.gender eq 'Male' ? 'selected' : ''}>Male</option>
																	<option value="Female"
																		${requestScope.member.gender eq 'Female' ? 'selected' : ''}>Female</option>
																	<option value="Others"
																		${requestScope.member.gender eq 'Others' ? 'selected' : ''}>Others</option>
																</select>
															</div>
															<p id="errorGender"></p>
														</div>
														<!-- End Gender -->
														<!-- /.form group -->

														<!-- form group -->
														<!-- Category -->
														<div class="form-group" id="divMemberFormCategory">
															<label>Category</label>
															<div class="input-group">
																<div class="input-group-addon">
																	<i class="fa   fa-group"></i>
																</div>
																<select class="form-control select2" id="category"
																	name="category" style="width: 100%;"
																	>
																	<option value="N/A"
																		${requestScope.member.category eq 'N/A' ? 'selected' : ''}>N/A</option>
																	<option value="GEN"
																		${requestScope.member.category eq 'GEN' ? 'selected' : ''}>General</option>
																	<option value="SC"
																		${requestScope.member.category eq 'SC' ? 'selected' : ''}>Scheduled
																		Caste(SC)</option>
																	<option value="ST"
																		${requestScope.member.category eq 'ST' ? 'selected' : ''}>Scheduled
																		Tribe(ST)</option>
																	<option value="OBC"
																		${requestScope.member.category eq 'OBC' ? 'selected' : ''}>Other
																		Backward Classes(OBC)</option>

																</select>
															</div>
															<p id="errorCategory"></p>
														</div>
														<!-- End Entrance Fee -->
														<!-- /.form group -->



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
														<!-- Project Name -->
														<div class="form-group" id="divProjectCode">
															<label>Project Name</label>
															<div class="input-group">
																<div class="input-group-addon">
																	<i class="fa  fa-bars"></i>
																</div>
																<select class="form-control select2" id="projectCode"
																	name="projectCode" style="width: 100%;">
																	<option value="-1"
																		${requestScope.member.projectCd eq '-1' ? 'selected' : ''}>N/A</option>

																	<c:forEach items="${requestScope.projectList}"
																		var="project">
																		<option value="${project.getProjectId()}"
																			${requestScope.member.projectCd eq project.getProjectId() ? 'selected' : ''}>${project.getProjectName()}</option>
																	</c:forEach>
																</select>
															</div>
														</div>

														<!-- End Project Name -->
														<!-- /.form-group -->

														<!-- form-group -->
														<!-- Plot Size -->
														<div class="form-group" id="divPlotSize">
															<label>Plot Size</label>
															<div class="input-group">
																<span class="input-group-addon"><i
																	class="fa fa-info-circle "></i></span> <input type="text"
																	class="form-control" id="plotSize" name="plotSize"
																	value="${requestScope.member.plotSize}" />
															</div>
															<p id="errorPlotSize"></p>
														</div>

														<!-- Plot Size -->
														<!-- /.form group -->


														<!-- form-group -->
														<!--Net Plot Size -->
														<div class="form-group" id="divNetPlotSize">
															<label>Net Plot Size</label>
															<div class="input-group">
																<span class="input-group-addon"><i
																	class="fa fa-info-circle "></i></span> <input type="text"
																	class="form-control" id="netPlotSize"
																	name="netPlotSize"
																	value="${requestScope.member.netPlotSize}" />
															</div>
															<p id="errorNetPlotSize"></p>
														</div>

														<!--Net Plot Size -->
														<!-- /.form group -->

														<!-- form-group -->
														<!-- Plot No. -->
														<div class="form-group" id="divPlotNo">
															<label>Plot No.</label>
															<div class="input-group">
																<span class="input-group-addon"><i
																	class="fa fa-info-circle "></i></span> <input type="text"
																	class="form-control" id="plotNo" name="plotNo"
																	value="${requestScope.member.plotNo}" />
															</div>
															<p id="errorPlotNo"></p>
														</div>

														<!--Plot No. -->
														<!-- /.form group -->

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
																	<option value="0"
																		${requestScope.member.rC eq '0' ? 'selected' : ''}>N/A</option>
																	<option
																		${requestScope.member.rC eq 'R'.charAt(0) ? 'selected' : ''}>Residential</option>
																	<option
																		${requestScope.member.rC eq 'C'.charAt(0) ? 'selected' : ''}>Commercial</option>

																</select>
															</div>
														</div>

														<!-- End  Residential/Commercial -->
														<!-- /.form-group -->

														<!-- form group -->
														<!-- Establishment Charge -->
														<div class="form-group" id="divEstablishmentCharge">
															<label>Establishment Charge</label>
															<div class="input-group">
																<span class="input-group-addon"> <i
																	class="fa  fa-inr"></i></span> <input type="text"
																	class="form-control" id="establishmentCharge"
																	name="establishmentCharge"
																	value="${requestScope.member.establ}">
															</div>
															<p id="errorEstablishmentCharge"></p>
														</div>
														<!-- End Maintenance Charge -->
														<!-- /.form group -->
														<div class="form-group" id="divMaintenanceCharge">
															<label>Maintenance Charge</label>
															<div class="input-group">
																<span class="input-group-addon"> <i
																	class="fa  fa-inr"></i></span> <input type="text"
																	class="form-control" id="maintenanceCharge"
																	name="maintenanceCharge"
																	value="${requestScope.member.maint}">
															</div>
															<p id="errorMaintenanceCharge"></p>
														</div>
														<!-- End Maintenance Charge -->
														<!-- /.form group -->
														<!-- form group -->
														<!-- Security Deposit -->
														<div class="form-group" id="divSecurityDeposit">
															<label>Security Deposit</label>
															<div class="input-group">
																<span class="input-group-addon"> <i
																	class="fa  fa-inr"></i></span> <input type="text"
																	class="form-control" id="securityDeposit"
																	name="securityDeposit"
																	value="${requestScope.member.secDep}">
															</div>
															<p id="errorSecurityDeposit"></p>
														</div>
														<!--End Security Deposit-->
														<!-- /.form group -->



													</div>
													<!-- /.col -->
													<div class="col-md-6">

														<!--  form group -->
														<!-- Cost -->
														<div class="form-group" id="divCost">
															<label>Cost</label>
															<div class="input-group">
																<span class="input-group-addon"> <i
																	class="fa  fa-inr"></i></span> <input type="text"
																	class="form-control" id="cost" name="cost"
																	value="${requestScope.member.cost}">
															</div>
															<p id="errorCost"></p>
														</div>
														<!-- Cost -->



														<!-- /.form group -->
														<!--  form-group -->
														<!--Fullpay -->
														<div class="form-group" id="divFullpay">
															<label>Fullpay</label>
															<div class="input-group">
																<div class="input-group-addon">
																	<i class="fa  fa-bars"></i>
																</div>
																<select class="form-control select2" id="fullpay"
																	name="fullpay" style="width: 100%;">
																	<option  value="N/A"
																		${requestScope.member.fullPay eq 'N/A' ? 'selected' : ''}>N/A</option>
																	<option value="Y"
																		${requestScope.member.fullPay eq 'Y' ? 'selected' : ''}>Yes</option>
																	<option value="N"
																		${requestScope.member.fullPay eq 'N' ? 'selected' : ''}>No</option>

																</select>
															</div>
														</div>

														<!-- End  Fullpay -->
														<!-- /.form-group -->

														<!--  form-group -->
														<!-- Installment 1 -->
														<div class="form-group" id="divResidentialCommercial">
															<label> Installment 1</label>
															<div class="input-group">
																<div class="input-group-addon">
																	<i class="fa  fa-bars"></i>
																</div>
																<select class="form-control select2" id=" inst1"
																	name="inst1" style="width: 100%;">
																	<option value="N/A"
																		${requestScope.member.inst1 eq 'N/A' ? 'selected' : ''}>N/A</option>

																	<option value="Y"
																		${requestScope.member.inst1 eq 'Y' ? 'selected' : ''}>Yes</option>
																	<option value="N"
																		${requestScope.member.inst1 eq 'N' ? 'selected' : ''}>No</option>
																</select>
															</div>
														</div>

														<!-- End  Installment 1 -->
														<!-- /.form-group -->
														<!--  form-group -->
														<!-- Installment 2 -->
														<div class="form-group" id="divResidentialCommercial">
															<label> Installment 2</label>
															<div class="input-group">
																<div class="input-group-addon">
																	<i class="fa  fa-bars"></i>
																</div>
																<select class="form-control select2" id=" inst2"
																	name="inst2" style="width: 100%;">
																	<option value="N/A"
																		${requestScope.member.inst2 eq 'N/A' ? 'selected' : ''}>N/A</option>

																	<option value="Y"
																		${requestScope.member.inst2 eq 'Y' ? 'selected' : ''}>Yes</option>
																	<option value="N"
																		${requestScope.member.inst2 eq 'N' ? 'selected' : ''}>No</option>

																</select>
															</div>
														</div>

														<!-- End  Installment 2 -->
														<!-- /.form-group -->
														<!--  form-group -->
														<!-- Residential/Commercial -->
														<div class="form-group" id="divResidentialCommercial">
															<label> Installment 3</label>
															<div class="input-group">
																<div class="input-group-addon">
																	<i class="fa  fa-bars"></i>
																</div>
																<select class="form-control select2" id=" inst3"
																	name="inst3" style="width: 100%;">
																	<option value="N/A"
																		${requestScope.member.inst3 eq 'N/A' ? 'selected' : ''}>N/A</option>

																	<option value="Y"
																		${requestScope.member.inst3 eq 'Y' ? 'selected' : ''}>Yes</option>
																	<option value="N"
																		${requestScope.member.inst3 eq 'N' ? 'selected' : ''}>No</option>
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
																<select class="form-control select2" id="memberStatus"
																	name="memberStatus" style="width: 100%;">
																	<option value="0"
																		${requestScope.member.liveDead eq '0' ? 'selected' : ''}>N/A</option>

																	<option
																		${requestScope.member.liveDead eq 'L'.charAt(0) ? 'selected' : ''}>Live</option>
																	<option
																		${requestScope.member.liveDead eq 'D'.charAt(0) ? 'selected' : ''}>Dead</option>

																</select>
															</div>
														</div>

														<!-- End  Member Status -->
														<!-- /.form-group -->



														<!-- Opening Balance -->
														<div class="form-group" id="divOpeningBalance">
															<label>Opening Balance</label>
															<div class="input-group">
																<span class="input-group-addon"> <i
																	class="fa  fa-inr"></i></span> <input type="text"
																	class="form-control" id="openingBalance"
																	name="openingBalance"
																	value="${requestScope.member.opBal}">
															</div>
															<p id="errorOpeningBalance"></p>
														</div>
														<!-- Opening Balance -->
														<!-- /.form group -->

														<!-- Member  No. -->
														<div class="form-group" id="divRegistrationNo">
															<label>Member No.</label>
															<div class="input-group">
																<span class="input-group-addon"><i
																	class="fa fa-info-circle "></i></span> <input type="text"
																	class="form-control" id="memberNo" name="memberNo"
																	value="${requestScope.member.memberNo}" readonly />
															</div>
															<p id="errorMemberNo"></p>
														</div>

														<!--End Member No. -->

														<!-- / .form group -->
													</div>
													<!-- /.box-body -->
												</div>
											</div>
											<!-- new tab -->
											<div class="tab-pane" id="tab_3">
												<div class="row">
													<div class="col-md-6">
														<!-- Member  No. -->
														<div class="form-group" id="divRegistrationNo">
															<label>Member Age</label>
															<div class="input-group">
																<span class="input-group-addon"><i
																	class="fa fa-info-circle "></i></span> <input type="text"
																	class="form-control" id="memberAge" name="memberAge"
																	value="${requestScope.member.age}" readonly />
															</div>
															<p id="errorMemberAge"></p>
														</div>

														<!--End Member No. -->
														<!-- /.form group -->
														<!-- form group -->
														<!-- Membership Fee -->
														<div class="form-group" id="divMemberFormMembershipFee">
															<label>Membership Fee</label>
															<div class="input-group">
																<span class="input-group-addon"> <i
																	class="fa  fa-inr"></i></span> <input type="text"
																	class="form-control" id="membershipFee"
																	name="membershipFee"
																	value="${requestScope.member.memFee}" />
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
																	name="entranceFee"
																	value="${requestScope.member.memEntryFee}" />
															</div>
															<p id="errorEntranceFee"></p>
														</div>
														<!-- End Entrance Fee -->
														<!-- /.form group -->
														<!-- form group -->
														<!--Receipt Date-->
														<div class="form-group" id="divReceiptDate">
															<label>Receipt Date</label>

															<div class="input-group date">
																<div class="input-group-addon">
																	<i class="fa fa-calendar"></i>
																</div>
																<span id="formattedDate2" name="formattedDate2"
																	style="display: none;"><fmt:formatDate
																		type="date" pattern="dd/MM/yyyy"
																		value="${requestScope.member.receiptdt}" /></span> <input
																	type="text" class="form-control pull-right datepicker"
																	id="receiptdt" name="receiptdt" />
															</div>
															<p id="errorReceiptDate"></p>
															<!-- /.input group -->
														</div>
														<!--End Receipt Date -->
														<!-- /.form group -->
														<!--  form-group -->
														<!-- Registered -->
														<div class="form-group" id="divProjectCode">
															<label>Registered</label>
															<div class="input-group">
																<div class="input-group-addon">
																	<i class="fa  fa-bars"></i>
																</div>
																<select class="form-control select2" id="registered"
																	name="registered" style="width: 100%;">
																	<option value="N/A"
																		${requestScope.member.regi eq 'N/A' ? 'selected' : ''}>N/A</option>

																	<option value="Y"
																		${requestScope.member.regi eq 'Y' ? 'selected' : ''}>Yes</option>
																	<option value="N"
																		${requestScope.member.regi eq 'N' ? 'selected' : ''}>No</option>


																</select>
															</div>
														</div>

														<!-- End Registered -->
														<!-- /.form-group -->
														<!-- form-group -->
														<!--Registration Date-->
														<div class="form-group" id="divRegistrationDate">
															<label>Registration Date</label>

															<div class="input-group date">
																<div class="input-group-addon">
																	<i class="fa fa-calendar"></i>
																</div>
																<span id="formattedDate3" name="formattedDate3"
																	style="display: none;"><fmt:formatDate
																		type="date" pattern="dd/MM/yyyy"
																		value="${requestScope.member.regDt}" /></span> <input
																	type="text" class="form-control pull-right datepicker"
																	id="regDt" name="regDt" />
															</div>
															<p id="errorRegistrationDate"></p>
															<!-- /.input group -->
														</div>
														<!--End Registration Date -->
														<!-- /.form group -->
														<!-- form-group -->
														<!-- Registration No. -->
														<div class="form-group" id="divRegistrationNo">
															<label>Registration No.</label>
															<div class="input-group">
																<span class="input-group-addon"><i
																	class="fa fa-info-circle "></i></span> <input type="text"
																	class="form-control" id="registrationNo"
																	name="registrationNo"
																	value="${requestScope.member.regNo}" />
															</div>
															<p id="errorRegistrationNo"></p>
														</div>

														<!--End Registration No. -->
														<!-- /.form group -->

														<!-- form group -->
														<!--NOC Date-->
														<div class="form-group" id="divNOCDate">
															<label>NOC Date</label>

															<div class="input-group date">
																<div class="input-group-addon">
																	<i class="fa fa-calendar"></i>
																</div>
																<span id="formattedDate4" name="formattedDate4"
																	style="display: none;"><fmt:formatDate
																		type="date" pattern="dd/MM/yyyy"
																		value="${requestScope.member.nocDt}" /></span> <input
																	type="text" class="form-control pull-right datepicker"
																	id="nocdt" name="nocdt" />
															</div>
															<p id="errorNOCDate"></p>
															<!-- /.input group -->
														</div>
														<!--End NOC Date -->
														<!-- /.form group -->
														<!-- form group -->
														<!--Reference Date-->
														<div class="form-group" id="divReferenceDate">
															<label>Refund Date</label>

															<div class="input-group date">
																<div class="input-group-addon">
																	<i class="fa fa-calendar"></i>
																</div>
																<span id="formattedDate5" name="formattedDate5"
																	style="display: none;"><fmt:formatDate
																		type="date" pattern="dd/MM/yyyy"
																		value="${requestScope.member.refDt}" /></span> <input
																	type="text" class="form-control pull-right datepicker"
																	id="refDt" name="refDt" />
															</div>
															<p id="errorReferenceDate"></p>
															<!-- /.input group -->
														</div>
														<!--End Reference Date -->
														<!-- /.form group -->

														<!-- Reference Amount -->
														<div class="form-group" id="divReferenceAmount">
															<label>Refund Amount</label>
															<div class="input-group">
																<span class="input-group-addon"> <i
																	class="fa  fa-inr"></i></span> <input type="text"
																	class="form-control" id="refundAmount"
																	name="refundAmount"
																	value="${requestScope.member.refAmt}">
															</div>
															<p id="errorReferenceAmount"></p>
														</div>
														<!-- End Reference Amount -->
														<!-- form group -->


													</div>
													<!-- /.col -->
													<div class="col-md-6">

														<!-- form group -->
														<!-- Water Connection Charge -->
														<div class="form-group" id="divWaterConnectionCharge">
															<label>Water Connection Charge</label>
															<div class="input-group">
																<span class="input-group-addon"> <i
																	class="fa  fa-inr"></i></span> <input type="text"
																	class="form-control" id="waterConnectionCharge"
																	name="waterConnectionCharge"
																	value="${requestScope.member.waterConn}">
															</div>
															<p id="errorWaterConnectionCharge"></p>
														</div>
														<!-- End Water Connection Charge -->
														<!-- /.form group -->
														<!-- form group -->
														<!-- Water Charge -->
														<div class="form-group" id="divWaterCharge">
															<label>Water Charge</label>
															<div class="input-group">
																<span class="input-group-addon"> <i
																	class="fa  fa-inr"></i></span> <input type="text"
																	class="form-control" id="waterCharge"
																	name="waterCharge"
																	value="${requestScope.member.watChg}">
															</div>
															<p id="errorWaterCharge"></p>
														</div>
														<!-- Diversion -->
														<!-- /.form group -->
														<!-- form group -->
														<!--Water Connection Date-->
														<div class="form-group" id="divWaterConnectionDate">
															<label>Water Connection Date</label>

															<div class="input-group date">
																<div class="input-group-addon">
																	<i class="fa fa-calendar"></i>
																</div>
																<span id="formattedDate6" name="formattedDate6"
																	style="display: none;"><fmt:formatDate
																		type="date" pattern="dd/MM/yyyy"
																		value="${requestScope.member.waterConnDate}" /></span> <input
																	type="text" class="form-control pull-right datepicker"
																	id="waterConnDate" name="waterConnDate" />
															</div>
															<p id="errorWaterConnectionDate"></p>
															<!-- /.input group -->
														</div>
														<!--End Water Connection Date -->
														<!-- /.form group -->
														<!-- Diversion -->
														<div class="form-group" id="divExtraAmount">
															<label>Extra Amount</label>
															<div class="input-group">
																<span class="input-group-addon"> <i
																	class="fa  fa-inr"></i></span> <input type="text"
																	class="form-control" id="extraAmount" name="extraAmount"
																	value="${requestScope.member.extraAmount}">
															</div>
															<p id="errorExtraAmount"></p>
														</div>
														<!-- Diversion -->
														<!-- /.form group -->

														<!-- form-group -->
														<!-- Mutation No. -->
														<div class="form-group" id="divMutationNo">
															<label>Mutation No.</label>
															<div class="input-group">
																<span class="input-group-addon"><i
																	class="fa fa-info-circle "></i></span> <input type="text"
																	class="form-control" id="mutationNo" name="mutationNo"
																	value="${requestScope.member.mutaNo1}" />
															</div>
															<p id="errorMutationNo"></p>
														</div>

														<!--End Mutation No. -->
														<!-- /.form group -->
														<!-- form group -->
														<!--Mutation Date-->
														<div class="form-group" id="divMutationDate">
															<label>Mutation Date</label>

															<div class="input-group date">
																<div class="input-group-addon">
																	<i class="fa fa-calendar"></i>
																</div>
																<span id="formattedDate7" name="formattedDate7"
																	style="display: none;"><fmt:formatDate
																		type="date" pattern="dd/MM/yyyy"
																		value="${requestScope.member.mutaDt1}" /></span> <input
																	type="text" class="form-control pull-right datepicker"
																	id="mutaDt" name="mutaDt" />
															</div>
															<p id="errorMutationDate"></p>
															<!-- /.input group -->
														</div>
														<!--End Mutation Date -->
														<!-- /.form group -->
														<!--  form-group -->
														<!-- Eligible/Ineligible -->
														<div class="form-group" id="divEligibleIneligible">
															<label> Eligible/Ineligible</label>
															<div class="input-group">
																<div class="input-group-addon">
																	<i class="fa  fa-bars"></i>
																</div>
																<select class="form-control select2"
																	id=" eligibleIneligible" name="eligibleIneligible"
																	style="width: 100%;">
																	<option value="N/A"
																		${requestScope.member.eliInl eq 'N/A' ? 'selected' : ''}>N/A</option>

																	<option value="Eligible"
																		${requestScope.member.eliInl eq 'Eligible' ? 'selected' : ''}>Eligible</option>
																	<option value="Ineligible"
																		${requestScope.member.eliInl eq 'Ineligible' ? 'selected' : ''}>Ineligible</option>

																</select>
															</div>
														</div>

														<!-- End  Eligible/Ineligible -->
														<!-- /.form-group -->

														<!--  form-group -->
														<!-- Building Flag -->
														<div class="form-group" id="divBuildingFlag">
															<label>Building Flag</label>
															<div class="input-group">
																<div class="input-group-addon">
																	<i class="fa  fa-bars"></i>
																</div>
																<select class="form-control select2" id="buildingFlag"
																	name="buildingFlag" style="width: 100%;">
																	<option value="N/A"
																		${requestScope.member.buildFlag eq 'N/A' ? 'selected' : ''}>N/A</option>

																	<option value="C"
																		${requestScope.member.buildFlag eq 'C' ? 'selected' : ''}>Completed</option>
																	<option value="NC"
																		${requestScope.member.buildFlag eq 'NC' ? 'selected' : ''}>Not
																		Completed</option>
																	<option value="UC"
																		${requestScope.member.buildFlag eq 'UC' ? 'selected' : ''}>Under
																		Construction</option>

																</select>
															</div>
														</div>

														<!-- End  Building Flag -->
														<!-- /.form-group -->

														<!--  form-group -->
														<!-- Member Nominal -->
														<div class="form-group" id="divMemberNominal">
															<label>Member Nominal</label>
															<div class="input-group">
																<div class="input-group-addon">
																	<i class="fa  fa-bars"></i>
																</div>
																<select class="form-control select2" id="memberNominal"
																	name="memberNominal" style="width: 100%;">
																	<option value="N/A"
																		${requestScope.member.mNominal eq 'N/A' ? 'selected' : ''}>N/A</option>

																	<option value="C"
																		${requestScope.member.mNominal eq 'C' ? 'selected' : ''}>C</option>
																	<option value="None"
																		${requestScope.member.mNominal eq 'None' ? 'selected' : ''}>None</option>

																</select>
															</div>
														</div>

														<!-- End  Member Nominal -->
														<!-- /.form-group -->
														<!--  form-group -->
														<!--Defaulter -->
														<div class="form-group" id="divDefaulter">
															<label>Defaulter</label>
															<div class="input-group">
																<div class="input-group-addon">
																	<i class="fa  fa-bars"></i>
																</div>
																<select class="form-control select2" id="defaulter"
																	name="defaulter" style="width: 100%;">
																	<option value="N/A"
																		${requestScope.member.defaulter eq 'N/A' ? 'selected' : ''}>N/A</option>

																	<option value="Y"
																		${requestScope.member.defaulter eq 'Y' ? 'selected' : ''}>Yes</option>
																	<option value="N"
																		${requestScope.member.defaulter eq 'N' ? 'selected' : ''}>No</option>

																</select>
															</div>
														</div>

														<!-- End  Defaulter -->
														<!-- /.form-group -->







														<!-- /.form group -->
														<input type="hidden" class="form-control" id="operation"
															name="operation" value="edit" />
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
							<div class="box-footer">Member Details.</div>
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
	
	<script>
		function formin() {
			var form = document.getElementById("membershipEditForm");
			var elements = form.elements;
			for (var i = 0, len = elements.length; i < len; ++i) {
				elements[i].disabled = true;
			}
			document.getElementById("editbtn").disabled = false;
			document.getElementById("cancel").disabled = false;
			//Set formatted date in input fields
			document.getElementById("dob").value = document
					.getElementById("formattedDate1").innerHTML;
			document.getElementById("receiptdt").value = document
					.getElementById("formattedDate2").innerHTML;
			document.getElementById("regDt").value = document
					.getElementById("formattedDate3").innerHTML;
			document.getElementById("nocdt").value = document
					.getElementById("formattedDate4").innerHTML;
			document.getElementById("refDt").value = document
					.getElementById("formattedDate5").innerHTML;
			document.getElementById("waterConnDate").value = document
					.getElementById("formattedDate6").innerHTML;
			document.getElementById("mutaDt").value = document
					.getElementById("formattedDate7").innerHTML;

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

			//if (!(name == null || name === "")) {
			//	var nameValid = /^[a-zA-Z-. ]+$/;
			//	if (!nameValid.test(name)) {
			//		document.getElementById("errorFullName").innerHTML = 'Invalid Name';
			//		document.getElementById("divMemberFormName").className = 'alert alert-danger alert-dismissible';
			//		return false;
			//	}
			//	document.getElementById("errorFullName").innerHTML = "";
			//	document.getElementById("divMemberFormName").className = 'form-group has-success';
			//}

			//End Full Name Validation

		 <%--
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

			//if (email == null || email === "") {
			//	document.getElementById("errorEmail").innerHTML = error;
			//	document.getElementById("divMemberFormEmail").className = 'alert alert-danger alert-dismissible';
			//	return false;
			//
			//}

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
			//if (desig == null || desig === "") {
			//	document.getElementById("errorOccupation").innerHTML = error;
			//	document.getElementById("divMemberFormOccupation").className = 'alert alert-danger alert-dismissible';
			//	return false;

			//}
			document.getElementById("errorOccupation").innerHTML = "";
			document.getElementById("divMemberFormOccupation").className = 'form-group has-success';
			//End Occupation Validation

			//Phone Validation
			var phone = document.getElementById("memberPhone").value;
			//if (phone == null || phone === "") {

			//	document.getElementById("errorPhone").innerHTML = error;
			//	document.getElementById("divMemberFormPhone").className = 'alert alert-danger alert-dismissible';
			//	return false;

			//}

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
			//if (adhaar == null || adhaar === "") {
			//	document.getElementById("errorAdhaar").innerHTML = error;
			//	document.getElementById("divMemberFormAdhaar").className = 'alert alert-danger alert-dismissible';
			//	return false;

			//}

			if (!(pan == null || adhaar === "")) {
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

			//PAN Validation
			var pan = document.getElementById("memberPAN").value;
			//if (pan == null || pan === "") {
			//	document.getElementById("errorPAN").innerHTML = error;
			//	document.getElementById("divMemberFormPAN").className = 'alert alert-danger alert-dismissible';
			//	return false;
			//
			//}

			if (!(pan == null || pan === "")) {
				var panno = /^[a-zA-Z0-9]{10}$/;
				if (!(pan.match(panno))) {
					document.getElementById("errorPAN").innerHTML = "Invalid PAN Number";
					document.getElementById("divMemberFormPAN").className = 'alert alert-warning alert-dismissible';
					return false;
				}
				document.getElementById("errorPAN").innerHTML = "";
				document.getElementById("divMemberFormPAN").className = 'form-group has-success';
			}
			//End PAN Validation

			//Address 1 Validation
			var desig = document.getElementById("memberAddress1").value;
			//if (desig == null || desig == "") {
			//	document.getElementById("errorAddress1").innerHTML = error;
			//	document.getElementById("divMemberFormAddress1").className = 'alert alert-danger alert-dismissible';
			//	return false;

			//}
			document.getElementById("errorAddress1").innerHTML = "";
			document.getElementById("divMemberFormAddress1").className = 'form-group has-success';
			//End Address 1 Validation

			//Address 2 Validation
			var desig = document.getElementById("memberAddress2").value;
			//if (desig == null || desig == "") {
			//	document.getElementById("errorAddress2").innerHTML = error;
			//	document.getElementById("divMemberFormAddress2").className = 'alert alert-danger alert-dismissible';
			//	return false;

			//}
			document.getElementById("errorAddress2").innerHTML = "";
			document.getElementById("divMemberFormAddress2").className = 'form-group has-success';
			//End Address 2 Validation

			//City Validation
			var desig = document.getElementById("memberCity").value;
			//if (desig == null || desig == "") {
			//	document.getElementById("errorCity").innerHTML = error;
			//	document.getElementById("divMemberFormCity").className = 'alert alert-danger alert-dismissible';
			//	return false;
			//
			//}
			document.getElementById("errorCity").innerHTML = "";
			document.getElementById("divMemberFormCity").className = 'form-group has-success';
			//End City Validation

			//Mother Name Validation
			var name = document.getElementById("memberMotherName").value;
			//		if (name == null || name === "") {
			//		document.getElementById("errorMemberMotherName").innerHTML = error;
			//	document.getElementById("divMemberFormMotherName").className = 'alert alert-danger alert-dismissible';
			//	return false;
			//}

			if (!(name == null || name === "")) {
				var nameValid = /^[a-zA-Z-. ]+$/;
				if (!nameValid.test(name)) {
					document.getElementById("errorMemberMotherName").innerHTML = 'Invalid Name';
					document.getElementById("divMemberFormMotherName").className = 'alert alert-danger alert-dismissible';
					return false;
				}
				document.getElementById("errorMemberMotherName").innerHTML = "";
				document.getElementById("divMemberFormMotherName").className = 'form-group has-success';
			}

			//End Mother Name Validation

			//Nominee Name Validation
			//var name = document.getElementById("memberNomineeName").value;
			//if (name == null || name === "") {
			//	document.getElementById("errorNomineeName").innerHTML = error;
			//	document.getElementById("divMemberFormNominee").className = 'alert alert-danger alert-dismissible';
			//	return false;
			//}

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
			//if (desig == null || desig === "") {
			//	document.getElementById("errorNomineeRelation").innerHTML = error;
			//	document.getElementById("divMemberFormNomineeRelation").className = 'alert alert-danger alert-dismissible';
			//	return false;
			//
			//}
			document.getElementById("errorNomineeRelation").innerHTML = "";
			document.getElementById("divMemberFormNomineeRelation").className = 'form-group has-success';
			//End Nominee Relation Validation

			//Plot Size Validation
			//var plotSize = document.getElementById("plotSize").value;

			//if (plotSize == null || plotSize === "") {

			//	document.getElementById("errorPlotSize").innerHTML = error;
			//	document.getElementById("divPlotSize").className = 'alert alert-danger alert-dismissible';
			//	return false;
			//}
			//document.getElementById("errorPlotSize").innerHTML = "";
			//document.getElementById("divPlotSize").className = 'form-group has-success';

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
			//		var plotNo = document.getElementById("plotSize").value;

			//		if (!(plotNo == null || plotNo === "")) {
			//			var plotNoValid = /^[a-zA-Z0-9-\\/ ]+$/; 									
			//			if (!plotNoValid.test(plotNo)) {
			//				document.getElementById("errorPlotNo").innerHTML = 'Invalid Plot No.';
			//				document.getElementById("divPlotNo").className = 'alert alert-danger alert-dismissible';
			//				return false;
			//			}
			//			document.getElementById("errorPlotNo").innerHTML = "";
			//			document.getElementById("divPlotNo").className = 'form-group has-success';
			//		}

			//End Plot No. Validation

			// Establishment Charge Validation
			var diversion = document.getElementById("establishmentCharge").value;
			if (!(diversion == null || diversion === "")) {
				var diversionValid = /^\d+(\.\d+)?$/;
				if (!(diversion.match(diversionValid))) {
					document.getElementById("errorEstablishmentCharge").innerHTML = "Invalid amount";
					document.getElementById("divEstablishmentCharge").className = 'alert alert-warning alert-dismissible';
					return false;
				}
				document.getElementById("errorEstablishmentCharge").innerHTML = "";
				document.getElementById("divEstablishmentCharge").className = 'form-group has-success';
			}
			//End Establishment Charge Validation

			// Security Deposite Validation
			var diversion = document.getElementById("securityDeposit").value;
			if (!(diversion == null || diversion === "")) {
				var diversionValid = /^\d+(\.\d+)?$/;
				if (!(diversion.match(diversionValid))) {
					document.getElementById("errorSecurityDeposit").innerHTML = "Invalid amount";
					document.getElementById("divSecurityDeposit").className = 'alert alert-warning alert-dismissible';
					return false;
				}
				document.getElementById("errorSecurityDeposit").innerHTML = "";
				document.getElementById("divSecurityDeposit").className = 'form-group has-success';
			}
			//End Security Deposite Validation

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

			// Opening Balance Validation
			var extraAmount = document.getElementById("openingBalance").value;
			if (!(extraAmount == null || extraAmount === "")) {
				var extraAmountValid = /^\d+(\.\d+)?$/;
				if (!(extraAmount.match(extraAmountValid))) {
					document.getElementById("errorOpeningBalance").innerHTML = "Invalid amount";
					document.getElementById("divOpeningBalance").className = 'alert alert-warning alert-dismissible';
					return false;
				}
				document.getElementById("errorOpeningBalance").innerHTML = "";
				document.getElementById("divOpeningBalance").className = 'form-group has-success';
			}
			//End Opening Balance Validation

			//Membership Fee Validation
			var bal = document.getElementById("membershipFee").value;
			//		if (bal == null || bal === "") {
			//			document.getElementById("errorMembershipFee").innerHTML = error;
			//			document.getElementById("divMemberFormMembershipFee").className = 'alert alert-danger alert-dismissible';
			//			return false;
			//		}
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

			// Registration No. Validation
			var diversion = document.getElementById("registrationNo").value;
			if (!(diversion == null || diversion === "")) {
				var diversionValid = /^\d+$/;
				if (!(diversion.match(diversionValid))) {
					document.getElementById("errorRegistrationNo").innerHTML = "Invalid amount";
					document.getElementById("divRegistrationNo").className = 'alert alert-warning alert-dismissible';
					return false;
				}
				document.getElementById("errorRegistrationNo").innerHTML = "";
				document.getElementById("divRegistrationNo").className = 'form-group has-success';
			}
			//End Registration No. Validation

			// Reference Amount Validation
			var diversion = document.getElementById("referenceAmount").value;
			if (!(diversion == null || diversion === "")) {
				var diversionValid = /^\d+(\.\d+)?$/;
				if (!(diversion.match(diversionValid))) {
					document.getElementById("errorReferenceAmount").innerHTML = "Invalid amount";
					document.getElementById("divReferenceAmount").className = 'alert alert-warning alert-dismissible';
					return false;
				}
				document.getElementById("errorReferenceAmount").innerHTML = "";
				document.getElementById("divReferenceAmount").className = 'form-group has-success';
			}
			//End Reference Amount Validation

			// Water Connection Charge Validation
			var diversion = document.getElementById("waterConnectionCharge").value;

			if (!(diversion == null || diversion === "")) {
				var diversionValid = /^\d+(\.\d+)?$/;
				if (!(diversion.match(diversionValid))) {
					document.getElementById("errorWaterConnectionCharge").innerHTML = "Invalid amount";
					document.getElementById("divWaterConnectionCharge").className = 'alert alert-warning alert-dismissible';
					return false;
				}
				document.getElementById("errorWaterConnectionCharge").innerHTML = "";
				document.getElementById("divWaterConnectionCharge").className = 'form-group has-success';
			}
			//End Water Connection Charge Validation

			// Water Charge Validation
			var diversion = document.getElementById("waterCharge").value;

			if (!(diversion == null || diversion === "")) {

				var diversionValid = /^\d+(\.\d+)?$/;
				if (!(diversion.match(diversionValid))) {
					document.getElementById("errorWaterCharge").innerHTML = "Invalid amount";
					document.getElementById("divWaterCharge").className = 'alert alert-warning alert-dismissible';
					return false;
				}
				document.getElementById("errorWaterCharge").innerHTML = "";
				document.getElementById("divWaterCharge").className = 'form-group has-success';
			}
			//End Water Charge Validation

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
			
			// ExtraAmount Validation
			var diversion = document.getElementById("extraAmount").value;
			if (!(diversion == null || diversion === "")) {
				var diversionValid = /^\d+(\.\d+)?$/;
				if (!(diversion.match(diversionValid))) {
					document.getElementById("errorExtraAmount").innerHTML = "Invalid amount";
					document.getElementById("divExtraAmount").className = 'alert alert-warning alert-dismissible';
					return false;
				}
				document.getElementById("errorExtraAmount").innerHTML = "";
				document.getElementById("divExtraAmount").className = 'form-group has-success';
			}
			//End Diversion Validation

			// Mutation No. Validation
			var diversion = document.getElementById("mutationNo").value;
			if (!(diversion == null || diversion === "")) {
				var diversionValid = /^\d+$/;
				if (!(diversion.match(diversionValid))) {
					document.getElementById("errorMutationNo").innerHTML = "Invalid amount";
					document.getElementById("divMutationNo").className = 'alert alert-warning alert-dismissible';
					return false;
				}
				document.getElementById("errorMutationNo").innerHTML = "";
				document.getElementById("divMutationNo").className = 'form-group has-success';
			}
			//End  Mutation No. Validation
 --%>
			return true;
		}

		$(function() {
			//Initialize Select2 Elements
			$(".select2").select();

			//Date picker
			$('.datepicker').datepicker({
				format : 'dd/mm/yyyy',
				autoclose : true
			});

		});
	</script>