<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="../../plugins/datatables/dataTables.bootstrap.css">
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
						<h3 class="box-title">Table</h3>
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

					<!-- User Form -->
					<div class="box-body">
						<div class="row no-print">
							<div class="col-xs-12">
								<a
									href="${pageContext.request.contextPath}/admin/pages/MasterAccountFormController"
									class="btn btn-default"><i class="fa fa-plus-square"></i>
									New Account Master</a>
							</div>
						</div>
						<div class="form-group" id="typeError">
						<label class="control-label" id="errorTop"></label>
					</div>
						<br>
						<table id="example1" class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>ANX. CD.</th>
									<th>Account Code</th>
									<th>Account Name</th>
									<th>Account Class</th>
									<th>Address</th>
									<th>IXPGE</th>
									<th>Flag</th>
									<th>Project Code</th>


									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${requestScope.accountMasterList}" var="acmas">
									<tr>

										<td><c:out value="${acmas.anxCd}" /></td>
										<td><c:out value="${acmas.acCode}" /></td>
										<td><c:out value="${acmas.acName}" /></td>
										<td><c:out value="${acmas.acClass}" /></td>
										<td><c:out value="${acmas.address}" /></td>
										<td><c:out value="${acmas.ixpge}" /></td>
										<td><c:out value="${acmas.flag}" /></td>
										<td><c:out value="${acmas.projCd}" /></td>

										<td><a href="${pageContext.request.contextPath}/admin/pages/MasterAccountFormController?operation=show&showId=${acmas.masterAccountId}"> <i class="fa fa-edit"></i>View
										</a></td>

									</tr>
								</c:forEach>

							</tbody>
							<tfoot>
								<th>ANX. CD.</th>
								<th>Account Code</th>
								<th>Account Name</th>
								<th>Account Class</th>
								<th>Address</th>
								<th>IXPGE</th>
								<th>Flag</th>
								<th>Project Code</th>


								<th></th>
								</tr>
							</tfoot>
						</table>
					</div>
					<!-- /.box-body -->
					<!-- User Form -->
					<!-- /.box-body -->
					<div class="box-footer">Footer</div>
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
	<script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="../../plugins/datatables/dataTables.bootstrap.min.js"></script>
	<script>
	<c:choose>
	<c:when test="${requestScope.msg eq '1'}">
	$(document).ready(function() {
		$("#typeError").addClass("form-group has-success");
		$("#errorTop")
		.html(
				"Record Updated Successfully.");
	});
	</c:when>
	<c:when test="${requestScope.msg eq '2'}">
	$(document).ready(function() {
		$("#typeError").addClass("form-group has-error");
		$("#errorTop")
		.html(
				"Fail to update Record.");
	});
	</c:when>
	</c:choose>
	
		$(function() {
			$("#example1").DataTable();
		});
	</script>