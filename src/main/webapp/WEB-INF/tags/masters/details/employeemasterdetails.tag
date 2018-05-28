<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="html" tagdir="/WEB-INF/tags/html"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ attribute name="employeeDetailsForm" required="true"%>

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
<form:form id="employeeMasterDetailsForm"
	modelAttribute="employeeMasterForm"
	action="${pageContext.request.contextPath}/master/${employeeMasterURL}"
	method="POST" onsubmit="return validateform()">
	
	===========ID==${employeeMasterForm.id}==========================
	<div class="row">
		<div class="col-lg-12">
			<h5>Employee Master Details</h5>
			<h5 style="color: green;">${message}</h5>
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-6">
						<div class="form-group" style="margin-bottom: 0px">
							<label><spring:message text="Name" /></label>
							<form:input path="name" id="name" class="form-control" value=""></form:input>
						</div>
						<div class="form-group" style="margin-bottom: 0px">
							<label><spring:message text="Alias" /></label>
							<form:input path="alias" id="alias" class="form-control"></form:input>
						</div>
						<div class="form-group" style="margin-bottom: 0px">
							<label><spring:message text="ProofAttachment" /></label>
							<form:input path="proofAttachment" id="proofAttachment"
								class="form-control" />
						</div>
						<div class="form-group" style="margin-bottom: 0px">
							<label><spring:message text="DepartmentCode" /></label><br>
							<form:select id="select" path="departmentCode" itemValue="departmentCode">
								<form:option value="-" label="--Select Department--" />
								<form:options items="${departmentCodesMap}" />
							</form:select>
						</div>
					</div>
					<div class="col-lg-6">

						<div class="form-group" style="margin-bottom: 0px">
							<label><spring:message text="code" /></label>
							<form:input path="code" id="code" class="form-control" />
						</div>

						<div class="form-group" style="margin-bottom: 0px">
							<label><spring:message text="DateOfJoining" /></label>
							<form:input path="dateOfJoining" id="dateOfJoining"
								class="form-control" />
						</div>

						<div class="form-group" style="margin-bottom: 0px">
							<label><spring:message text="PhotoAttachment" /></label>
							<form:input path="photoAttachment" id="photoAttachment"
								class="form-control" />
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<div class="col-lg-12">
		<div class="row">
			<c:choose>
				<c:when test="${employeeMasterURL == 'employee/save'}">
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
