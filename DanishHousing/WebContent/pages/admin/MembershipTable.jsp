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
				<h1>Member</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Master Data</a></li>
					<li class="active">Member</li>
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

					<!-- Member Form -->
					<div class="box-body">
						<div class="row no-print">
							<div class="col-xs-12">
								<a href="${pageContext.request.contextPath}/admin/pages/MemberFormController" class="btn btn-default"><i
									class="fa fa-plus-square"></i> New Member</a>
							</div>
						</div>
						<br>
						<table id="example1" class="table table-bordered table-striped">
							<thead>
								<tr>
								   
									
									<th>Plot No.</th>
									<th>Name</th>
									<th>F/H Name</th>
									<th>DOB</th>
									<th>Address</th>
									<th>Email</th>
									<th>Mobile</th>
									<th>Receipt Date</th>
									<th>Status</th>
									
									
									<th></th>
									
								</tr>
							</thead>
							<tbody>
							
							<c:forEach items="${requestScope.membersList}" var="member">
									<tr>
										
										<td><c:out value="${member.plotNo}" /></td>
										<td><c:out value="${member.memName}" /></td>
										<td><c:out value="${member.fHRelation} ${member.fHRelName}" /></td>
										<td><c:out value="${member.dob}" /></td>
										<td><c:out value="${member.address1}, ${member.address2}, ${member.address3}" /></td>
										<td><c:out value="${member.email}" /></td>
										<td><c:out value="${member.mobile}" /></td>
										<td><c:out value="${member.receiptdt}" /></td>
										
										<c:choose>
											
											<c:when test="${member.liveDead eq 'L'.charAt(0)}">
												<td>Live</td>
											</c:when>

											<c:when test="${member.liveDead eq 'D'.charAt(0)}">
												<td>Dead</td>
											</c:when>
										</c:choose>
										
										<td><a href="#"> <i class="fa fa-edit"></i>Edit
										</a></td>

									</tr>
								</c:forEach>
							
							
							</tbody>
							<tfoot>
								<tr>
								   
									
									<th>Plot No.</th>
									<th>Name</th>
									<th>F/H Name</th>
									<th>DOB</th>
									<th>Address</th>
									<th>Email</th>
									<th>Mobile</th>
									<th>Receipt Date</th>
									<th>Status</th>
									
									<th></th>
									
								</tr>
							</tfoot>
						</table>
					</div>
					<!-- /.box-body -->
					<!-- member Form -->
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
		$(function() {
			$("#example1").DataTable();
		});
	</script>