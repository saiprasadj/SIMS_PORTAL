<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ attribute name="name" required="true" rtexprvalue="true" description="Name of corresponding property in bean object"%>
<%@ attribute name="label" required="false" rtexprvalue="true" description="Label for input"%>
<%@ attribute name="placeholder" required="false" rtexprvalue="true" description="Placeholder label for input"%>
<%@ attribute name="cssClass" required="false" rtexprvalue="true" description="css class for input" %>

<spring:bind path="${name}">
	<c:set var="cssGroup" value="form-group ${status.error ? 'has-error' : '' }"/>
	<div class="${cssGroup}" id="${name}_ctr_grp">
		<c:if test="${not empty label}">
			<label class="control-label">${label}</label> 
		</c:if>
		<form:input path="${name}" placeholder="${placeholder}" cssClass="form-control ${cssClass}"/> 
		<span class="help-block text-90">${status.errorMessage}</span>
	</div>
</spring:bind>