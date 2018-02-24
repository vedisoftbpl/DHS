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
				<h1>Bank Balance</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Examples</a></li>
					<li class="active">Bank Balance</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- Default box -->
				<div class="box box-primary">
					<div class="box-header with-border">

						<div class="box-tools pull-right">
							<span id="today">${requestScope.date}</span>
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
						action="${pageContext.request.contextPath}/admin/pages/BalanceViewController"
						method="post" onsubmit="return validateForm(this)" id="form">
						<div class="box-body">
							<div class="row">
								<div class="col-md-2"></div>
								<div class="col-md-4">
									<!-- form group -->
									<!-- Receipt Date -->
									<div class="form-group" id="divAccountFormDate">
										<label>Select Date :</label>
										<div class="input-group date">
											<div class="input-group-addon">
												<i class="fa fa-calendar"></i>
											</div>
											<input type="text" class="form-control pull-right datepicker"
												id="date" name="date" required="required"
												value="${requestScope.date}" />
										</div>
										<p id="errorReceiptDate"></p>
										<!-- /.input group -->
									</div>
									<!--End Receipt Date -->
									<!-- /.form group -->
								</div>
								<div class="col-md-2" align="center">
									<label>&nbsp;</label>
									<button type="submit" class="btn btn-block btn-info">View</button>
									<br>
								</div>
								<div class="col-md-2" align="center">
									<label>&nbsp;</label>
									<button type="submit"  name="printButton" class="btn btn-block btn-info" value="print">Print</button>
									<br>
								</div>
							</div>
							<div class="row">

								<c:forEach var="ac" items="${sessionScope.accList}"
									varStatus="loop">
									<c:set var="counter" value="${loop.index}" />
									<c:if test="${counter < 6 }">
										<div class="col-md-2">
											<div class="box box-info box-solid"
												style="height: 120px; width: 160px;">
												<div class="box-header with-border"
													style="background-color: #3c8dbc; height: 75px;">
													<h3 class="box-title">${ac.key}</h3>

													<div class="box-tools pull-right">
														<button type="button" class="btn btn-box-tool"
															data-widget="collapse">
															<i class="fa fa-minus"></i>
														</button>
													</div>
													<!-- /.box-tools -->
												</div>
												<!-- /.box-header -->
												<div class="box-body" align="left">
													<span><fmt:setLocale value="en_IN" />
														<fmt:formatNumber value="${ac.value}" type="currency" /></span>
												</div>
												<!-- /.box-body -->
											</div>
											<!-- /.box -->
										</div>
									</c:if>
								</c:forEach>
							</div>

							<div class="row">
								<c:forEach var="ac" items="${sessionScope.accList}"
									varStatus="loop">
									<c:set var="counter" value="${loop.count}" />
									<c:if test="${counter > 6 }">
										<div class="col-md-2">
											<div class="box box-info box-solid"
												style="height: 120px; width: 160px;">
												<div class="box-header with-border"
													style="background-color: #3c8dbc; height: 75px;">
													<h3 class="box-title">${ac.key}</h3>

													<div class="box-tools pull-right">
														<button type="button" class="btn btn-box-tool"
															data-widget="collapse">
															<i class="fa fa-minus"></i>
														</button>
													</div>
													<!-- /.box-tools -->
												</div>
												<!-- /.box-header -->
												<div class="box-body" align="left">
													<span><fmt:setLocale value="en_IN" />
														<fmt:formatNumber value="${ac.value}" type="currency" /></span>
												</div>
												<!-- /.box-body -->
											</div>
											<!-- /.box -->
										</div>
									</c:if>
								</c:forEach>
							</div>

							<!-- /.row -->
							<!-- Row Default box -->

							<!-- /.Row Default box -->
							<!-- Row Default box -->

							<!-- /.Row Default box -->
							<!-- Row Default box -->

							<!-- /.Row Default box -->
						</div>
						<!-- /.box-body -->

						<input id="operation" name="operation" type="hidden" value="show">



					</form>

					<!-- User Form -->

					<!-- /.box-body -->
					<div class="box-footer">View Bank Balance Date Wise</div>
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
			//Date picker
			$('.datepicker').datepicker({
				format : 'dd/mm/yyyy',
				autoclose : true
			});
			//Initialize Select2 Elements
			$(".select2").select2();
		});
	</script>