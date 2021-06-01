<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="html" tagdir="/WEB-INF/tags/html"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ attribute name="accountDetailsForm" required="true"%>

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
<form:form id="accountMasterDetailsForm"
	modelAttribute="accountMasterForm" action="${pageContext.request.contextPath}/master/${accountMasterURL}"
	method="POST" onsubmit="return validateform()">
	
	===========ID==${accountMasterForm.id}==========================
	<div class="row">
		<div class="col-lg-12">
			<h5>Account Master Details</h5>
			<h5 style="color: green;">${message}</h5>
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-6">
						<div class="form-group" style="margin-bottom: 0px">
							<label><spring:message text="Name" /></label>
							<form:input path="name" id="name" class="form-control"></form:input>
						</div>
						<div class="form-group" style="margin-bottom: 0px">
							<label><spring:message text="Alias" /></label>
							<form:input path="alias" id="alias" class="form-control"></form:input>
						</div>
						<div class="form-group" style="margin-bottom: 0px">
							<label><spring:message text="emailID" /></label>
							<form:input path="emailid" id="emailID" class="form-control" />
						</div>
						<div class="form-group" style="margin-bottom: 0px">
							<label><spring:message text="code" /></label>
							<form:input path="code" id="code" class="form-control" />
						</div>
						<div class="form-group" style="margin-bottom: 0px">
							<label><spring:message text="typeOfCustomer" /></label><br>
							<form:select id="select" path="typeofcustomer">
								<form:option value="-" label="--Select Role--" />
								<form:options items="${typesOfCustomersMap}" />
							</form:select>
						</div>

						<div class="form-group" style="margin-bottom: 0px">
							<label><spring:message text="billingAddress" /></label>
							<form:input path="billingaddress" id="billingAddress"
								class="form-control" />
						</div>

						<div class="form-group" style="margin-bottom: 0px">
							<label><spring:message text="deliveryAddress" /></label>
							<form:input path="deliveryaddress" id="deliveryAddress"
								class="form-control" />
						</div>

						<div class="form-group" style="margin-bottom: 0px">
							<label><spring:message text="locality" /></label>
							<form:input path="locality" id="locality" class="form-control" />
						</div>
					</div>
					<div class="col-lg-6">

						<div class="form-group" style="margin-bottom: 0px">
							<label><spring:message text="PANNumber" /></label>
							<form:input path="pannumber" id="PANNumber" class="form-control" />
						</div>

						<div class="form-group" style="margin-bottom: 0px">
							<label><spring:message text="state" /></label>
							<form:input path="state" id="state" class="form-control" />
						</div>

						<div class="form-group" style="margin-bottom: 0px">
							<label><spring:message text="phoneNumber" /></label>
							<form:input path="phonenumber" id="phoneNumber"
								class="form-control" />
						</div>


						<div class="form-group" style="margin-bottom: 0px">
							<label><spring:message text="TIN" /></label>
							<form:input path="tin" id="TIN" class="form-control" />
						</div>


						<div class="form-group" style="margin-bottom: 0px">
							<label><spring:message text="contactPerson" /></label>
							<form:input path="contactperson" id="contactPerson"
								class="form-control" />
						</div>


						<div class="form-group" style="margin-bottom: 0px">
							<label><spring:message text="contactPersonMobileNumber" /></label>
							<form:input path="contactpersonmobilenumber"
								id="contactPersonMobileNumber" class="form-control" />
						</div>

						<div class="form-group" style="margin-bottom: 0px">
							<label><spring:message text="contactPersonEmailID" /></label>
							<form:input path="contactpersonemailid" id="contactPersonEmailID"
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
				<c:when test="${accountMasterURL == 'account/save'}">
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
