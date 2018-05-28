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
				alert("Please  fill the comment of request no...: " + idList + " ");
				return false;
			}
			
			
			
			
		});
	});
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			/* //alert("abc")

			/* var fg = 1;
			var idList = " ";
			var radioChecked = 0;
			var commentLenth;
			$('.radioSelect:checked').each(function() {

				radioChecked = 1
			});

			$('.checkthis:checked').each(function() {
				console.log("abcd")

				if ($(this).parent().parent().find(".comment").val().trim() == "" || $(this).parent().parent().find(".comment").val() == " ") {
					fg = 0;
					var requestID = $(this).parent().parent().find(".requestID").val();
					commentLenth = $(this).parent().parent().find(".comment").val();
					//alert("comment:" + commentLenth);
					idList = +requestID + " ";
					console.log("abcde :" + idList.length);
					console.log("false");
					alert("Please select the releavant check box of req.no...: " + idList + " ");
					return false;

				} else {

					$("#mainForm").submit();
				}

			});

			if (radioChecked == 0 && fg == 1) {
				alert("please select checkbox/enter comment");
				return false;
			} else if (radioChecked == 1 && fg == 1) {
				$("#mainForm").submit();
			} else {

			} 

		});

	}); */
</script>
<!-- <script>
	$(document).on('keypress', function(e) {
		if (e.keyCode == 13) {
			return false;
		}
	});

	$(document).ready(function() {		

		$("#checkall").change(function() { //"select all" change
			$(".checkthis").prop('checked', $(this).prop("checked"));
			$('.comment').prop('disabled', !$(this).prop("checked"))

			// $(this).closest("td").find("textarea").prop('disabled',!$(this).prop("checked"));

		});

		$(".checkthis").change(function() { //"select all" change
			$(this).closest("tr").find("textarea").prop('disabled', !$(this).prop("checked"));

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
				alert("Please check the releavant check box/comment of req.no...: " + idList + " ");
				return false;
			}

		});
	});
</script> -->
</head>
<div class="row">
	<div class="col-lg-6" style="width: 100%">
		<div class="panel panel-default">
			<spring:message code="adhocrequest.title" var="title" />
			<div class="panel-heading">${title}</div>
			<div class="panel-body">
				<h5 style="color: red">${msg}</h5>
				<div class="table-responsive">
					<spring:message code="text.url" var="url" />
					<c:forEach begin="1" end="${maxpages}" varStatus="loop">
					<c:if test="${loop.current==currentID}">
						<a style="font-weight: bold;" href="${url}pagenation/${loop.current}">${loop.current}</a>
						</c:if>
						<c:if test="${loop.current!=currentID}">
						<a href="${url}pagenation/${loop.current}">${loop.current}</a>
						</c:if>
						
					</c:forEach>

					<form:form action="${url}approve" modelAttribute="adhocRequestList"
						id="mainForm">
						<c:if test="${role=='Sales Executive'}">
							<a style="position: absolute; top: 50; right: 70" href=""
								id="deleteBtn">Enter your comment</a>
						</c:if>
						<table id="mytable"
							style="overflow: scroll; width: 400px; font-size: 10px"
							class="table table-fixed table-bordered" id="dataTables-example">

							<thead>
								<tr>
									<spring:message code="adhocrequest.requestID" var="requestID" />
									<th>Req_Id</th>
									<%-- <spring:message code="adhocrequest.contractType"
										var="ContractType" />
									<th>${ContractType}</th> --%>
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
									<c:if test="${role=='Sales Executive'}">
										<th>Select all / Deselect all &nbsp&nbsp <input
											type="checkbox" id="checkall" /></th>
									</c:if>
									<spring:message code="adhocrequest.comments" var="comments" />
									<th>${comments}</th>
									<spring:message code="adhocrequest.action" var="action" />
									<th>${action}</th>
								</tr>
							</thead>
							<%-- ${adhocRequestList.AdhocList}" --%>

							<c:forEach items="${adhocRequestList.adhocList}"
								varStatus="status" var="requestBean">
								<c:if
									test="${(requestBean.flag=='Assigned')&& (requestBean.esc=='N')&& (requestBean.salesExApprove!=2 )}">
									<tr bgcolor="pink">
										<td><form:input cssClass="requestID"
												path="adhocList[${status.index}].requestId" readonly="true"
												style="width:60px" value="${requestBean.requestId}" /></td>
										<%-- <td>${requestBean.contractNumber}</td> --%>
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
										<c:if test="${role=='Sales Executive'}">
											<td>
												<%-- <input type="checkbox" class="checkthis1"
											name="checkbox${requestBean.requestId}" /> --%>
											</td>
										</c:if>
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
											<td><textarea row"3" cols="14"
													name="adhocList[${status.index}].comments"
													placeholder="Enter Your Comments">${requestBean.comments}</textarea></td>
											<c:if test="${role=='Sales Executive'}">
												<td class="test" style="min-width: 105px;"><form:radiobuttons
														element="p" class="radioSelect" id="adhocList"
														path="adhocList[${status.index}].checkAction"
														items="${checkList}" /></td>
											</c:if>
											<c:if test="${role!='Sales Executive'}">
												<td class="test" style="min-width: 105px;"><form:radiobuttons
														name="redaioCheck" element="p"
														path="adhocList[${status.index}].checkAction"
														items="${checkList}" /></td>
											</c:if>
										</c:if>

									</tr>
								</c:if>
								<c:if
									test="${(requestBean.flag=='Assigned')&& (requestBean.esc=='Y')}">
									<tr bgcolor="Yellow" style="height: 100px">
										<td><form:input
												path="adhocList[${status.index}].requestId" readonly="true"
												style="width:60px" value="${requestBean.requestId}" /></td>
										<%-- <td>${requestBean.contractNumber}</td> --%>

										<td>${requestBean.businessArea}</td>
										<td>${requestBean.agencyCode}</td>
										<td>${requestBean.agencyName}</td>
										<td>${requestBean.city}</td>
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

										<c:if test="${role=='Sales Executive'}">
											<td>
												<%-- <input type="checkbox" class="checkthis1"
												name="checkbox${requestBean.requestId}" /> --%>
											</td>
										</c:if>
										<c:url value="approve" var="approve" />
										<c:url value="reject" var="reject" />


										<%-- <c:if test="role=="Sales Executive">
										<td><input type="checkbox" class="checkthis"
											name="checkbox${requestBean.requestId}" /></td>
											</c:if> --%>
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
											<td>Resent</td>
										</c:if>

										<c:if test="${requestBean.flag=='Assigned'}">
											<td><textarea row"3" cols="14"
													name="adhocList[${status.index}].comments" 
													placeholder="Enter Your Comments">${requestBean.comments}</textarea></td>

											<c:if test="${role=='Sales Executive'}">
												<td class="test" style="min-width: 105px;"><form:radiobuttons
														element="p" class="radioSelect" id="adhocList"
														path="adhocList[${status.index}].checkAction"
														items="${checkList}" /></td>
											</c:if>
											<c:if test="${role!='Sales Executive'}">
												<td class="test" style="min-width: 105px;"><form:radiobuttons
														name="redaioCheck" element="p"
														path="adhocList[${status.index}].checkAction"
														items="${checkList}" /></td>
											</c:if>
										</c:if>


									</tr>
								</c:if>
								<c:if test="${(requestBean.flag=='Approved')}">
									<tr bgcolor="green	">

										<td><form:input
												path="adhocList[${status.index}].requestId" readonly="true"
												style="width:60px" value="${requestBean.requestId}" /></td>
										<%-- <td>${requestBean.contractNumber}</td> --%>

										<td>${requestBean.businessArea}</td>
										<td>${requestBean.agencyCode}</td>
										<td>${requestBean.agencyName}</td>
										<td>${requestBean.city}</td>
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
										<c:if test="${role=='Sales Executive'}">
											<td>
												<%-- <input type="checkbox" class="checkapproved"  class="approved Radio" checked="checked" disabled="disabled"
												name="checkbox${requestBean.requestId}" /> --%>
											</td>
										</c:if>
										<c:url value="approve" var="approve" />
										<c:url value="reject" var="reject" />
										<%-- <td><input type="checkbox" class="checkthis" disabled="disabled"
											name="checkbox${requestBean.requestId}" /></td> --%>
										<c:if test="${requestBean.flag=='Approved'}">
											<%-- <td>${requestBean.comments}</td> --%>
											<td><textarea rows="3" cols="14"
													name="adhocList[${status.index}].comments"
													placeholder="Enter Your Comments" readonly>${requestBean.comments}</textarea></td>
											<td>Approved</td>
										</c:if>
										<c:if test="${requestBean.flag=='Rejected'}">
											<td>${requestBean.comments}</td>
											<td>Rejected</td>
										</c:if>
										<c:if test="${requestBean.flag=='change'}">
											<td>${requestBean.comments}</td>
											<td>Resent</td>
										</c:if>

									</tr>
								</c:if>

								<c:if test="${(requestBean.flag=='Rejected')}">
									<tr bgcolor="red">

										<td><form:input
												path="adhocList[${status.index}].requestId" readonly="true"
												style="width:60px" value="${requestBean.requestId}" /></td>
										<%-- <td>${requestBean.contractNumber}</td> --%>

										<td>${requestBean.businessArea}</td>
										<td>${requestBean.agencyCode}</td>
										<td>${requestBean.agencyName}</td>
										<td>${requestBean.city}</td>
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
										<c:if test="${role=='Sales Executive'}">
											<td>
												<%-- <input type="checkbox" class="checkapproved"  class="reject Radio" checked="checked" disabled="disabled"
												name="checkbox${requestBean.requestId}" /> --%>
											</td>
										</c:if>
										<c:url value="approve" var="approve" />
										<c:url value="reject" var="reject" />
										<%--  <td><input type="checkbox" class="checkthis" disabled="disabled"
											name="checkbox${requestBean.requestId}" /></td> --%>
										<c:if test="${requestBean.flag=='Approved'}">
											<td>${requestBean.comments}</td>
											<td>Approved</td>
										</c:if>
										<c:if test="${requestBean.flag=='Rejected'}">
											<td><textarea rows="3" cols="14"
													name="adhocList[${status.index}].comments"
													placeholder="Enter Your Comments" readonly>${requestBean.comments}</textarea></td>
											<td>Rejected</td>
										</c:if>
										<c:if test="${requestBean.flag=='change'}">
											<td>${requestBean.comments}</td>
											<td>Resent</td>
										</c:if>

									</tr>

								</c:if>

								<c:if
									test="${(requestBean.flag=='RESENT TO MIS')&& (requestBean.esc=='N')}">
									<tr bgcolor="orange">

										<td><form:input
												path="adhocList[${status.index}].requestId" readonly="true"
												style="width:60px" value="${requestBean.requestId}" /></td>

										<td>${requestBean.businessArea}</td>
										<td>${requestBean.agencyCode}</td>
										<td>${requestBean.agencyName}</td>
										<td>${requestBean.city}</td>
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
										<c:if test="${role=='Sales Executive'}">
											<td>
												<%-- <input type="checkbox" class="checkapproved"  class="reject Radio1" checked="checked" disabled="disabled"
												name="checkbox${requestBean.requestId}" /> --%>
											</td>
										</c:if>
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
										<c:if test="${requestBean.flag=='RESENT TO MIS'}">
											<td><textarea rows="3" cols="14"
													name="adhocList[${status.index}].comments"
													placeholder="Enter Your Comments" readonly>${requestBean.comments}</textarea></td>
											<td>Resent</td>
										</c:if>

									</tr>

								</c:if>
								<c:if
									test="${(requestBean.flag=='RESENT TO MIS')&& (requestBean.esc=='Y')}">
									<tr bgcolor="orange">

										<td><form:input
												path="adhocList[${status.index}].requestId" readonly="true"
												style="width:60px" value="${requestBean.requestId}" /></td>
										<%-- <td>${requestBean.contractNumber}</td> --%>

										<td>${requestBean.businessArea}</td>
										<td>${requestBean.agencyCode}</td>
										<td>${requestBean.agencyName}</td>
										<td>${requestBean.city}</td>
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
										<c:if test="${role=='Sales Executive'}">
											<td>
												<%-- <input type="checkbox" class="checkapproved"  class="reject Radio2" checked="checked" disabled="disabled"
												name="checkbox${requestBean.requestId}" /> --%>
											</td>
										</c:if>
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
										<c:if test="${requestBean.flag=='RESENT TO MIS'}">
											<td><textarea rows="3" cols="14"
													name="adhocList[${status.index}].comments"
													placeholder="Enter Your Comments" readonly>${requestBean.comments}</textarea></td>
											<td>Resent</td>
										</c:if>
									</tr>

								</c:if>

								<!-- Adding new Code -->
								<c:if
									test="${(requestBean.flag=='REQUIRED TEXT')&& (requestBean.esc=='N')&& (requestBean.salesExApprove==2 )}">
									<tr bgcolor="pink">
										<td><form:input class="requestID"
												path="adhocList[${status.index}].requestId" readonly="true"
												style="width:60px" value="${requestBean.requestId}" /></td>
										<%-- <td>${requestBean.contractNumber}</td> --%>

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
										<td><input type="checkbox" class="checkthis"
											name="adhocList[${status.index}].checkAction" value="text" /></td>
										<c:if test="${requestBean.flag=='REQUIRED TEXT'}">
											<td><textarea row"3" cols="14" class="comment" disabled="disabled"
													name="adhocList[${status.index}].comments"
													placeholder="Enter Your Comments">${requestBean.comments}</textarea></td>
											<td></td>

											</td>
										</c:if>
									</tr>
								</c:if>



							</c:forEach>
						</table>
						<!-- <button style="margin-left: 1550px;" 
							class="btn btn-success full-right" onclick="myFunction()">Enter your Text</button> -->
						<c:if test="${role=='Sales Executive'}">
							<button style="margin-left: 1510px;" type="button" name='action'
								class=" test btn btn-success full-right" id="scsubmit">Submit</button>
						</c:if>
						<c:if test="${role!='Sales Executive'}">
							<button style="margin-left: 1470px;" type="submit" name="submit"
								id="subBtn2" class="btn btn-success full-right">Submit</button>
						</c:if>
						</td>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>


