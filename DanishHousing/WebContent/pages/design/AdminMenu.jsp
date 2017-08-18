<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				<img src="../../pages/photos/${userLogin.photo}" class="img-circle"
					alt="User Image">
			</div>
			<div class="pull-left info">
				<p>${userLogin.name}</p>
				<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
			</div>
		</div>
		<!-- search form -->

		<!-- /.search form -->
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			<li class="header">MAIN NAVIGATION</li>
			<li class="treeview"><a href="#"> <i class="fa fa-dashboard"></i>
					<span>Dashboard</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li><a href="../../index.html"><i class="fa fa-circle-o"></i>
							Dashboard v1</a></li>
					<li><a href="../../index2.html"><i class="fa fa-circle-o"></i>
							Dashboard v2</a></li>
				</ul></li>
			<li class="treeview"><a href="#"> <i class="fa fa-database"></i>
					<span>Master Data</span> <span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li><a
						href="${pageContext.request.contextPath}/admin/pages/UserTableController"><i
							class="fa fa-circle-o"></i> Users </a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/pages/MemberTableController"><i
							class="fa fa-circle-o"></i> Members </a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/pages/ProjectTableController"><i
							class="fa fa-circle-o"></i> Projects </a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/pages/AccountTableController"><i
							class="fa fa-circle-o"></i> Accounts </a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/pages/MasterAccountTableController"><i
							class="fa fa-circle-o"></i> Voucher Types </a></li>
				</ul></li>
			<li class="treeview"><a href="#"> <i class="fa fa-edit"></i>
					<span>Forms</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li><a
						href="${pageContext.request.contextPath}/admin/pages/ReceiptFormController"><i
							class="fa fa-circle-o"></i> Receipts</a></li>
					<li><a href="../forms/advanced.html"><i
							class="fa fa-circle-o"></i> Payments</a></li>
					<li><a href="../forms/editors.html"><i
							class="fa fa-circle-o"></i> Documents</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/pages/ContractDocumentsController"><i
							class="fa fa-circle-o"></i> Contract Documents</a></li>
					<li><a href="../forms/editors.html"><i
							class="fa fa-circle-o"></i> Installments Receipts</a></li>
				</ul></li>
			<li class="treeview"><a href="#"> <i class="fa fa-table"></i>
					<span>Reports</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li><a href="../tables/simple.html"><i
							class="fa fa-circle-o"></i> Report One</a></li>
					<li><a href="../tables/data.html"><i
							class="fa fa-circle-o"></i> Report Two </a></li>
					<li><a href="../tables/data.html"><i
							class="fa fa-circle-o"></i> Report Three </a></li>
					<li><a href="../tables/data.html"><i
							class="fa fa-circle-o"></i> Report Four </a></li>
				</ul></li>
			<li class="treeview"><a href="#"> <i class="fa fa-pie-chart"></i>
					<span>Charts</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li><a href="../charts/chartjs.html"><i
							class="fa fa-circle-o"></i> ChartJS</a></li>
					<li><a href="../charts/morris.html"><i
							class="fa fa-circle-o"></i> Morris</a></li>
					<li><a href="../charts/flot.html"><i
							class="fa fa-circle-o"></i> Flot</a></li>
					<li><a href="../charts/inline.html"><i
							class="fa fa-circle-o"></i> Inline charts</a></li>
				</ul></li>
			<li><a href="../../documentation/index.html"><i
					class="fa fa-book"></i> <span>Documentation</span></a></li>
			<li class="header">LABELS</li>
			<li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Important</span></a></li>
			<li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Warning</span></a></li>
			<li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li>
		</ul>
	</section>
	<!-- /.sidebar -->
</aside>
