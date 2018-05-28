<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="html" tagdir="/WEB-INF/tags/html"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Daily Tank Recording List</title>
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<div class="card-block">
				<table class="table table-bordered table-striped table-condensed">
					<thead>
						<tr>
							<th>Document ID</th>
							<th>Site Name</th>
							<th>Tank Name</th>
							<th>Document Date</th>
							<th>Supervisor</th>
							<th>Remarks</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${dailyTankRecordingFormListData}"
							var="dailyTankRecordingFormListObj">
							<tr>
								<td>${dailyTankRecordingFormListObj.dailytankrecording_id}</td>
								<td>${dailyTankRecordingFormListObj.siteName}</td>
								<td>${dailyTankRecordingFormListObj.tankName}</td>
								<td>${dailyTankRecordingFormListObj.documentDate}</td>
								<td>${dailyTankRecordingFormListObj.supervisor}</td>
								<td>${dailyTankRecordingFormListObj.remarks}</td>
								<td><a
									href="${pageContext.request.contextPath}/tankoperations/dailytankrecording/edit/${dailyTankRecordingFormListObj.dailytankrecording_id}">
										Edit</a> || <a
									href="${pageContext.request.contextPath}/tankoperations/dailytankrecording/delete/${dailyTankRecordingFormListObj.dailytankrecording_id}">Delete</a>
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