<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="html" tagdir="/WEB-INF/tags/html"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- HEADER-START -->
<header class="navbar">
	<div class="container-fluid">
		<div class="red-bar" style="display: none"></div>
		<sec:authorize access="isAuthenticated()">
			<button class="navbar-toggler mobile-toggler hidden-lg-up toggle"
				type="button">
				<i class="fa fa-navicon" ></i>
			</button>
		</sec:authorize>
			<a class="navbar-brand" href="/"></a>
		<sec:authorize access="isAuthenticated()">
			<ul class="nav nav-top navbar-nav hidden-md-down">
				<li class="nav-item">
					<a class="nav-link navbar-toggler layout-toggler toggle" href="#">
						<i class="fa fa-navicon"></i>
					</a>
				</li>
			</ul>
			
	        <a class="dropdown-toggle top-usermenu" data-toggle="dropdown"	href="#">
			<img src="<c:url value="/images/user-profile.png" />"
					class="img-responsive" alt="">
				<span class="hidden-xs"><sec:authentication property="principal.firstname"/></span>
			</a>
			<div class="top-usermenu-dropdown dropdown-menu dropdown-menu-right">
				<%-- <a class="dropdown-item" href="#">
					<!-- <i class="fa fa-user"></i> -->
					<spring:message code="profile.link.text"/>
				</a>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<a class="dropdown-item" href="#">
						<i class="fa fa-wrench"></i>
						 <spring:message code="setting.link.text"/>
					</a>
				</sec:authorize> --%>
				<c:url var="logoutUrl" value="performlogout" />
				<html:form modelAttribute="LoginForm" id="logout-form" formUrl="/performlogout" cssClass="form-hidden"/>
				<a class="link_cursor dropdown-item" onclick="document.getElementById('logout-form').submit();">
				 	<i class="fa fa-power-off"></i> 
					<spring:message code="logout.link.text"/>
				</a>
			</div>
		</sec:authorize>
	</div>
</header>
<!-- HEADER-END -->