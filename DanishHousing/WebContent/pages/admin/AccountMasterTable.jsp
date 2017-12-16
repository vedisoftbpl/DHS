<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="../../plugins/datatables/dataTables.bootstrap.css">
	
	<link rel="stylesheet"
	href="../../plugins/datatables/buttons.dataTable.min.css">
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
						
						<table id="example1" class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>Account Code</th>
									<th>Account Name</th>
									<th>Account Class</th>
									<th>Flag</th>
									<th>Project Code</th>
									<th>View</th>
								</tr>
							</thead>
							<!--  <tbody>
								<c:forEach items="${requestScope.accountMasterList}" var="acmas">
									<tr>

										<td><c:out value="${acmas.acCode}" /></td>
										<td><c:out value="${acmas.acName}" /></td>
										<c:choose>
 												<c:when test="${acmas.acClass eq 'A'}">
 													<td><c:out value="Assests" /></td>
 												</c:when>
 												<c:when test="${acmas.acClass eq 'I'}">
 													<td><c:out value="Income" /></td>
 												</c:when>
 												<c:when test="${acmas.acClass eq 'L'}">
 													<td><c:out value="Liability" /></td>
 												</c:when>
 												<c:when test="${acmas.acClass eq 'E'}">
 													<td><c:out value="Extended" /></td>
 												</c:when>
 											</c:choose>
 											
 											
 										<c:forEach items="${requestScope.enumList}" var="flag">
 											<c:choose>
 												<c:when test="${acmas.flag eq flag.getValue()}">
 													<td><c:out value="${flag}"/></td>
 												</c:when>
 											</c:choose>
 										</c:forEach>
										<td><c:out value="${acmas.projCd}" /></td>

										<td><a href="${pageContext.request.contextPath}/admin/pages/MasterAccountFormController?operation=show&showId=${acmas.masterAccountId}"> <i class="fa fa-edit"></i>View
										</a></td>

									</tr>
								</c:forEach>

							</tbody>-->
							<tfoot>
							<tr>
								<th>Account Code</th>
									<th>Account Name</th>
									<th>Account Class</th>
									<th>Flag</th>
									<th>Project Code</th>
									<th>View</th>
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
	<script src="../../plugins/datatables/fnStandingRedraw.js"></script>
	<script src="../../plugins/datatables/fnSetFilteringDelay.js"></script>
	 <script src="../../plugins/datatables/buttons.print.min.js"></script>
    <script src="../../plugins/datatables/dataTables.buttons.min.js"></script>
	<script>
	<c:choose>
	<c:when test="${param.msg=='1'}">
	$(document).ready(function() {
		$("#typeError").addClass("form-group has-success");
		$("#errorTop")
		.html(
				"Record Updated Successfully.");
	});
	</c:when>
	<c:when test="${param.msg=='2'}">
	$(document).ready(function() {
		$("#typeError").addClass("form-group has-error");
		$("#errorTop")
		.html(
				"Fail to update Record.");
	});
	</c:when>
	</c:choose>
	
		$(function() {
			$("#example1").DataTable({
				 "bPaginate": true,
				 dom : 'Bftrip',
				 
				 buttons: [
				            {
                extend: 'print',
                customize: function ( win ) {
                    $(win.document.body)
                        .css( 'font-size', '10pt' )
                        .prepend(
                            '<img src="../../../DanishHousing/pages/photos/logo-fade.png" style="position:absolute; top:0; left:0;" />'
                        );
 
                    $(win.document.body).find( 'table' )
                        .addClass( 'compact' )
                        .css( 'font-size', 'inherit' );
                }
				            
				            }
				        ],
			     "order": [ 0, 'asc' ],
			     "bInfo": true,
			     "iDisplayStart":0,
			     "bProcessing" : true,
			     'iDisplayLength': 20,
			    "bServerSide" : true,
			    "sAjaxSource" : "../../admin/pages/MasterAccountTableController",
			       });
		});
	</script>