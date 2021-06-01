<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="html" tagdir="/WEB-INF/tags/html"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<head>
<script type="text/javascript">
	function validateform() {
		/* var number = document.getElementById("phone").value;
		var x=document.getElementById("email").value; 
		var atposition=x.indexOf("@");  
		var dotposition=x.lastIndexOf(".");
		var msg=" ";
		if (atposition<1 || dotposition<atposition+2 || dotposition+2>=x.length){  
			  alert("Please enter a valid e-mail address ");  
			  return false;  
		 }  
		if (isFinite(number)) {
			return true;
		} else {
			alert("Please Enter Phone Number");
			return false;
		} */

		alert("from Validation");
		return true;
	}
</script>
</head>
<form:form id="dailyTankRecordingDetailsForm"
	modelAttribute="dailyTankRecordingForm"
	action="${pageContext.request.contextPath}/tankoperations/${dailyTankRecordingURL}"
	method="POST" onsubmit="return validateform()">
	
	===========ID==${dailyTankRecordingForm.dailytankrecording_id}==========================
	<div class="row">
		<div class="col-lg-12">
			<h5>Account Master Details</h5>
			<h5 style="color: green;">${message}</h5>
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-6">
						<div class="form-group" style="margin-bottom: 0px">
							<label><spring:message text="TankName" /></label>
							<form:input path="tankName" id="tankName" class="form-control"></form:input>
						</div>
						<div class="form-group" style="margin-bottom: 0px">
							<label><spring:message text="SiteName" /></label>
							<form:input path="siteName" id="siteName" class="form-control"></form:input>
						</div>
						<div class="form-group" style="margin-bottom: 0px">
							<label><spring:message text="DocumentDate" /></label>
							<form:input path="documentDate" id="documentDate"
								class="form-control" />
						</div>
					</div>
					<div class="col-lg-6">

						<div class="form-group" style="margin-bottom: 0px">
							<label><spring:message text="Supervisor" /></label>
							<form:input path="supervisor" id="supervisor"
								class="form-control" />
						</div>

						<div class="form-group" style="margin-bottom: 0px">
							<label><spring:message text="Remarks" /></label>
							<form:input path="remarks" id="remarks" class="form-control" />
						</div>

					</div>
				</div>

			</div>
		</div>
	</div>
	<div class="col-lg-12">
		<div class="row">
			<c:choose>
				<c:when test="${dailyTankRecordingURL == 'dailytankrecording/save'}">
					<div class="col-xs-6">
						<button class="btn btn-primary btn-xs" type="submit">Save</button>
					</div>
					<div class="col-xs-6">
						<button class="btn btn-primary btn-xs" type="submit"
							disabled="disabled">Update</button>
					</div>
				</c:when>
				<c:otherwise>
					<div class="col-xs-6">
						<button class="btn btn-primary btn-xs" type="submit">Update</button>
					</div>
					<div class="col-xs-6">
						<button class="btn btn-primary btn-xs" type="submit">Delete</button>
					</div>
				</c:otherwise>
			</c:choose>

		</div>

	</div>
</form:form>
