<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="html" tagdir="/WEB-INF/tags/html"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ attribute name="productDetailsForm" required="true"%>

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
<form:form id="productMasterDetailsForm"
	modelAttribute="productMasterForm"
	action="${pageContext.request.contextPath}/master/${productMasterURL}"
	method="POST" onsubmit="return validateform()">
	
	===========ID==${productMasterForm.id}==========================
	<div class="row">
		<div class="col-lg-12">
			<h5>Product Master Details</h5>
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
							<label><spring:message text="BuyingPrice" /></label>
							<form:input path="buyingPrice" id="buyingPrice" class="form-control" />
						</div>
						<div class="form-group" style="margin-bottom: 0px">
							<label><spring:message text="SellingPrice" /></label>
							<form:input path="sellingPrice" id="sellingPrice"
								class="form-control" />
						</div>
					</div>
					<div class="col-lg-6">
						
						<div class="form-group" style="margin-bottom: 0px">
							<label><spring:message text="code" /></label>
							<form:input path="code" id="code" class="form-control" />
						</div>

						<div class="form-group" style="margin-bottom: 0px">
							<label><spring:message text="UOM" /></label>
							<form:input path="uom" id="uom" class="form-control" />
						</div>

						<div class="form-group" style="margin-bottom: 0px">
							<label><spring:message text="Reorder Level" /></label>
							<form:input path="reorderLevel" id="reorderLevel"
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
				<c:when test="${productMasterURL == 'product/save'}">
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
