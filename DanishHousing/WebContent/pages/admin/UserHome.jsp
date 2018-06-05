<%@ include file="../design/Top.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- ADD THE CLASS layout-top-nav TO REMOVE THE SIDEBAR. -->
<body class="hold-transition skin-blue layout-top-nav">
	<div class="wrapper">

		<header class="main-header">
			<nav class="navbar navbar-static-top">
				<div class="container">
					<div class="navbar-header">
						<a href="#" class="navbar-brand"><b>Danish</b>Housing</a>
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#navbar-collapse">
							<i class="fa fa-bars"></i>
						</button>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse pull-left"
						id="navbar-collapse">
						<ul class="nav navbar-nav">
							<c:forEach items="${sessionScope.menuList}" var="list">
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown">${list.menu} <span class="caret"></span></a>
									<ul class="dropdown-menu" role="menu">
										<c:forEach items="${list.subMenu}" var="process">
											<li><a
												href="${pageContext.request.contextPath}/admin/pages/${process.controller}">${process.processName}</a></li>
										</c:forEach>
									</ul></li>
							</c:forEach>
						</ul>

					</div>
					<!-- /.navbar-collapse -->
					<!-- Navbar Right Menu -->
					<div class="navbar-custom-menu">
						<ul class="nav navbar-nav">
							<!-- Messages: style can be found in dropdown.less-->

							<!-- Notifications Menu -->
							<li class="dropdown notifications-menu">
								<!-- Menu toggle button --> <a href="#" class="dropdown-toggle"
								data-toggle="dropdown"> <i class="fa fa-bell-o"></i> <span
									class="label label-warning">1</span>
							</a>
								<ul class="dropdown-menu">
									<li class="header">You have 1 notifications</li>
									<li>
										<!-- inner menu: contains the actual data -->
										<ul class="menu">
											<li><a href="#"> <i class="fa fa-users text-aqua"></i>
													Software Under Developement For Danish Houshing Society.
											</a></li>
										</ul>
									</li>
									<li class="footer"><a href="#">View all</a></li>
								</ul>
							</li>
							<!-- Tasks Menu -->

							<!-- User Account Menu -->
							<li class="dropdown user user-menu"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown"> <img
									src="../../pages/photos/${userLogin.photo}" class="user-image"
									alt="User Image"> <span class="hidden-xs">${userLogin.name}</span>
							</a>
								<ul class="dropdown-menu">
									<!-- User image -->
									<li class="user-header"><img
										src="../../pages/photos/${userLogin.photo}" class="img-circle"
										alt="User Image">

										<p>
											${userLogin.name} - ${userLogin.designation} <small>${userLogin.userType}</small>
										</p></li>
									<!-- Menu Body -->
									<!-- Menu Footer-->
									<li class="user-footer">
										<div class="pull-left">
											<a href="#" class="btn btn-default btn-flat">Profile</a>
										</div>
										<div class="pull-right">
											<a
												href="${pageContext.request.contextPath}/admin/pages/LogoutServlet"
												class="btn btn-default btn-flat">Sign out</a>
										</div>
									</li>
								</ul></li>
						</ul>
					</div>
					<!-- /.navbar-custom-menu -->
				</div>
				<!-- /.container-fluid -->
			</nav>
		</header>
		<!-- Full Width Column -->
		<div class="content-wrapper">
			<div class="container">
				<!-- Content Header (Page header) -->
				<section class="content-header">
					<h1>Home Page</h1>
					<ol class="breadcrumb">
						<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					</ol>
				</section>

				<!-- Main content -->
				<section class="content">
					<div class="row">
						<div class="col-md-3">

							<!-- Profile Image -->
							<div class="box box-primary">
								<div class="box-body box-profile">
									<img class="profile-user-img img-responsive img-circle"
										src="../../pages/photos/${userLogin.photo}"
										alt="User profile picture">

									<h3 class="profile-username text-center">${userLogin.name}</h3>

									<p class="text-muted text-center">${userLogin.designation}</p>

									

									<a href="#" class="btn btn-primary btn-block"><b>Profile</b></a>
								</div>
								<!-- /.box-body -->
							</div>
							<!-- /.box -->

							<!-- About Me Box -->
							<div class="box box-primary">
								<div class="box-header with-border">
									<h3 class="box-title">About Me</h3>
								</div>
								<!-- /.box-header -->
								<div class="box-body">
									<strong><i class="fa fa-book margin-r-5"></i> Date Of
										Joining</strong>

									<p class="text-muted">
										<c:choose>
											<c:when test="${userLogin.doj != null}">
												<fmt:formatDate type="date" pattern="dd/MM/yyyy"
													value="${userLogin.doj}" />
											</c:when>
											<c:otherwise>
              N/A
              </c:otherwise>
										</c:choose>
									</p>

									<hr>

									<strong><i class="fa fa-map-marker margin-r-5"></i>
										Address</strong>

									<p class="text-muted">${userLogin.address}</p>



								</div>
								<!-- /.box-body -->
							</div>
							<!-- /.box -->
						</div>
						<!-- /.col -->
						<div class="col-md-9">
							<div class="box box-default">
								<div class="box-header with-border"></div>
								<div class="box-body" align="center">
									<h2>Welcome to ${userLogin.userType} Section</h2>
								</div>
								<!-- /.box-body -->
							</div>
						</div>

						<!-- /.box -->
					</div>
				</section>
				<!-- /.content -->
			</div>
			<!-- /.container -->
		</div>
		<!-- /.content-wrapper -->
		<%@ include file="../design/Footer.jsp"%>
	</div>
	<!-- ./wrapper -->
	<%@ include file="../design/Bottom.jsp"%>