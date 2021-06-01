<%@ attribute name="modelAttribute" required="true" rtexprvalue="true" %>
<%@ attribute name="id" required="true" rtexprvalue="true" %>
<%@ attribute name="formUrl" required="true" rtexprvalue="true" %>
<%@ attribute name="cssClass" required="false" rtexprvalue="true" %>
<%@ attribute name="ajaxValidation" type="java.lang.Boolean" required="false" rtexprvalue="true" %>
<%@ attribute name="ajaxValidationUrl" required="false" rtexprvalue="true" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<spring:url value="${formUrl}" var="processedFormUrl" />
<form:form modelAttribute="${modelAttribute}" id="${id}" action="${processedFormUrl}" class="${cssClass}">
<c:if test="${ajaxValidation && (not empty ajaxValidationUrl)}">
	<spring:url value="${ajaxValidationUrl}" var="validateUrl" />
	<input id="ajaxValidationUrl" type="hidden" value="${validateUrl}"/>
	<script type="text/javascript">
      $(function($) {
    	  var formId=  "${id}";
    	  var $form = $('#' + formId);
    	  $form.bind('submit', ajaxFormValidationSubmit);
      });
    </script>
</c:if>
		<fieldset>
	       <jsp:doBody />
	    </fieldset>
</form:form>