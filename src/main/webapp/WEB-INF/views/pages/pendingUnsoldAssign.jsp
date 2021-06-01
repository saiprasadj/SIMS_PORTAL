

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="html" tagdir="/WEB-INF/tags/html"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	$(document).on('keypress', function(e) {
		if (e.keyCode == 13) {
			return false;
		}
	});
</script>
<!-- <div class="row">
	<div class="col-lg-12">
		<h1 class="page-header" style="font-size: 14px">Pending Unsold
			Request</h1>
	</div> -->


<style>
.test p {
	margin-bottom: -12px !important;
}
</style>

<div class="row">
	<div class="col-lg-6" style="width: 100%">
		<div class="panel panel-default">
			<div class="panel-heading"> Pending Unsold
			Requests</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<h5></h5>
				<div class="table-responsive">
					<c:if test="${msg}">
						<h5 style="color: red">${msg}</h5>
					</c:if>
					<spring:message code="text.url" var="url" />					
					<c:forEach begin="1" end="${maxpages}" varStatus="loop">
						<c:if test="${loop.current==currentID}">
							<a style="font-weight: bold"
								href="${url}unsoldRequestPagenation/${loop.current}">${loop.current}</a>
						</c:if>
						<c:if test="${loop.current!=currentID}">
							<a href="${url}unsoldRequestPagenation/${loop.current}">${loop.current}</a>
						</c:if>
					</c:forEach>
					<form:form action="${url}unsoldApprove"
						modelAttribute="unsoldRequestList">
						<div style="position:absolute;top:45;right:40">
							<c:if test="${count!=0 }">
								<a style="font-weight: normal !important" href="${url}approveUnsold"
									onclick="javascript:return confirm('Do you really want to approve all records of current page?')">Approve
									all</a> &nbsp &nbsp
								<a style="font-weight: normal !important" href="${url}rejectUnsold"
									onclick="javascript:return confirm('Do you really want to reject all records of current page?')">Reject
									all</a>
							</c:if>
						</div>
						<table style="overflow: scroll; width: 400px"
							class="table  table-bordered" id="dataTables-example">
							<thead>
								<tr>
									<%-- <spring:message code="unsold.requestId" var="requestId" />
									<th>${requestId}</th> --%>
									<th>Req_Id</th>
									<spring:message code="unsold.businessArea" var="businessArea" />
									<th>${businessArea}</th>
									<th>Agency Code</th>
									<spring:message code="unsold.customerName" var="customerName" />
									<th>Agency Name</th>
									<spring:message code="unsold.city" var="city" />
									<th>${city}</th>
									<spring:message code="unsold.publication" var="publication" />
									<th>${publication}</th>
									<spring:message code="unsold.editionShortText"
										var="editionShortText" />
									<th>Edition</th>
									<spring:message code="unsold.issueDate" var="issueDate" />
									<th>${issueDate}</th>
									<spring:message code="unsold.customer" var="customer" />
									<%-- <th>AgencyCode</th>
									<spring:message code="unsold.customerName" var="customerName" />
									<th>Agency Name</th> --%>

									<spring:message code="unsold.claimedQuantity"
										var="claimedQuantity" />
									<th>${claimedQuantity}</th>
									<spring:message code="unsold.allowQuantity" var="allowQuantity" />
									<th>${allowQuantity}</th>
									<spring:message code="unsold.reasonCode" var="reasonCode" />
									<th>${reasonCode}</th>
									<!-- <th>BillingMonth</th> -->
									<th>Sales Exe. Name</th>
									<th>Status</th>
									<th>Comment</th>
									<spring:message code="unsold.action" var="action" />
									<th>${action}</th>
								</tr>
							</thead>
							<c:url value="approveUnsold" var="approve" />
							<c:url value="rejectUnsold" var="reject" />
							<c:forEach items="${unsoldRequestList.unsoldRequest}"
								var="requestBean" varStatus="status">
								<c:if test="${(requestBean.billingBlock=='Assigned')}">
									<tr bgcolor="pink">
										<td><form:input
												path="unsoldRequest[${status.index}].requestId"
												readonly="true" style="width:60px"
												value="${requestBean.requestId}" /></td>

										<td>${requestBean.businessArea}</td>
										<td>${requestBean.customer}</td>
										<td>${requestBean.customerName}</td>
										<td>${requestBean.city}</td>
										<td>${requestBean.publication}</td>
										<td>${requestBean.editionShortText}</td>
										<td style="width: 100%"><fmt:formatDate
												value="${requestBean.issueDate}" pattern="yyyy-MM-dd" /></td>

										<td>${requestBean.claimedQuantity}</td>
										<td>${requestBean.allowedQuantity}</td>
										<td>${requestBean.reasonCode}</td>
										<td>${requestBean.seDes}</td>
										<td>${requestBean.billingBlock}</td>
										<td><textarea rows="2" cols="14"
												name="unsoldRequest[${status.index}].comment"
												placeholder="Enter Your Comments">${requestBean.comment}</textarea></td>

										

										<td class="test" style="min-width: 150px"><form:radiobuttons
												element="p"
												path="unsoldRequest[${status.index}].checkAction"
												items="${checkList}" /></td>
									</tr>
								</c:if>
								<c:if test="${(requestBean.billingBlock=='Pending')}">
									<tr bgcolor="pink">
										<td><form:input
												path="unsoldRequest[${status.index}].requestId"
												readonly="true" style="width:60px"
												value="${requestBean.requestId}" /></td>

										<td>${requestBean.businessArea}</td>
										<td>${requestBean.customer}</td>
										<td>${requestBean.customerName}</td>
										<td>${requestBean.city}</td>
										<td>${requestBean.publication}</td>
										<td>${requestBean.editionShortText}</td>
										<td style="width: 100%"><fmt:formatDate
												value="${requestBean.issueDate}" pattern="yyyy-MM-dd" /></td>

										<td>${requestBean.claimedQuantity}</td>
										<td>${requestBean.allowedQuantity}</td>
										<td>${requestBean.reasonCode}</td>
										<td>${requestBean.seDes}</td>
										<td>${requestBean.billingBlock}</td>
										<td><textarea rows="2" cols="14"
												name="unsoldRequest[${status.index}].comment"
												placeholder="Enter Your Comments">${requestBean.comment}</textarea></td>

										<td class="test" style="min-width: 150px">
											<c:if test="${requestBean.billingBlock=='Approved'}">Approved</c:if>
											<c:if test="${requestBean.billingBlock=='Rejected'}">Rejected</c:if>
											<c:if test="${requestBean.billingBlock=='Pending'}">
												<form:radiobuttons element="p"
													path="unsoldRequest[${status.index}].checkAction"
													items="${checkList}" />
											</c:if></td>
									</tr>
								</c:if>


								<c:if test="${(requestBean.billingBlock=='Approved')}">
									<tr bgcolor="grean">
										<td><form:input
												path="unsoldRequest[${status.index}].requestId"
												readonly="true" style="width:60px"
												value="${requestBean.requestId}" /></td>

										<td>${requestBean.businessArea}</td>
										<td>${requestBean.customer}</td>
										<td>${requestBean.customerName}</td>
										<td>${requestBean.city}</td>
										<td>${requestBean.publication}</td>
										<td>${requestBean.editionShortText}</td>
										<td style="width: 100%"><fmt:formatDate
												value="${requestBean.issueDate}" pattern="yyyy-MM-dd" /></td>

										<td>${requestBean.claimedQuantity}</td>
										<td>${requestBean.allowedQuantity}</td>
										<td>${requestBean.reasonCode}</td>
										<td>${requestBean.seDes}</td>
										<td>${requestBean.billingBlock}</td>
										<td><textarea rows="2" cols="14"
												name="unsoldRequest[${status.index}].comment" readonly
												placeholder="Enter Your Comments">${requestBean.comment}</textarea></td>

										<td class="test" style="min-width: 150px">
											<c:if test="${requestBean.billingBlock=='Approved'}">Approved</c:if>
											<c:if test="${requestBean.billingBlock=='Rejected'}">Rejected</c:if>
											<c:if test="${requestBean.billingBlock=='Assigned'}">
												<form:radiobuttons element="p"
													path="unsoldRequest[${status.index}].checkAction"
													items="${checkList}" />
											</c:if></td>
									</tr>
								</c:if>
								<c:if test="${(requestBean.billingBlock=='Rejected')}">
									<tr bgcolor="red">
										<td><form:input
												path="unsoldRequest[${status.index}].requestId"
												readonly="true" style="width:60px"
												value="${requestBean.requestId}" /></td>

										<td>${requestBean.businessArea}</td>
										<td>${requestBean.customer}</td>
										<td>${requestBean.customerName}</td>
										<td>${requestBean.city}</td>
										<td>${requestBean.publication}</td>
										<td>${requestBean.editionShortText}</td>
										<td style="width: 100%"><fmt:formatDate
												value="${requestBean.issueDate}" pattern="yyyy-MM-dd" /></td>

										<td>${requestBean.claimedQuantity}</td>
										<td>${requestBean.allowedQuantity}</td>
										<td>${requestBean.reasonCode}</td>
										<td>${requestBean.seDes}</td>
										<td>${requestBean.billingBlock}</td>
										<td><textarea rows="2" cols="14"
												name="unsoldRequest[${status.index}].comment" readonly
												placeholder="Enter Your Comments">${requestBean.comment}</textarea></td>

										<td class="test" style="min-width: 150px">
											<c:if test="${requestBean.billingBlock=='Approved'}">Approved</c:if>
											<c:if test="${requestBean.billingBlock=='Rejected'}">Rejected</c:if>
											<c:if test="${requestBean.billingBlock=='Assigned'}">
												<form:radiobuttons element="p"
													path="unsoldRequest[${status.index}].checkAction"
													items="${checkList}" />
											</c:if></td>
									</tr>
								</c:if>
								<c:if test="${(requestBean.billingBlock=='REQUIRED TEXT')}">
									<tr bgcolor="Pink">
										<td><form:input
												path="unsoldRequest[${status.index}].requestId"
												readonly="true" style="width:60px"
												value="${requestBean.requestId}" /></td>

										<td>${requestBean.businessArea}</td>
										<td>${requestBean.customer}</td>
										<td>${requestBean.customerName}</td>
										<td>${requestBean.city}</td>
										<td>${requestBean.publication}</td>
										<td>${requestBean.editionShortText}</td>
										<td style="width: 100%"><fmt:formatDate
												value="${requestBean.issueDate}" pattern="yyyy-MM-dd" /></td>

										<td>${requestBean.claimedQuantity}</td>
										<td>${requestBean.allowedQuantity}</td>
										<td>${requestBean.reasonCode}</td>
										<td>${requestBean.seDes}</td>
										<td>${requestBean.billingBlock}</td>
										<td><textarea rows="2" cols="14"
												name="unsoldRequest[${status.index}].comment"
												placeholder="Enter Your Comments">${requestBean.comment}</textarea></td>

										<td class="test" style="min-width: 150px"><form:radiobuttons
												element="p"
												path="unsoldRequest[${status.index}].checkAction"
												items="${checkList}" /></td>
									</tr>
								</c:if>

							</c:forEach>
						</table>
						<c:if test="${count!=0 }">
							<button style="margin-left: 1300px" type="submit" name='action'
								class="btn btn-success">Submit</button>
						</c:if>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>


