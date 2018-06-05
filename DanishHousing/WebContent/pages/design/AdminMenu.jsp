<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<ul class="sidebar-menu" id="sidebar">
			<li class="header">MAIN NAVIGATION</li>
			<!-- 
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
				</ul></li> -->
			<c:forEach items="${sessionScope.menuList}" var="list">
				<li class="treeview"><a href="#"> <i class="fa fa-database"></i>
						<span>${list.menu}</span> <span class="pull-right-container"> <i
							class="fa fa-angle-left pull-right"></i></span></a>
					<ul class="treeview-menu">
						<c:forEach items="${list.subMenu}" var="process">
								<li><a
									href="${pageContext.request.contextPath}/admin/pages/${process.controller}">
										<i class="fa fa-circle-o"></i>${process.processName}</a></li>
							
						</c:forEach>
					</ul></li>
			</c:forEach>
			<!-- 
					<li class="treeview"><a href="#"> <i
							class="fa fa-pie-chart"></i> <span>Charts</span> <span
							class="pull-right-container"> <i
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
					 -->
			<li class="header">LABELS</li>
			<li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Important</span></a></li>
			<li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Warning</span></a></li>
			<li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li>
		</ul>
	</section>
	<!-- /.sidebar -->
</aside>
