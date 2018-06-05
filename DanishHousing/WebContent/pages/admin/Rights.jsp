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
				<h1>Rights Selection</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Rights page</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<!-- Default box -->
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">Rights</h3>
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
						<div class="form-group" id="typeError">
							<label class="control-label" id="errorTop"></label>
						</div>
						<form
							action="${pageContext.request.contextPath}/admin/pages/RightsController">
							<div class="row">
								<table class="table table-bordered" border="1" width="100%"
									align="center">
									<thead>
										<tr>
											<th>Menu Options</th>
											<th>Accounts</th>
											<th>Data Entry</th>
											<th>Reception</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${requestScope.rightsList}" var="rights">
											<tr>
												<td><c:out value=" ${rights.rightsName}"></c:out></td>
												<td><input type="checkbox" name="accounts"
													value="${rights.rightsId}" <c:if test="${rights.accounts == 'yes'}">checked</c:if>/></td>
												<td><input type="checkbox" name="dataEntry"
													value="${rights.rightsId}" <c:if test="${rights.dataEntry == 'yes'}">checked</c:if>/></td>
												<td><input type="checkbox" name="reception"
													value="${rights.rightsId}" <c:if test="${rights.reception == 'yes'}">checked</c:if>/></td>
											</tr>
										</c:forEach>

									</tbody>



								</table>
							</div>
													<input id="operation" name="operation" type="hidden" value="create">
							
							<div class="row">
								<div class="col-md-9"></div>
								<div class="col-md-2">
									<button class="btn btn-block btn-info" type="submit">Save</button>
								</div>
							</div>
						</form>



					</div>
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
	<script type="text/javascript">
		<c:choose>
		<c:when test="${requestScope.msg=='1'}">
		$(document).ready(function() {
			$("#typeError").addClass("form-group has-success");
			$("#errorTop").html("Rights Saved Successfully.");
		});
		</c:when>
		<c:when test="${requestScope.msg=='2'}">
		$(document).ready(function() {
			$("#typeError").addClass("form-group has-error");
			$("#errorTop").html("Fail to Save Rights.");
		});
		</c:when>
		</c:choose>
	</script>