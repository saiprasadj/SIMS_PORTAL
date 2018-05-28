<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="html" tagdir="/WEB-INF/tags/html"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
	$(function() {
		$("#datepicker").datepicker();
	});
	$(function() {
		$("#startdate").datepicker({
			dateFormat : "yy-mm-dd"
		}).val()
		$("#enddate").datepicker({
			dateFormat : "yy-mm-dd"
		}).val()
	});
</script>
<body>
	<!-- <p>Date: <input type="text" id="datepicker"></p> -->

	<spring:message code="test.adminUrl" var="url" />
	<div class="panel panel-default">
		<div class="panel-body">
			<div class="table-responsive">
				<div class="panel-heading">Report</div>

				<form:form id="reportForm" action="${url}/serchreport"
					modelAttribute="reportBean">
					<div class="input-group custom-search-form">
						<spring:message code="test.adminUrl" var="url" />


						<div class="col-sm-2">

							<input type="text" name="starthDate" id="startdate"
								value="${reportBean.starthDate}" style="width: 100%"
								class="form-control" placeholder="StartDate">
						</div>
						<div class="col-sm-2">
							<input type="text" name="endDate" id="enddate"
								style="width: 100%" value="${reportBean.endDate}"
								class="form-control" style="marign-left:1000px"
								placeholder="EndDate">
						</div>
						<div class="col-sm-2">
							<!-- <select style="height: 35px; width: 100%" name="flag">
								<option>Approved</option>
								<option>Rejected</option>
								<option>Assigned</option>
							</select> -->
							<form:select id="select" path="flag"
								style="height: 35px; width: 100%">

								<%-- <form:option value="-" label="--Select Action--" /> --%>
								<form:options items="${action}" />
							</form:select>
						</div>
						<div class="col-sm-2">
							<!-- <select style="height: 35px; width: 140px" name="function">
								<option>AdhocProccess</option>
								<option>UnsoldProccess</option>
							</select> -->
							<form:select id="select1" path="function"
								style="height: 35px; width: 100%">

								<%-- <form:option value="-" label="--Select Action--" /> --%>
								<form:options items="${proccess}" />
							</form:select>
						</div>
						<div class="col-sm-2">
							<spring:message code="test.adminUrl" var="url" />
							<input type="submit" value="Search" /> <span> OR</span> <span>
								<a href="${url}/export">Export</a>
							</span>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<c:if test="${reqproccess=='AdhocProcess'}">
		<div class="row">

			<c:if test="${!empty requestBean}">
				<div class="col-lg-6" style="width: 100%">
					<div class="panel panel-default">
						<div class="panel-heading">Adhoc Requests</div>
						<!-- /.panel-heading -->

						<div class="panel-body">
							<div class="table-responsive">

								<c:forEach begin="1" end="${maxpages}" varStatus="loop">
									<c:if test="${loop.current==currentID}">
										<a style="font-weight: bold;"
											href="${url}/report/${loop.current}"}">${loop.current}</a>
									</c:if>
									<c:if test="${loop.current!=currentID}">
										 <a href="${url}/report/${loop.current}">${loop.current}</a>
									</c:if>
									</c:forEach>


									<%-- <c:forEach begin="1" end="${maxpages}" varStatus="loop">
									<a href="${url}/report/${loop.current}">${loop.current}</a>
								</c:forEach> --%>
									<table style="overflow: scroll; width: 400px"
										class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr>
												<th>Req_Id</th>
												<spring:message code="adhocrequest.contractType"
													var="ContractType" />
												<th>${ContractType}</th>
												<spring:message code="adhocrequest.agencyCode"
													var="agencyCode" />
												<th>${agencyCode}</th>
												<spring:message code="adhocrequest.agencyName"
													var="agencyName" />
												<th>${agencyName}</th>
												<spring:message code="adhocrequest.city" var="city" />
												<th>${city}</th>
												<spring:message code="adhocrequest.publicationCode"
													var="publicationCode" />
												<th>${publicationCode}</th>
												<spring:message code="adhocrequest.editionShortText"
													var="editionShortText" />
												<th>${editionShortText}</th>
												<spring:message code="adhocrequest.publicationDate"
													var="publicationDate" />
												<th>${publicationDate}</th>
												<spring:message code="adhocrequest.indentQty"
													var="indentQty" />
												<th>${indentQty}</th>
												<spring:message code="adhocrequest.preQty" var="preQty" />
												<th>${preQty}</th>
												<spring:message code="adhocrequest.postQty" var="postQty" />
												<th>${postQty}</th>
												<th>Indent vs Adhoc %</th>
												<th>Adhoc Counts</th>
												<th>Adhoc Dates</th>
												<spring:message code="adhocrequest.unsoldMonth"
													var="UnsoldMonth" />
												<th>${UnsoldMonth}</th>
												<spring:message code="adhocrequest.lastMonthUnsold"
													var="lastMonthUnsold" />
												<th>${lastMonthUnsold}</th>
												<spring:message code="adhocrequest.outstandingMonth"
													var="outstandingMonth" />
												<th>${outstandingMonth}</th>
												<spring:message code="adhocrequest.outstandingAmount"
													var="outstandingAmount" />
												<th>${outstandingAmount}</th>
												<spring:message code="adhocrequest.flag" var="flag" />
												<th>${flag}</th>
												<spring:message code="adhocrequest.customerClassification"
													var="customerClassification" />
												<th>${customerClassification}</th>
												<th>Sales Exe. Name</th>
													<th>Approver Id</th>
												<spring:message code="adhocrequest.comments" var="comments" />
												<th>${comments}</th>
												<th>Error</th>

											</tr>
										</thead>
										<c:forEach items="${requestBean}" var="requestBean">
											<tr class="odd gradeX">
												<td>${requestBean.requestId}</td>
												<td>${requestBean.contractType}</td>
												<td>${requestBean.agencyCode}</td>
												<td>${requestBean.agencyName}</td>
												<td>${requestBean.city}</td>
												<td>${requestBean.publicationCode}</td>
												<td>${requestBean.editionShortText}</td>
												<%-- <td>${requestBean.publicationDate}</td> --%>
												<td><fmt:formatDate
														value="${requestBean.publicationDate}"
														pattern="yyyy-MM-dd" /></td>
												<td>${requestBean.indentQtyForTheDay}</td>
												<td>${requestBean.preFreezingAdhocQtyForTheDay}</td>
												<td>${requestBean.postFreezingAdhocQtyForTheDay}</td>
												<td>${requestBean.percentage}</td>
												<td>${requestBean.noOfDays}</td>
												<td>${requestBean.adhocDates}</td>
												<%-- 	<td>${requestBean.unsoldMonth}</td> --%>
												<fmt:formatDate value="${requestBean.unsoldMonth}"
													pattern="yyyy" var="unsoldMonth" />
												<c:if test="${unsoldMonth==0001}">
													<td>N/A</td>
												</c:if>
												<c:if test="${unsoldMonth!=0001}">
													<td><fmt:formatDate value="${requestBean.unsoldMonth}"
															pattern="yyyy-MM-dd" /></td>
												</c:if>
												<td>${requestBean.lastMonthUnsold}</td>
												<fmt:formatDate value="${requestBean.outstandingMonth}"
													pattern="yyyy" var="unsoldMonth" />
												<c:if test="${unsoldMonth==0001}">
													<td>N/A</td>
												</c:if>
												<c:if test="${unsoldMonth!=0001}">
													<td><fmt:formatDate
															value="${requestBean.outstandingMonth}"
															pattern="yyyy-MM-dd" /></td>
												</c:if>
												<%-- <td>${requestBean.outstandingMonth}</td> --%>
												<td>${requestBean.outstandingAmount}</td>
												<td>${requestBean.flag}</td>
												<td>${requestBean.customerClassification}</td>
												<td>${requestBean.seDes}</td>
												<td>${requestBean.approverId}</td>
												<td style="width: 100%">${requestBean.comments}</td>
												<td>${requestBean.error}</td>
											</tr>
										</c:forEach>
									</table>
							</div>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${empty requestBean}">
				<h1 style="color: red; margin-left: 20px">No records  found!</h1>
			</c:if>
		</div>
	</c:if>

	<c:if test="${reqproccess=='UnsoldProcess'}">
		<div class="row">


			<c:if test="${!empty requestBean}">
				<div class="col-lg-6" style="width: 100%">
					<div class="panel panel-default">
						<div class="panel-heading">Unsold Requests</div>
						<!-- /.panel-heading -->

						<div class="panel-body">
							<div class="table-responsive">
								<c:forEach begin="1" end="${maxpages}" varStatus="loop">
									<a href="${url}/report/${loop.current}">${loop.current}</a>
								</c:forEach>


								<table style="overflow: scroll; width: 400px"
									class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>

										<tr>

											<spring:message code="unsold.requestId" var="requestId" />
											<th>Req_Id</th>
											<spring:message code="unsold.businessArea" var="businessArea" />
											<th>${businessArea}</th>
											<!-- 	<th>Unsold Type</th>
											<th>Batch No.</th> -->
											<spring:message code="unsold.publication" var="publication" />
											<th>${publication}</th>
											<spring:message code="unsold.editionShortText"
												var="editionShortText" />
											<th>Edition</th>
											<spring:message code="unsold.issueDate" var="issueDate" />
											<th>${issueDate}</th>
											<spring:message code="unsold.customer" var="customer" />
											<th>Customer_Code</th>
											<spring:message code="unsold.customerName" var="customerName" />
											<th>${customerName}</th>
											<spring:message code="unsold.city" var="city" />
											<th>${city}</th>
											<spring:message code="unsold.claimedQuantity"
												var="claimedQuantity" />
											<th>${claimedQuantity}</th>
											<spring:message code="unsold.allowQuantity"
												var="allowQuantity" />
											<th>${allowQuantity}</th>
											<spring:message code="unsold.reasonCode" var="reasonCode" />
											<th>${reasonCode}</th>
											<spring:message code="unsold.billingMonth" var="billingMonth" />
											<th>${billingMonth}</th>
											<th>Sales Doument Type</th>
											<th>Sales Order Number</th>
											<th>Approver Id</th>
											<th>Comment</th>
											
											<spring:message code="unsold.salesRepresentative"
												var="salesRepresentative" />
											<th>${salesRepresentative}</th>
											<th>Error</th>
										</tr>

									</thead>
									<c:forEach items="${requestBean}" var="requestBean">
										<tr class="odd gradeX">
											<td>${requestBean.requestId}</td>
											<td>${requestBean.businessArea}</td>
											<%-- <td>${requestBean.salesDocumentType}</td>
											<td>${requestBean.requestNumber}</td> --%>
											<td>${requestBean.publication}</td>
											<td>${requestBean.editionShortText}</td>
											<%-- 	<td>${requestBean.issueDate}</td> --%>
											<td><fmt:formatDate value="${requestBean.issueDate}"
													pattern="yyyy-MM-dd" /></td>
											<td>${requestBean.customer}</td>
											<td>${requestBean.customerName}</td>
											<td>${requestBean.city}</td>
											<td>${requestBean.claimedQuantity}</td>
											<td>${requestBean.allowedQuantity}</td>
											<td>${requestBean.reasonCode}</td>
											<%-- 	<td>${requestBean.billingMonth}</td> --%>
											<td><fmt:formatDate value="${requestBean.billingMonth}"
													pattern="yyyy-MM-dd" /></td>
											<%-- <td>${requestBean.salesOrderNumber}</td> --%>
											
											<td>${requestBean.salesDocumentType}</td>
											<td>${requestBean.salesOrderNumber}</td>
											<td>${requestBean.approverId}</td>
											<td>${requestBean.comment}</td>
											<td>${requestBean.seDes}</td>
											 <td>${requestBean.error}</td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${empty requestBean}">
				<h1 style="color: red; margin-left: 20px">No records found!</h1>
			</c:if>
		</div>
	</c:if>


</body>