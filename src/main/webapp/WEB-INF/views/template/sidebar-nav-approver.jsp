<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="sidebar">
	<nav class="sidebar-nav">
		<div class="profile hidden-md-down">
			<!-- SIDEBAR USERPIC -->
			<div class="profile-userpic">
				<img src="resources/images/user-profile.png"
					class="img-responsive" alt="">
			</div>
			<!-- END SIDEBAR USERPIC -->
			<!-- SIDEBAR USER TITLE -->
			<div class="profile-usertitle">
				<div class="profile-usertitle-name">
					<sec:authentication property="principal.firstname"/>
					&nbsp;
					<sec:authentication property="principal.lastname"/>
				</div>
				<div class="profile-usertitle-job">ADMIN
				
				</div>
			</div>
			<!-- END SIDEBAR USER TITLE -->
		</div>
		<!-- SIDEBAR MENU -->
		<c:set var="currentUrl" value="${requestScope['javax.servlet.forward.servlet_path']}"/>
		<div class="usermenu">
			<ul class="nav">
				<c:url var="AdhocRequestUrl" value="/manager/adhocRequest"/>
				<li class="${fn:contains(currentUrl, AdhocRequestUrl) ? 'active' : ''}">
					
					<a href="${AdhocRequestUrl}"> 
						<i class="glyphicon glyphicon-home"></i> 
						<spring:message code="overview.link.adhocRequest"/>
					</a>
				</li>
				
			</ul>
			
			
		</div>
		<!-- END MENU -->
	</nav>
</div>