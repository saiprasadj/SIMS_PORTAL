<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="html" tagdir="/WEB-INF/tags/html"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
$(document).on('keypress', function(e) {
	    if(e.keyCode==13){
	      return false;
	    }
	});

</script>
<style>
.test p {
	margin-bottom: -12px !important;
}
</style>
<div class="row">
	<div class="col-lg-6" style="width: 100%">
		<div class="panel panel-default">
			<spring:message code="adhocrequest.title" var="title" />
			<div class="panel-heading">Pending Adhoc Requests</div>
			<div class="panel-body">
				<h5 style="color: red">${msg}</h5>
				<div class="table-responsive">
					<spring:message code="text.url" var="url" />
					<c:forEach begin="1" end="${maxpages}" varStatus="loop">
					<c:if test="${loop.current==currentID}">
						<a  style="font-weight: bold" href="${url}pagenation/${loop.current}">${loop.current}</a>
						</c:if>
						<c:if test="${loop.current!=currentID}">
						<a  href="${url}pagenation/${loop.current}">${loop.current}</a>
						</c:if>
						
					</c:forEach>
					<form:form action="${url}approve" modelAttribute="adhocRequestList">
						<c:if test="${count!=0 }">
							<div style="position:absolute;top:45;right:40"">
							
							<a href="${url}approveAllAdhoc"  	onclick="javascript:return confirm('Do you really want to approve all records of current page?')">Approve all</a>  &nbsp &nbsp<a
								href="${url}rejectAllAdhoc"  onclick="javascript:return confirm('Do you really want to reject all records of current page?')">  Reject all</a>
						</div></c:if>

						<table id="mytable"
							style="overflow: scroll; width: 400px; font-size: 10px"
							class="table table-fixed table-bordered" id="dataTables-example">

							<thead>
								<tr>
									<spring:message code="adhocrequest.requestID" var="requestID" />
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
									<th>Edition</th>

									<spring:message code="adhocrequest.publicationDate"
										var="publicationDate" />
									<th>${publicationDate}</th>
									<spring:message code="adhocrequest.indentQty" var="indentQty" />
									<th>Indent Qty.</th>
									<spring:message code="adhocrequest.preQty" var="preQty" />
									<th>Pre-Adhoc Qty.</th>
									<spring:message code="adhocrequest.postQty" var="postQty" />
									<th>Post-Adhoc Qty.</th>
									<th>Indent vs Adhoc %</th>
									<th>Adhoc Counts</th>
									<th>Adhoc Dates</th>
									<spring:message code="adhocrequest.lastMonthUnsold"
										var="lastMonthUnsold" />
									<th>${lastMonthUnsold}</th>
									<spring:message code="adhocrequest.outstandingAmount"
										var="outstandingAmount" />
									<th>${outstandingAmount}</th>

									<th style="widht: 100%">Sales Exe. Name</th>
									<th>Status</th>

									<spring:message code="adhocrequest.comments" var="comments" />
									<th>${comments}</th>

									<spring:message code="adhocrequest.action" var="action" />
									<th>${action}</th>
								</tr>
							</thead>
							<c:forEach items="${adhocRequestList.adhocList}"
								varStatus="status" var="requestBean">
								<c:if
									test="${(requestBean.flag=='Assigned')&& (requestBean.editionDescp=='SENT TO MIS')}">
									<tr bgcolor="pink">
										<td><form:input
												path="adhocList[${status.index}].requestId" readonly="true"
												style="width:60px" value="${requestBean.requestId}" /></td>
										<%-- <td>${requestBean.contractNumber}</td> --%>
										<td>${requestBean.contractType}</td>
										<td>${requestBean.businessArea}</td>
										<td>${requestBean.agencyCode}</td>
										<td>${requestBean.agencyName}</td>
										<td>${requestBean.city}</td>
										<td>${requestBean.editionShortText}</td>
										<td><fmt:formatDate
												value="${requestBean.publicationDate}" pattern="yyyy-MM-dd" /></td>
										<%--  --%>
										<td>${requestBean.indentQtyForTheDay}</td>
										<td>${requestBean.preFreezingAdhocQtyForTheDay}</td>
										<td>${requestBean.postFreezingAdhocQtyForTheDay}</td>
										<td>${requestBean.percentage}</td>
										<td>${requestBean.noOfDays}</td>
										<td>${requestBean.adhocDates}</td>
										<td>${requestBean.lastMonthUnsold}</td>
										<td>${requestBean.outstandingAmount}</td>
										<td>${requestBean.seDes}</td>
										<td>${requestBean.flag}</td>
										<c:url value="approve" var="approve" />
										<c:url value="reject" var="reject" />

										<c:if test="${requestBean.flag=='Approved'}">
											<td>${requestBean.comments}</td>
											<td>Approved</td>
										</c:if>
										<c:if test="${requestBean.flag=='Rejected'}">
											<td>${requestBean.comments}</td>
											<td>Rejected</td>
										</c:if>
										<c:if test="${requestBean.flag=='change'}">
											<td>${requestBean.comments}</td>
											<td>RESENT TO MIS</td>
										</c:if>
										<c:if test="${requestBean.flag=='Assigned'}">
											<td><textarea rows="2" cols="14"
													name="adhocList[${status.index}].comments"
													placeholder="Enter Your Comments">${requestBean.comments}</textarea></td>
											<td class="test" style="min-width: 105px;"><form:radiobuttons
													element="p" path="adhocList[${status.index}].checkAction"
													items="${checkList}" /></td>
										</c:if>

									</tr>
								</c:if>
								<c:if
									test="${(requestBean.flag=='Pending')&& (requestBean.editionDescp=='SENT TO MIS')}">
									<tr bgcolor="pink">
										<td><form:input
												path="adhocList[${status.index}].requestId" readonly="true"
												style="width:60px" value="${requestBean.requestId}" /></td>
										<%-- <td>${requestBean.contractNumber}</td> --%>
										<td>${requestBean.contractType}</td>
										<td>${requestBean.businessArea}</td>
										<td>${requestBean.agencyCode}</td>
										<td>${requestBean.agencyName}</td>
										<td>${requestBean.city}</td>
										<td>${requestBean.editionShortText}</td>
										<td><fmt:formatDate
												value="${requestBean.publicationDate}" pattern="yyyy-MM-dd" /></td>
										<%--  --%>
										<td>${requestBean.indentQtyForTheDay}</td>
										<td>${requestBean.preFreezingAdhocQtyForTheDay}</td>
										<td>${requestBean.postFreezingAdhocQtyForTheDay}</td>
										<td>${requestBean.percentage}</td>
										<td>${requestBean.noOfDays}</td>
										<td>${requestBean.adhocDates}</td>
										<td>${requestBean.lastMonthUnsold}</td>
										<td>${requestBean.outstandingAmount}</td>
										<td>${requestBean.seDes}</td>
										<td>${requestBean.flag}</td>
										<c:url value="approve" var="approve" />
										<c:url value="reject" var="reject" />

										<c:if test="${requestBean.flag=='Approved'}">
											<td>${requestBean.comments}</td>
											<td>Approved</td>
										</c:if>
										<c:if test="${requestBean.flag=='Rejected'}">
											<td>${requestBean.comments}</td>
											<td>Rejected</td>
										</c:if>
										<c:if test="${requestBean.flag=='change'}">
											<td>${requestBean.comments}</td>
											<td>RESENT TO MIS</td>
										</c:if>
										<c:if test="${requestBean.flag=='Pending'}">
											<td><textarea rows="2" cols="14"
													name="adhocList[${status.index}].comments"
													placeholder="Enter Your Comments">${requestBean.comments}</textarea></td>
											<td class="test" style="min-width: 105px;"><form:radiobuttons
													element="p" path="adhocList[${status.index}].checkAction"
													items="${checkList}" /></td>
										</c:if>

									</tr>
								</c:if>
								<c:if
									test="${(requestBean.flag=='REQUIRED TEXT')&& (requestBean.editionDescp=='SENT TO MIS')}">
									<tr bgcolor="pink">
										<td><form:input
												path="adhocList[${status.index}].requestId" readonly="true"
												style="width:60px" value="${requestBean.requestId}" /></td>
										<%-- <td>${requestBean.contractNumber}</td> --%>
										<td>${requestBean.contractType}</td>
										<td>${requestBean.businessArea}</td>
										<td>${requestBean.agencyCode}</td>
										<td>${requestBean.agencyName}</td>
										<td>${requestBean.city}</td>
										<td>${requestBean.editionShortText}</td>
										<td><fmt:formatDate
												value="${requestBean.publicationDate}" pattern="yyyy-MM-dd" /></td>
										<%--  --%>
										<td>${requestBean.indentQtyForTheDay}</td>
										<td>${requestBean.preFreezingAdhocQtyForTheDay}</td>
										<td>${requestBean.postFreezingAdhocQtyForTheDay}</td>
										<td>${requestBean.percentage}</td>
										<td>${requestBean.noOfDays}</td>
										<td>${requestBean.adhocDates}</td>
										<td>${requestBean.lastMonthUnsold}</td>
										<td>${requestBean.outstandingAmount}</td>
										<td>${requestBean.seDes}</td>
										<td>${requestBean.flag}</td>
										<c:url value="approve" var="approve" />
										<c:url value="reject" var="reject" />

										<c:if test="${requestBean.flag=='Approved'}">
											<td>${requestBean.comments}</td>
											<td>Approved</td>
										</c:if>
										<c:if test="${requestBean.flag=='Rejected'}">
											<td>${requestBean.comments}</td>
											<td>Rejected</td>
										</c:if>
										<c:if test="${requestBean.flag=='change'}">
											<td>${requestBean.comments}</td>
											<td>RESENT TO MIS</td>
										</c:if>
										<c:if test="${requestBean.flag=='REQUIRED TEXT'}">
											<td><textarea rows="2" cols="14"
													name="adhocList[${status.index}].comments"
													placeholder="Enter Your Comments">${requestBean.comments}</textarea></td>
											<td class="test" style="min-width: 105px;"><form:radiobuttons
													element="p" path="adhocList[${status.index}].checkAction"
													items="${checkList}" /></td>
										</c:if>

									</tr>
								</c:if>


								<c:if
									test="${(requestBean.flag=='Approved')&& (requestBean.editionDescp=='SENT TO MIS')}">
									<tr bgcolor="green">
										<td><form:input
												path="adhocList[${status.index}].requestId" readonly="true"
												style="width:60px" value="${requestBean.requestId}" /></td>
										<%-- <td>${requestBean.contractNumber}</td> --%>
										<td>${requestBean.contractType}</td>
										<td>${requestBean.businessArea}</td>
										<td>${requestBean.agencyCode}</td>
										<td>${requestBean.agencyName}</td>
										<td>${requestBean.city}</td>
										<td>${requestBean.editionShortText}</td>
										<td><fmt:formatDate
												value="${requestBean.publicationDate}" pattern="yyyy-MM-dd" /></td>
										<%--  --%>
										<td>${requestBean.indentQtyForTheDay}</td>
										<td>${requestBean.preFreezingAdhocQtyForTheDay}</td>
										<td>${requestBean.postFreezingAdhocQtyForTheDay}</td>
										<td>${requestBean.percentage}</td>
										<td>${requestBean.noOfDays}</td>
										<td>${requestBean.adhocDates}</td>
										<td>${requestBean.lastMonthUnsold}</td>
										<td>${requestBean.outstandingAmount}</td>
										<td>${requestBean.seDes}</td>
										<td>${requestBean.flag}</td>
										<c:url value="approve" var="approve" />
										<c:url value="reject" var="reject" />

										<c:if test="${requestBean.flag=='Approved'}">
											<td class="test"><textarea rows="2" cols="14"
													name="adhocList[${status.index}].comments" readonly
													placeholder="Enter Your Comments">${requestBean.comments}</textarea></td>
											<td>Approved</td>
										</c:if>
										<c:if test="${requestBean.flag=='Rejected'}">
											<td>${requestBean.comments}</td>
											<td>Rejected</td>
										</c:if>
										<c:if test="${requestBean.flag=='change'}">
											<td>${requestBean.comments}</td>
											<td>RESENT TO MIS</td>
										</c:if>


									</tr>
								</c:if>

								<c:if
									test="${(requestBean.flag=='Rejected')&& (requestBean.editionDescp=='SENT TO MIS')}">
									<tr bgcolor="red">
										<td><form:input
												path="adhocList[${status.index}].requestId" readonly="true"
												style="width:60px" value="${requestBean.requestId}" /></td>
										<%-- <td>${requestBean.contractNumber}</td> --%>
										<td>${requestBean.contractType}</td>
										<td>${requestBean.businessArea}</td>
										<td>${requestBean.agencyCode}</td>
										<td>${requestBean.agencyName}</td>
										<td>${requestBean.city}</td>
										<td>${requestBean.editionShortText}</td>
										<td><fmt:formatDate
												value="${requestBean.publicationDate}" pattern="yyyy-MM-dd" /></td>
										<%--  --%>
										<td>${requestBean.indentQtyForTheDay}</td>
										<td>${requestBean.preFreezingAdhocQtyForTheDay}</td>
										<td>${requestBean.postFreezingAdhocQtyForTheDay}</td>
										<td>${requestBean.percentage}</td>
										<td>${requestBean.noOfDays}</td>
										<td>${requestBean.adhocDates}</td>
										<td>${requestBean.lastMonthUnsold}</td>
										<td>${requestBean.outstandingAmount}</td>
										<td>${requestBean.seDes}</td>
										<td>${requestBean.flag}</td>
										<c:url value="approve" var="approve" />
										<c:url value="reject" var="reject" />

										<c:if test="${requestBean.flag=='Approved'}">
											<td><textarea rows="2" cols="14"
													name="adhocList[${status.index}].comments" readonly
													placeholder="Enter Your Comments">${requestBean.comments}</textarea></td>
											<td>Approved</td>
										</c:if>
										<c:if test="${requestBean.flag=='Rejected'}">
											<td class="test"><textarea rows="2" cols="14"
													name="adhocList[${status.index}].comments" readonly
													placeholder="Enter Your Comments">${requestBean.comments}</textarea></td>
											<td>Rejected</td>
										</c:if>
										<c:if test="${requestBean.flag=='change'}">
											<td>${requestBean.comments}</td>
											<td>RESENT TO MIS</td>
										</c:if>
										<%-- <c:if test="${requestBean.flag=='Assigned'}">
											<td><textarea rows="2" cols="14"
													name="adhocList[${status.index}].comments"
													placeholder="Enter Your Comments">${requestBean.comments}</textarea></td>
											<td style="min-width: 105px;"><form:radiobuttons
													element="p" path="adhocList[${status.index}].checkAction"
													items="${checkList}" /></td>
										</c:if> --%>

									</tr>
								</c:if>
							</c:forEach>
						</table>

               <c:if test="${count!=0 }">
						<button style="margin-left: 1650px;" type="submit" name='action'
							class="btn btn-success full-right">Submit</button>
							</c:if>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>


