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
						<h3 class="box-title">Add Receipts Form</h3>
						<div class="box-tools pull-right">
							<span id="today"><fmt:formatDate type="date"
									pattern="dd/MM/yyyy" value="${requestScope.today}" /></span>
							<button type="button" class="btn btn-box-tool"
								data-widget="collapse" data-toggle="tooltip" title="Collapse">
								<i class="fa fa-minus"></i>
							</button>
						</div>
					</div>

					<!-- User Form -->
					<form action="#" method="post" onsubmit="return validateForm(this)">
						<div class="box-body">
							<div class="row">
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
								<!-- /.col -->
								<!-- col -->
								<div class="col-md-4">
									<!--  form group -->
									<!--  Receipt Number -->
									<div class="form-group" id="divFormReceiptNumber">
										<label>Receipt Number</label>
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa  fa-info-circle "></i></span> <input type="text"
												class="form-control" placeholder="Receipt Number"
												id="receiptNumber" name="receiptNumber" />
										</div>
										<p id="errorReceiptNumber"></p>
									</div>
									<!--  End Receipt Number -->
									<!-- /. form-group -->
								</div>
								<!-- /.col -->
								<!-- col -->
								<div class="col-md-4">
									<!-- form group -->
									<!-- Receipt Date -->
									<div class="form-group" id="divAccountFormDate">
										<label>Receipt Date :</label>
										<div class="input-group date">
											<div class="input-group-addon">
												<i class="fa fa-calendar"></i>
											</div>
											<input type="text" class="form-control pull-right datepicker"
												id="date" name="date" required="required" />
										</div>
										<p id="errorReceiptDate"></p>
										<!-- /.input group -->
									</div>
									<!--End Receipt Date -->
									<!-- /.form group -->
								</div>
								<!-- /.col -->
							</div>
							<!-- /.row -->
							<!-- Row Default box -->
							<div class="row">
								<div class="box-header with-border">
									<h3 class="box-title">Member Details</h3>
								</div>
								<div class="box-body">
									<dl class="dl-horizontal" id="memberDetails">
									</dl>

								</div>
								<!-- /.box-body -->
							</div>
							<!-- /.Row Default box -->
							<!-- Row Default box -->
							<div class="row">
								<div class="box-header with-border">
									<h3 class="box-title">Account Details</h3>
									<div class="box-tools pull-right">
										<button id="addAccount" type="button" class="btn btn-box-tool">
											<i class="fa fa-plus"> Add More</i>
										</button>
									</div>
								</div>
								<input id="totalAccounts" name="totalAccounts" type="hidden"
									value="1">
								<div id="accounts" class="box-body">
									<div class="panel box box-primary">
										<div class="box-header with-border">
											<h4 class="box-title">Account #1</h4>
											<div class="box-tools pull-right">
												<button type="button" class="btn btn-box-tool"
													data-widget="collapse" data-toggle="tooltip"
													title="Collapse">
													<i class="fa fa-minus"></i>
												</button>
											</div>
										</div>
										<div class="box-body">
											<div class="row">
												<div class="col-md-4">
													<!--  form-group -->
													<!-- Account Code -->
													<div class="form-group" id="divFormAccountCode1">
														<label>Account Code</label>
														<div class="input-group">
															<span class="input-group-addon"><i
																class="fa fa-info-circle"></i></span> <input type="text"
																class="form-control" placeholder="Account Code"
																id="accountCode1" name="accountCode1" />
														</div>
														<p id="errorAccountCode1"></p>
													</div>
													<!-- End Account Code -->
													<!-- /.form-group -->

													<!-- form group -->
													<!-- Amount -->
													<div class="form-group" id="divFormAmount1">
														<label>Amount</label>
														<div class="input-group">
															<span class="input-group-addon"><i
																class="fa fa-inr"></i></span> <input type="text"
																class="form-control" placeholder="0.00" id="amount1"
																name="amount1" />
														</div>
														<p id="errorAmount1"></p>
													</div>
													<!-- End Amount -->
													<!-- /.form group -->

												</div>
												<div class="col-md-8">

													<!--  form-group -->
													<!-- Account Name -->
													<div class="form-group" id="divFormAccountName1">
														<label>Account Name</label>
														<div class="input-group">
															<span class="input-group-addon"><i
																class="fa fa-bars"></i></span> <input type="text"
																class="form-control" placeholder="Account Name"
																id="accountName1" name="accountName1" />
														</div>
														<p id="errorAccountName1"></p>
													</div>
													<!-- End Account Name -->
													<!-- /.form-group -->

													<!--  form-group -->
													<!-- Remarks -->
													<div class="form-group" id="divFormRemarks1">
														<label>Remarks</label>
														<div class="input-group">
															<span class="input-group-addon"><i
																class="fa fa-info"></i></span> <input type="text"
																class="form-control" placeholder="Remarks" id="remarks1"
																name="remarks1" />
														</div>
														<p id="errorRemarks1"></p>
													</div>
													<!-- End Remarks -->
													<!-- /.form-group -->

												</div>
												<!-- /.box-body -->
											</div>
										</div>
									</div>

								</div>
								<!-- /.box-body -->
							</div>
							<!-- /.Row Default box -->
							<!-- Row Default box -->
							<div class="row">
								<div class="box-header with-border">
									<h3 class="box-title">Payment Details</h3>
								</div>
								<div class="box-body">
									<div class="row">
										<div class="col-md-4">
											<!--  form-group -->
											<!-- Bank Code -->
											<div class="form-group" id="divFormBankCode">
												<label>Bank Code</label>
												<div class="input-group">
													<span class="input-group-addon"><i
														class="fa fa-bars"></i></span> <input type="text"
														class="form-control" placeholder="Bank Code" id="bankCode"
														name="bank Code" />
												</div>
												<p id="errorBankCode"></p>
											</div>
											<!-- End Bank Code -->
											<!-- /.form-group -->

											<!-- form group -->
											<!-- Payment Mode -->
											<div class="form-group" id="divFormPaymentMode">
												<label>Payment Mode</label>
												<div class="input-group">
													<div class="input-group-addon">
														<i class="fa fa-check-circle"></i>
													</div>
													<select class="form-control select2" id="paymentMode"
														name="paymentMode" style="width: 100%;"
														required="required">
														<option>Cash</option>
														<option>Cheque</option>
														<option>Demand Draft</option>
														<option>RTGS</option>
														<option>NEFT</option>
													</select>
												</div>
											</div>
											<!-- End Payment Mode -->
											<!-- /.form group -->

											<!--  form-group -->
											<!-- Payment Mode -->
											<div class="form-group" id="divFormTotalAmount">
												<label>Total Amount</label>
												<div class="input-group">
													<span class="input-group-addon"><i class="fa fa-inr"></i></span>
													<input type="text" class="form-control" placeholder="0.00"
														id="totalAmount" name="totalAmount" />
												</div>
												<p id="errorTotalAmount"></p>
											</div>
											<!-- End Total Amount -->
											<!-- /.form-group -->

										</div>
										<div class="col-md-8">

											<!--  form-group -->
											<!-- Bank Name -->
											<div class="form-group" id="divFormBankName">
												<label>Bank Name</label>
												<div class="input-group">
													<span class="input-group-addon"><i
														class="fa fa-info-circle"></i></span> <input type="text"
														class="form-control" placeholder="Bank Name" id="bankName"
														name="bankName" />
												</div>
												<p id="errorbankName"></p>
											</div>
											<!-- End Bank Name -->
											<!-- /.form-group -->

											<!--  form-group -->
											<!-- Transction ID -->
											<div class="form-group" id="divFormTransctionID">
												<label>Payment Transaction ID</label>
												<div class="input-group">
													<span class="input-group-addon"><i
														class="fa fa-credit-card"></i></span> <input type="text"
														class="form-control" placeholder="Cheque/DD number"
														id="transctionID" name="transctionID" />
												</div>
												<p id="errorTransctionID"></p>
											</div>
											<!-- End Transction ID -->
											<!-- /.form-group -->

											<!--  form-group -->
											<!-- Payment Bank -->
											<div class="form-group" id="divFormPaymentBank">
												<label>Bank, Branch</label>
												<div class="input-group">
													<span class="input-group-addon"><i
														class="fa fa-building-o"></i></span> <input type="text"
														class="form-control" placeholder="Payment Bank, Branch"
														id="paymentBank" name="paymentBank" />
												</div>
												<p id="errorPaymentBank"></p>
											</div>
											<!-- End Payment Bank -->
											<!-- /.form-group -->

											<!--  form-group -->
											<!-- Payment Bank City -->
											<div class="form-group" id="divFormCity">
												<label>City</label>
												<div class="input-group">
													<span class="input-group-addon"><i
														class="fa fa-map-marker"></i></span> <input type="text"
														class="form-control" placeholder="City" id="city"
														name="city" />
												</div>
												<p id="errorCity"></p>
											</div>
											<!-- End Payment Bank City -->
											<!-- /.form-group -->

										</div>
										<!-- /.box-body -->
									</div>
								</div>
								<!-- /.box-body -->
							</div>
							<!-- /.Row Default box -->
						</div>
						<!-- /.box-body -->


						<div class="row">
							<div class="col-xs-4" align="center">
								<button type="submit" class="btn btn-primary btn-block btn-flat">Submit</button>
							</div>
							<div class="col-xs-4" align="center">
								<button type="reset" class="btn btn-block btn-danger">Cancel</button>
							</div>
						</div>

					</form>

					<!-- User Form -->

					<!-- /.box-body -->
					<div class="box-footer">Provide the Details For adding
						receipts</div>
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

	<script type="text/javascript">
		$(function() {
			//Set formatted date in input fields
			document.getElementById("date").value = document
					.getElementById("today").innerHTML;
			//Function to Add More Accounts
			var button = document.getElementById('addAccount');
			$(button)
					.click(
							function(e) {
								e.preventDefault();
								var n = document
										.getElementById('totalAccounts').value;
								n++;
								$('#accounts')
										.append(
												'<div class="panel box box-primary"><div class="box-header with-border"><h4 class="box-title">Account #'
														+ n
														+ '</h4>'
														+ '<div class="box-tools pull-right"> '
														+ '<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">'
														+ '<i class="fa fa-minus"></i></button>'
														+ '</div></div>'
														+ '<div class="box-body"><div class="row">'
														+ '<div class="col-md-4">'
														+ '<div class="form-group" id="divFormAccountCode' + n +'">'
														+ '<label>Account Code</label>'
														+ '<div class="input-group">'
														+ '<span class="input-group-addon"><i class="fa fa-info-circle"></i></span> <input type="text" class="form-control" placeholder="Account Code" id="accountCode' + n +'" name="accountCode' + n +'" />'
														+ '</div><p id="errorAccountCode' + n +'"></p></div>'
														+

														'<div class="form-group" id="divFormAmount' + n +'">'
														+ '<label>Amount</label>'
														+ '<div class="input-group">'
														+ '<span class="input-group-addon"><i class="fa fa-inr"></i></span>'
														+ '<input type="text" class="form-control" placeholder="0.00" id="amount' + n +'" name="amount' + n +'" />'
														+ '</div><p id="errorAmount' + n +'"></p></div></div>'
														+ '<div class="col-md-8">'
														+ '<div class="form-group" id="divFormAccountName' + n +'">'
														+ '<label>Account Name</label>'
														+ '<div class="input-group">'
														+ '<span class="input-group-addon"><i class="fa fa-bars"></i></span> <input type="text" class="form-control" placeholder="Account Name" id="accountName' + n +'" name="accountName' + n +'" />'
														+ '</div><p id="errorAccountName' + n +'"></p></div>'
														+ '<div class="form-group" id="divFormRemarks' + n +'">'
														+ '<label>Remarks</label>'
														+ '<div class="input-group">'
														+ '<span class="input-group-addon"><i class="fa fa-info"></i></span> <input type="text" class="form-control" placeholder="Remarks" id="remarks' + n +'" name="remarks' + n +'" />'
														+ '</div><p id="errorRemarks' + n +'"></p></div></div></div>');
								document.getElementById('totalAccounts').value = n;
							});
		});
	</script>
	<script>
		function validateForm(form) {
			error = "Please fill this field .";

			//Member ID validation
			var id = document.getElementById("memberID").value;
			if (id == null || id === "") {
				document.getElementById("errorMemberID").innerHTML = error;
				document.getElementById("divFormMemberID").className = 'alert alert-danger alert-dismissible';
				document.getElementById("divFormMemberID").scrollIntoView();
				return false;
			}

			if (!(id == null || id === "")) {
				var idValid = /^\d+$/;
				if (!id.match(idValid)) {
					document.getElementById("errorMemberID").innerHTML = 'Invalid ID';
					document.getElementById("divFormMemberID").className = 'alert alert-warning alert-dismissible';
					document.getElementById("divFormMemberID").scrollIntoView();
					return false;
				}
				document.getElementById("errorMemberID").innerHTML = "";
				document.getElementById("divFormMemberID").className = 'form-group has-success';
			}

			//End Member ID validation

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

			//Bank Code Validation
			var bankCode = document.getElementById("bankCode").value;
			if (bankCode == null || bankCode === "") {
				document.getElementById("errorBankCode").innerHTML = error;
				document.getElementById("divFormBankCode").className = 'alert alert-danger alert-dismissible';
				document.getElementById("divFormBankCode").scrollIntoView();
				return false;
			}

			if (!(bankCode == null || bankCode === "")) {
				var codeValid = /^[a-zA-Z0-9-]+$/;
				if (!codeValid.test(bankCode)) {
					document.getElementById("errorBankCode").innerHTML = "Invaild Bank Code ";
					document.getElementById("divFormBankCode").className = 'alert alert-warning alert-dismissible';
					document.getElementById("divFormBankCode").scrollIntoView();
					return false;
				}
				document.getElementById("errorBankCode").innerHTML = "";
				document.getElementById("divFormBankCode").className = 'form-group has-success';
			}
			//End Bank Code Validation

			//Total Amount Validation
			var amt = document.getElementById("totalAmount").value;
			if (amt == null || amt === "") {
				document.getElementById("errorTotalAmount").innerHTML = error;
				document.getElementById("divFormTotalAmount").className = 'alert alert-danger alert-dismissible';
				document.getElementById("divFormTotalAmount").scrollIntoView();
				return false;
			}
			if (!(amt == null || amt === "")) {
				var balanceValid = /^\d+(\.\d+)?$/;
				if (!(bal.match(balanceValid))) {
					document.getElementById("errorTotalAmount").innerHTML = "Invalid Amount";
					document.getElementById("divFormTotalAmount").className = 'alert alert-warning alert-dismissible';
					document.getElementById("divFormTotalAmount")
							.scrollIntoView();
					return false;
				}
				document.getElementById("errorTotalAmount").innerHTML = "";
				document.getElementById("divFormTotalAmount").className = 'form-group has-success';
			}
			//End Total Amount Validation

			//Bank Name Validation
			var name = document.getElementById("bankName").value;
			if (!(name == null || name === "")) {
				var nameValid = /^[a-zA-Z ]+$/;
				if (!name.match(nameValid)) {
					document.getElementById("errorFullName").innerHTML = 'Invalid Name';
					document.getElementById("divFormBankName").className = 'alert alert-warning alert-dismissible';
					document.getElementById("divFormBankName").scrollIntoView();
					return false;
				}
				document.getElementById("errorBankName").innerHTML = "";
				document.getElementById("divFormBankName").className = 'form-group has-success';
			}
			//End Bank Name Validation

			//Transaction ID Validation
			var tr = document.getElementById("transactionID").value;
			if (!(tr == null || tr === "")) {
				var trValid = /^[a-zA-Z0-9- ]+$/;
				if (!tr.match(trValid)) {
					document.getElementById("errorTransactionID").innerHTML = 'Invalid Transaction ID';
					document.getElementById("divFormTransactionID").className = 'alert alert-warning alert-dismissible';
					document.getElementById("divFormTransactionID")
							.scrollIntoView();
					return false;
				}
				document.getElementById("errorTransactionID").innerHTML = "";
				document.getElementById("divFormTransactionID").className = 'form-group has-success';
			}
			//End Transaction ID Validation

			//Bank, Branch Name Validation
			var pay = document.getElementById("paymentBank").value;
			if (!(pay == null || pay === "")) {
				var payValid = /^[a-zA-Z,- ]+$/;
				if (!pay.match(payValid)) {
					document.getElementById("errorPaymentBank").innerHTML = 'Invalid Name';
					document.getElementById("divFormPaymentBank").className = 'alert alert-warning alert-dismissible';
					document.getElementById("divFormPaymentBank")
							.scrollIntoView();
					return false;
				}
				document.getElementById("errorPaymentBank").innerHTML = "";
				document.getElementById("divFormPaymentBank").className = 'form-group has-success';
			}
			//End Bank, Branch Name Validation

			//City Validation
			var city = document.getElementById("city").value;
			if (!(city == null || city === "")) {
				var cityValid = /^[a-zA-Z ]+$/;
				if (!city.match(cityValid)) {
					document.getElementById("errorCity").innerHTML = 'Invalid City Name';
					document.getElementById("divFormCity").className = 'alert alert-warning alert-dismissible';
					document.getElementById("divFormCity").scrollIntoView();
					return false;
				}
				document.getElementById("errorCity").innerHTML = "";
				document.getElementById("divFormCity").className = 'form-group has-success';
			}
			//End City Validation

			return true;
		}

		$(function() {
			//Date picker
			$('.datepicker').datepicker({
				format : 'dd/mm/yyyy',
				autoclose : true
			});
			//Initialize Select2 Elements
			$(".select2").select2();
		});
		
		//Auto fill data
		$(document).ready(function() {
			$('#memberID').bind("blur", function(e) {
				e.preventDefault();
				var id = $('#memberID').val();
				$.ajax({
                    url: 'http://localhost:8080/DanishHousing/ReceiptAutoFill',
                    dataType: 'json',
                    type: 'post',
                    data: {
                    	'id' : id
                    },
                    
                    success: function(data) {
                    	var data0 = data["data"][0];
                    	var data1 = data["data"][1];
          				var bool = data0["memberId"] === 0;
          				$('#divFormMemberID').toggleClass('alert alert-danger alert-dismissible', bool);
          				$('#memberDetails').empty();
          				$('#errorMemberID').empty();
          				if(data0["memberId"] === 0) {
          					$('#errorMemberID').text('MemberID doesn\'t exist');
          				} else {
	                        $('#memberDetails').append('<dt>Full Name</dt><dd>'+ data0["prefix"] + ' ' + data0["memName"] + ' ' + data0["fHRelation"] + ' ' + data0["fHRelName"] +'</dd>' +
									'<dt>Address</dt><dd>' + data0["address1"] + '</dd><dd>' + data0["address2"] + '</dd><dd>' + data0["address3"] + '</dd>' +
									'<dt>Plot Number</dt><dd>' + data0["plotNo"] + '</dd>' +
									'<dt>Plot Size</dt><dd>' + data0["plotSize"] + '</dd>' +
									'<dt>Net Plot Size</dt><dd>' + data0["netPlotSize"] + '</dd>' +
									'<dt>Project</dt><dd>' + data1["projectName"] + ' - ' + data1["projectId"] + '</dd>' +
									'<dt>Project Type</dt><dd>' + data1["bungProject"] + '</dd>');
          					
          				}
                    },
                    
                    error: function(req, status, err) {
                        alert('Error');
                        console.log(req + ' ' + status + ' ' + err);
                    }

                });
			});
		});
	</script>