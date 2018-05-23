<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="html" tagdir="/WEB-INF/tags/html"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<style>
.test p {
	margin-bottom: -12px !important;
}
</style>

<script>
	$(document).on('keypress', function(e) {
		if (e.keyCode == 13) {
			return false;
		}
	});
	$(document).ready(function() {

		$("#checkall").change(function() { //"select all" change
			$(".checkthis").prop('checked', $(this).prop("checked")); //change all ".checkbox" checked status
			$('.comment').prop('disabled', !$(this).prop("checked"))
			 
		});
		 $(".checkthis").change(function() { //"select all" change
				$(this).closest("tr").find("textarea").prop('disabled', !$(this).prop("checked"));

			}); 
		 $("#deleteBtn").on("click", function(e) {

				e.preventDefault();
				var comment = prompt("Please enter your comment");

				$('.checkthis:checked').each(function() {
					//  alert($(this).attr('name'));
					$(this).parent().parent().find(".comment").val(comment);

				});

			});


		 $("#scsubmit").on("click", function(e) {
				e.preventDefault();
				var valid = true;

				$('.checkthis:checked').each(function() {

					if ($(this).parent().parent().find(".comment").val().trim() == "" || $(this).parent().parent().find(".comment").val() == " ") {
						fg = 0;
						var requestID = $(this).parent().parent().find(".requestID").val();
						commentLenth = $(this).parent().parent().find(".comment").val();
						//alert("comment:" + commentLenth);
						idList = +requestID + " ";
						//alert("Please check the releavant check box/comment of req.no...: " + idList + " ");
						valid = false;

					}
				});
				if (valid) {
					$("#mainForm").submit();
				} else {
					alert("Please  fill the comment of request no...:...: " + idList + " ");
					return false;
				}
				
				
				
				
			});
		});

		
	
</script>
</head>

<div class="row">
	<div class="col-lg-6" style="width: 100%">
		<div class="panel panel-default">
			<div class="panel-heading">Unsold Requests </div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<h5 style="color: red">${msg}</h5>
				<div class="table-responsive">				
					<spring:message code="text.url" var="url" />
						<c:forEach begin="1" end="${maxpages}" varStatus="loop">
						<c:if test="${loop.current==currentID}">
						<a  style="font-weight: bold;" href="${url}unsoldRequestPagenation/${loop.current}">${loop.current}</a>
						</c:if>
						<c:if test="${loop.current!=currentID}">
						<a href="${url}unsoldRequestPagenation/${loop.current}">${loop.current}</a>
						</c:if>
					</c:forEach>
					
					<form:form action="${url}unsoldApprove" id="mainForm"
						modelAttribute="unsoldRequestList">

                    <%--   <c:if test="${role=='Sales Executive'}">
							<a style="marign-right:200px" href=""
								id="deleteBtn">Enter your comment</a>
						</c:if> --%>
						<c:if test="${role=='Sales Executive'}">
							<a style="position: absolute; top: 50; right: 70" href="" id="deleteBtn">Enter your comment</a>
						</c:if>

						<table id="mytable" style="overflow: scroll; width: 400px"
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
									<spring:message code="unsold.claimedQuantity"
										var="claimedQuantity" />
									<th>${claimedQuantity}</th>
									<spring:message code="unsold.allowQuantity" var="allowQuantity" />
									<th>${allowQuantity}</th>
									<spring:message code="unsold.reasonCode" var="reasonCode" />
									<th>${reasonCode}</th>
									<!-- <th>BillingMonth</th> -->
									<th>Sales Exe. Name</th>
									<c:if test="${role=='Sales Executive'}">
										<th>Select all / Deselect all &nbsp&nbsp <input
											type="checkbox" id="checkall" /></th>
									</c:if>

									<th>Comment</th>
									<spring:message code="unsold.action" var="action" />
									<c:if test="${role!='Sales Executive'}">
										<th>${action}</th>
									</c:if>
								</tr>
							</thead>
							<c:url value="approveUnsold" var="approve" />
							<c:url value="rejectUnsold" var="reject" />
							<c:forEach items="${unsoldRequestList.unsoldRequest}"
								var="requestBean" varStatus="status">
								<c:if
									test="${(requestBean.billingBlock=='Assigned')&& (requestBean.esc=='N') }">
									<tr bgcolor="pink">
										<td><form:input class="requestID"
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
										<%-- <c:if test="${role=='Sales Executive'}">
											<td><input type="checkbox" class="checkthis"
												name="checkbox${requestBean.requestId}" /></td>
										</c:if> --%>
										<td><textarea rows="2" cols="14"
												name="unsoldRequest[${status.index}].comment"
												placeholder="Enter Your Comments">${requestBean.comment}</textarea></td>

										<%-- 	<td class="test" style="min-width: 150px"><c:if
												<c:if> --%>
										<c:if test="${requestBean.billingBlock=='Assigned'}">
											<c:if test="${role=='Sales Executive'}">
												<td class="test" style="min-width: 105px;"><form:radiobuttons
														element="p" class="radioSelect" id="adhocList"
														path="unsoldRequest[${status.index}].checkAction"
														items="${checkList}" /></td>
											</c:if>
											<c:if test="${role!='Sales Executive'}">
												<td class="test" style="min-width: 105px;"><form:radiobuttons
														element="p"
														path="unsoldRequest[${status.index}].checkAction"
														items="${checkList}" /></td>
											</c:if>
										</c:if>
									</tr>
								</c:if>
								<c:if
									test="${(requestBean.billingBlock=='Assigned')&& (requestBean.esc=='Y') }">
									<tr bgcolor="yellow">
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
										<c:if test="${role=='Sales Executive'}">
											<td><input type="checkbox" class="checkthis"
												name="checkbox${requestBean.requestId}" /></td>
										</c:if>
										<td><textarea rows="2" cols="14"
												name="unsoldRequest[${status.index}].comment"
												placeholder="Enter Your Comments">${requestBean.comment}</textarea></td>
										<td class="test" style="min-width: 150px"><c:if
												test="${requestBean.billingBlock=='Approved'}">Approved</c:if>
											<c:if test="${requestBean.billingBlock=='Rejected'}">Rejected	</c:if>
											<c:if test="${requestBean.billingBlock=='Assigned'}">
												<form:radiobuttons element="p"
													path="unsoldRequest[${status.index}].checkAction"
													items="${checkList}" />
											</c:if></td>
									</tr>
								</c:if>
								<c:if test="${requestBean.billingBlock=='Approved'}">
									<tr bgcolor="green">
										<td>${requestBean.requestId}</td>
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
										<td><textarea rows="2" cols="14"
												name="unsoldRequest[${status.index}].comment" readonly
												placeholder="Enter Your Comments">${requestBean.comment}</textarea></td>
										<td>${requestBean.billingBlock}</td>
									</tr>
								</c:if>
								<c:if test="${requestBean.billingBlock=='Rejected'}">
									<tr bgcolor="#cc0000" style="height: 50px:widht:100%">
										<td>${requestBean.requestId}</td>
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
										<td><textarea rows="2" cols="14"
												name="unsoldRequest[${status.index}].comment" readonly
												placeholder="Enter Your Comments">${requestBean.comment}</textarea></td>
										<td>${requestBean.billingBlock}</td>

									</tr>
								</c:if>
								<c:if
									test="${(requestBean.billingBlock=='REQUIRED TEXT')&& (requestBean.esc=='N') }">
									<tr bgcolor="pink">
										<td><form:input class="requestID"
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
										<td><input type="checkbox" class="checkthis" value="text"
											name="unsoldRequest[${status.index}].checkAction" " /></td>
										<td><textarea rows="3" cols="10" class="comment"   id="mytext" disabled="disabled"
												name="unsoldRequest[${status.index}].comment"
												placeholder="Enter Your Comments">${requestBean.comment}</textarea></td>

									</tr>
								</c:if>

							</c:forEach>
						</table>
						<c:if test="${role=='Sales Executive'}">
							<button style="margin-left: 1100px" type="button" name='action'
								id="scsubmit" class="btn btn-success">Submit</button>
						</c:if>
						<c:if test="${role!='Sales Executive'}">
							<button style="margin-left: 1150px" type="submit" name='action'
								class="btn btn-success">Submit</button>
						</c:if>
						</td>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>


