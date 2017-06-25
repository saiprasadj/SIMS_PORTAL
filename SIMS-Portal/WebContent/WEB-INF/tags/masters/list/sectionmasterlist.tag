<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="html" tagdir="/WEB-INF/tags/html"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Section Master List</title>
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<div class="card-block">
				<table class="table table-bordered table-striped table-condensed">
					<thead>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Code</th>
							<th>Alias</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${sectionMasterFormListData}"
							var="sectionMasterFormListObj">
							<tr>
								<td>${sectionMasterFormListObj.id}</td>
								<td>${sectionMasterFormListObj.name}</td>
								<td>${sectionMasterFormListObj.code}</td>
								<td>${sectionMasterFormListObj.alias}</td>
								<td><a
									href="${pageContext.request.contextPath}/master/section/edit/${sectionMasterFormListObj.code}">
										Edit</a> || <a
									href="${pageContext.request.contextPath}/master/section/delete/${sectionMasterFormListObj.id}">Delete</a>
								</td>
							</tr>

						</c:forEach>
					</tbody>
				</table>
				<nav>
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="#">Prev</a></li>
						<li class="page-item active"><a class="page-link" href="#">1</a>
						</li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">Next</a></li>
					</ul>
				</nav>
			</div>
		</div>
		<!--/col-->
	</div>
</body>
</html>

