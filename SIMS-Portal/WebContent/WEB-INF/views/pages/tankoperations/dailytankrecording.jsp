<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="html" tagdir="/WEB-INF/tags/html"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="tankoperationsdetails"
	tagdir="/WEB-INF/tags/tankoperations/list"%>
<%@taglib prefix="tankoperationslist"
	tagdir="/WEB-INF/tags/tankoperations/details"%>


<div class="col-lg-12 col-sm-12">
	<section>

		<c:choose>
			<c:when test="${tabToShow == 'details'}">
				<c:set var="detailsPage" value="active in" />
				<c:set var="listPage" value="" />
				<c:set var="detailsPageActive" value="active" />
				<c:set var="listPageActive" value="" />
			</c:when>
			<c:otherwise>
				<c:set var="listPage" value="active in" />
				<c:set var="detailsPage" value="" />
				<c:set var="detailsPageActive" value="" />
				<c:set var="listPageActive" value="active" />
			</c:otherwise>
		</c:choose>

		<ul id="top-bar" class="nav nav-tabs nav-justified">
			<li class="${listPageActive}"><a data-toggle="tab"
				href="#listpage">
					<h6 class="form-header hidden-xs-down">
						<spring:message
							code="sims.portal.tankoperations.dailytankrecording.list" />
					</h6>
			</a></li>
			<li class="${detailsPageActive}"><a data-toggle="tab"
				href="#detailspage">
					<h6 class="form-header hidden-xs-down">
						<spring:message
							code="sims.portal.tankoperations.dailytankrecording.details" />
					</h6>
			</a></li>
		</ul>

		<div
			class="tab-content tabs-login col-lg-12 col-md-12 col-sm-12 cols-xs-12">

			<div id="listpage" class="tab-pane fade ${listPage}">
				<tankoperationsdetails:dailytankrecordinglist />
			</div>
			<div id="detailspage" class="tab-pane fade ${detailsPage}">
				<tankoperationslist:dailytankrecordingdetails />
			</div>

		</div>

	</section>
</div>


========== DAILY TANK RECORDING JSP =======



