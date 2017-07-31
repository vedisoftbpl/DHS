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
				<h1>User</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Master Data</a></li>
					<li class="active">User</li>
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
								<a href="${pageContext.request.contextPath}/admin/pages/UserFormController" class="btn btn-default"><i
									class="fa fa-plus-square"></i> New User</a>
							</div>
						</div>
					
						<div class="form-group" id="typeError">
						<label class="control-label" id="errorTop"></label>
					</div>
					
						<table id="example1" class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>Name</th>
									<th>Email</th>
									<th>Mobile</th>
									<th>Designation</th>
									<th>View</th>
								</tr>
							</thead>
							<tbody>
							
							<c:forEach items="${requestScope.usersList}" var="user">
									<tr>
										<td><c:out value="${user.name}" /></td>
										<td><c:out value="${user.email}" /></td>
										<td><c:out value="${user.mobile}" /></td>
										<td><c:out value="${user.designation}" /></td>
										<td><a href="${pageContext.request.contextPath}/admin/pages/UserFormController?operation=show&showId=${user.userId}"> <i class="fa fa-edit"></i>View
										</a></td>
									</tr>
								</c:forEach>
									
							</tbody>
							<tfoot>
								<tr>
									<th>Name</th>
									<th>Email</th>
									<th>Mobile</th>
									<th>Designation</th>
									<th>View</th>
								</tr>
							</tfoot>
						</table>
					</div>
					<!-- /.box-body -->
					<!-- User Form -->
					<!-- /.box-body -->
					
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
	<c:when test="${param.msg=='1'}">
	$(document).ready(function() {
		$("#c").addClass("form-group has-success");
		$("#errorTop").html("Record Updated Successfully.");
	});
	</c:when>
	<c:when test="${param.msg=='2'}">
	$(document).ready(function() {
		$("#typeError").addClass("form-group has-error");
		$("#errorTop").html("Fail to Update Record.");
	});
	</c:when>
	</c:choose>
	
		$(function() {
			$("#example1").DataTable();
		});
	</script>