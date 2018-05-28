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

<script type="text/javascript">
	$(document).on('keypress', function(e) {
		if (e.keyCode == 13) {
			return false;
		}
	});
	
</script>
</head>




<div class="row">
	<div class="col-lg-6" style="width: 100%">
		<div class="panel panel-default">
			<div class="panel-heading">Resubmitted Adhoc Requests</div>

			<div class="panel-body">
				<div class="table-responsive">
					<spring:message code="test.adminUrl" var="url" />
					<c:forEach begin="1" end="${maxpages}" varStatus="loop">
						<c:if test="${loop.current==currentID}">
							<a style="font-weight: bold"
								href="${url}/resubmit/${loop.current}">${loop.current}</a>
						</c:if>
						<c:if test="${loop.current!=currentID}">
							<a href="${url}/resubmit/${loop.current}">${loop.current}</a>
						</c:if>
					</c:forEach>
					<table style="overflow: scroll; width: 400px"
						class="table table-striped table-bordered table-hover"
						id="dataTables-example">
						<thead>
							<tr>
								<th>Req_Id</th>
								<spring:message code="adhocrequest.contractType"
									var="ContractType" />
								<th>${ContractType}</th>
								<spring:message code="adhocrequest.businessArea"
									var="businessArea" />
								<th>${businessArea}</th>
								<spring:message code="adhocrequest.agencyCode" var="agencyCode" />
								<th>${agencyCode}</th>
								<spring:message code="adhocrequest.agencyName" var="agencyName" />
								<th>${agencyName}</th>
								<spring:message code="adhocrequest.city" var="city" />
								<th>${city}</th>
								<spring:message code="adhocrequest.editionShortText"
									var="editionShortText" />
								<th>Edition</th>
								<spring:message code="adhocrequest.publicationDate"
									var="publicationDate" />
								<th>${publicationDate}</th>
								<spring:message code="adhocrequest.indentQty" var="indentQty" />
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
								<spring:message code="adhocrequest.outstandingAmount"
									var="outstandingAmount" />
								<th>${outstandingAmount}</th>
								<spring:message code="unsold.salesRepresentative"
									var="salesRepresentative" />
								<th>Sales Exe. Name</th>
								<spring:message code="resubmit.comments" var="comments" />
								<th>${comments}</th>
								<spring:message code="resubmit.changeQuantity"
									var="changeQuantity" />
								<th>${changeQuantity}</th>


								<spring:message code="adhocrequest.action" var="action" />
								<th>${action}</th>

							</tr>
						</thead>

						<c:forEach items="${approvalList}" var="requestBean">
							<c:if
								test="${(requestBean.flag=='Assigned')&& (requestBean.editionDescp!='SENT TO MIS')}">
								<tr class="odd gradeX">
									<form:form id="${requestBean.requestId}" class="resubmitForm"
										name="resubmitForm" action="${url}/approveResubmit"
										modelAttribute="adhocRequestBean">
										<td><form:input path="requestId" readonly="true"
												style="width:70px" value="${requestBean.requestId}" /></td>
										<td>${requestBean.contractType}</td>
										<td>${requestBean.businessArea}</td>
										<td>${requestBean.agencyCode}</td>
										<td>${requestBean.agencyName}</td>
										<td>${requestBean.city}</td>
										<%-- <td>${requestBean.publicationCode}</td> --%>
										<td>${requestBean.editionShortText}</td>
										<td><fmt:formatDate
												value="${requestBean.publicationDate}" pattern="yyyy-MM-dd" /></td>
										<td>${requestBean.indentQtyForTheDay}</td>
										<td>${requestBean.preFreezingAdhocQtyForTheDay}</td>
										<td>${requestBean.postFreezingAdhocQtyForTheDay}</td>
										<td>${requestBean.percentage}</td>
										<td>${requestBean.noOfDays}</td>
										<td>${requestBean.adhocDates}</td>
										<td>${requestBean.lastMonthUnsold}</td>
										<td>${requestBean.outstandingAmount}</td>
										<td>${requestBean.seDes}</td>

										<td><textarea row"3" cols="14" name="comments"
												placeholder="Please enter text">${requestBean.comments}  </textarea></td>

										<c:if test="${requestBean.contractType eq 'Pre-Freezing '}">
											<td><form:input path="preFreezingAdhocQtyForTheDay"
													id="changeQTy" style="width:90px"
													value="${requestBean.preFreezingAdhocQtyForTheDay}" /></td>
										</c:if>
										<c:if test="${requestBean.contractType eq 'Post-Freezing '}">
											<td><form:input path="postFreezingAdhocQtyForTheDay"
													id="changeQTy" class="changeQTy" style="width:90px"
													value="${requestBean.postFreezingAdhocQtyForTheDay}" /></td>
										</c:if>
										<td align="center"><input type="submit"
											class="btn btn-success full-right resubmitFormSubmitBtn"
											value="Submit" /></td>
									</form:form>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
