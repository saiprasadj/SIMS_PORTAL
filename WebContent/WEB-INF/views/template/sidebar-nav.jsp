<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="sidebar">
	<nav class="sidebar-nav">
		<%-- <div class="profile hidden-md-down">
			<!-- SIDEBAR USERPIC -->
			<div class="profile-userpic">
				<img style="height: 50px"
					src="<c:url value="/resources/images/user-profile.png" />"
					class="img-responsive" alt="">
			</div>
			<!-- END SIDEBAR USERPIC -->
			<!-- SIDEBAR USER TITLE -->
			<div class="profile-usertitle">
				<div class="profile-usertitle-name">
					<sec:authentication property="principal.firstname" />
					&nbsp;
					<sec:authentication property="principal.lastname" />
				</div>
				<!-- <div class="profile-usertitle-job">Developer</div> -->
			</div>
			<!-- END SIDEBAR USER TITLE -->
		</div> --%>
		<!-- SIDEBAR MENU -->
		<c:set var="currentUrl"
			value="/SIMS-Portal${requestScope['javax.servlet.forward.servlet_path']}" />
		<%-- <c:set var="currentUrl"
			value="${pageContext.request.requestURL}}" /> --%>
		<div class="usermenu">
			<ul class="nav">
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<c:url var="welcomeURL" value="/admin/welcome" />
					<li class="${fn:contains(currentUrl, welcomeURL) ? 'active' : ''}">

						<a href="${welcomeURL}"> <i class="fa fa-home"></i> <spring:message
								code="overview.link.text" />

					</a>
					</li>

					<c:url var="profileUrl" value="/admin/profile" />
					<li class="${fn:contains(currentUrl, profileUrl) ? 'active' : ''}">

						<a href="${profileUrl}"> <i class="fa fa-user"></i> <spring:message
								code="profile.link.text" />
					</a>
					</li>
					<c:url var="AddNewUserUrl" value="/admin/addNewUser" />
					<li
						class="${fn:contains(currentUrl, AddNewUserUrl) ? 'active' : ''}">

						<a href="${AddNewUserUrl}"> <i class="fa fa-user-plus"></i> <spring:message
								code="test.link.text" />
					</a>

					</li>

					<c:url var="EditUrl" value="/admin/edit" />
					<li class="${fn:contains(currentUrl, EditUrl) ? 'active' : ''}">

						<a href="${EditUrl}"> <i class="fa fa-users"></i> <spring:message
								code="edit.link.text" />
					</a>

					</li>

					<c:url var="PercentageUrl" value="/admin/percentage" />
					<li
						class="${fn:contains(currentUrl, PercentageUrl) ? 'active' : ''}">

						<a href="${PercentageUrl}"> <i class="fa fa-percent"></i> <spring:message
								code="percentageUrl.link.text" />
					</a>

					</li>


					<%-- <c:url var="UnsoldAssignUrl" value="/admin/unsoldAssing" />
					<li
						class="${fn:contains(currentUrl, UnsoldAssignUrl) ? 'active' : ''}">

						<a href="${UnsoldAssignUrl}"> <i
							class="fa fa-home"></i> <spring:message
								code="unsoldAssing.link.text" />
					</a>

					</li> --%>





					<c:url var="ClassificationUrl" value="/admin/classification" />
					<li
						class="${fn:contains(currentUrl, ClassificationUrl) ? 'active' : ''}">

						<a href="${ClassificationUrl}"> <i class="fa fa-sitemap"></i>
							<spring:message code="classificationUrl.link.text" />
					</a>

					</li>
					<%-- <c:url var="ResubmitUrl" value="/admin/resubmit" />
					<li class="${fn:contains(currentUrl, ResubmitUrl) ? 'active' : ''}">

						<a href="${ResubmitUrl}"> <i class="fa fa-home"></i>
							<spring:message code="resubmit.link.text" />
							
					</a>  --%>

					<%-- <c:url var="ReporttUrl1" value="/admin/report" />
					<li class="${fn:contains(currentUrl, ReporttUrl1) ? 'active' : ''}">

						<a href="${ReporttUrl1}"> <i class="fa fa-home"></i>
							<spring:message code="report.link.text" />
					</a>

					</li> --%>

					<%-- <c:url var="tasksUrl" value="tasks" />
					<li class="${fn:contains(currentUrl, tasksUrl) ? 'active' : ''}">
						<a href="${tasksUrl}"> <i class="glyphicon glyphicon-ok"></i>
							<spring:message code="task.link.text" />
					</a>
					</li> --%>
				</sec:authorize>



				<sec:authorize access="hasRole('ROLE_USER')">
					<c:url var="welcomeURL" value="/" />
					<li class="${fn:contains(currentUrl, welcomeURL) ? 'active' : ''}">
						<a href="${welcomeURL}"> <i class="fa fa-home"></i> <spring:message
								code="overview.link.text" />
					</a>
					</li>

					<c:url var="accountMasterURL" value="/master/account" />
					<li
						class="${fn:contains(currentUrl, accountMasterURL) ? 'active' : ''}">
						<a href="${accountMasterURL}"> <i class="fa fa-line-chart"></i>
							<spring:message
								code="sims.portal.homepage.navbar.masters.account" />
					</a>
					</li>

					<c:url var="departmentMasterURL" value="/master/department" />
					<li
						class="${fn:contains(currentUrl, departmentMasterURL) ? 'active' : ''}">
						<a href="${departmentMasterURL}"> <i class="fa fa-users"></i>
							<spring:message
								code="sims.portal.homepage.navbar.masters.department" />
					</a>
					</li>

					<c:url var="employeeMasterURL" value="/master/employee" />
					<li
						class="${fn:contains(currentUrl, employeeMasterURL) ? 'active' : ''}">
						<a href="${employeeMasterURL}"> <i class="fa fa-users"></i> <spring:message
								code="sims.portal.homepage.navbar.masters.employee" />
					</a>
					</li>

					<c:url var="productMasterURL" value="/master/product" />
					<li
						class="${fn:contains(currentUrl, productMasterURL) ? 'active' : ''}">
						<a href="${productMasterURL}"> <i
							class="glyphicon glyphicon-pencil"></i> <spring:message
								code="sims.portal.homepage.navbar.masters.product" />
					</a>
					</li>

					<c:url var="sectionMasterURL" value="/master/section" />
					<li
						class="${fn:contains(currentUrl, sectionMasterURL) ? 'active' : ''}">
						<a href="${sectionMasterURL}"> <i class="fa fa-home"></i> <spring:message
								code="sims.portal.homepage.navbar.masters.section" />
					</a>
					</li>

					<c:url var="wareHouseMasterURL" value="/master/warehouse" />
					<li
						class="${fn:contains(currentUrl, wareHouseMasterURL) ? 'active' : ''}">
						<a href="${wareHouseMasterURL}"> <i class="fa fa-home"></i> <spring:message
								code="sims.portal.homepage.navbar.masters.warehouse" />
					</a>
					</li>



					<c:url var="dailyTankRecordingURL"
						value="/tankoperations/dailytankrecording" />
					<li
						class="${fn:contains(currentUrl, dailyTankRecordingURL) ? 'active' : ''}">
						<a href="${dailyTankRecordingURL}"> <i class="fa fa-home"></i>
							<spring:message
								code="sims.portal.homepage.navbar.tankoperations.dailyTankRecording" />
					</a>
					</li>
				</sec:authorize>


				<sec:authorize access="hasRole('ROLE_MIS')">
					<c:url var="welcomeURL" value="/" />
					<li class="${fn:contains(currentUrl, welcomeURL) ? 'active' : ''}">

						<a href="${welcomeURL}"> <i class="fa fa-home"></i> <spring:message
								code="overview.link.text" />
					</a>
					</li>
					<c:url var="profileUrl" value="/admin/profile" />
					<li class="${fn:contains(currentUrl, profileUrl) ? 'active' : ''}">

						<a href="${profileUrl}"> <i class="fa fa-user"></i> <spring:message
								code="profile.link.text" />
					</a>
					</li>
					<c:url var="ResubmitUrl" value="/admin/resubmit" />
					<li class="${fn:contains(currentUrl, ResubmitUrl) ? 'active' : ''}">

						<a href="${ResubmitUrl}"> <i class="fa fa-paper-plane-o"></i>
							<spring:message code="resubmit.link.text" />
					</a> <c:url var="PendingAdhocRequestUrl" value="/manager/adhocRequest" />
					<li
						class="${fn:contains(currentUrl, PendingAdhocRequestUrl) ? 'active' : ''}">

						<a href="${PendingAdhocRequestUrl}"> <i
							class="fa fa-paper-plane-o"></i> <spring:message
								code="overview.link.pendingadhocRequest" />
					</a>
					</li>
					<c:url var="unsoldUrl" value="/manager/unsoldRequest" />
					<li class="${fn:contains(currentUrl, unsoldUrl) ? 'active' : ''}">

						<a href="${unsoldUrl}"> <i class="fa fa-paper-plane"></i> <spring:message
								code="overview.link.pendingUnsoldRequest" />
					</a>
					</li>

					<c:url var="ReporttUrl1" value="/admin/report" />
					<li class="${fn:contains(currentUrl, ReporttUrl1) ? 'active' : ''}">

						<a href="${ReporttUrl1}"> <i class="fa fa-line-chart"></i> <spring:message
								code="report.link.text" />
					</a>

					</li>

					</a>
					</li>

				</sec:authorize>


			</ul>
		</div>
		<!-- END MENU -->
	</nav>
</div>