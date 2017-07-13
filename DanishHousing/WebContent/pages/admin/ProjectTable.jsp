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
		<!-- Content Wrapper.																																																													 Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>Project</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Examples</a></li>
					<li class="active">Project</li>
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
									href="${pageContext.request.contextPath}/admin/pages/ProjectFormController"
									class="btn btn-default"><i class="fa fa-plus-square"></i>
									New Project</a>
							</div>
						</div>

						<table id="example1" class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>Project Name</th>
									<th>Project Type</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${requestScope.projectList}" var="project">
									<tr>

										<td><c:out value="${project.projectName}" /></td>


										<c:forEach items="${requestScope.enumList}" var="proj">
											<c:choose>
												<c:when test="${project.bungProject eq proj.getValue()}">
													<td><c:out value="${proj}" /></td>
												</c:when>
											</c:choose>
										</c:forEach>
										<c:choose>
											<c:when test="${project.bungProject eq 'P'}">
												<td>Plot</td>
											</c:when>

										</c:choose>
										<td><a
											href="${pageContext.request.contextPath}/admin/pages/ProjectFormController?operation=show&showId=${project.projectId}">
												<i class="fa fa-edit"></i>View
										</a></td>

									</tr>
								</c:forEach>

							</tbody>
							<tfoot>
								<tr>

									<th>Project Name</th>
									<th>Project Type</th>
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
		$(function() {
			$("#example1").DataTable();
		});
	</script>