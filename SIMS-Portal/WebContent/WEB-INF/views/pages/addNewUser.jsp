<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="html" tagdir="/WEB-INF/tags/html"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<head>
<script type="text/javascript">
	function getSelectedTextValue(select) {
		var selectedValue = select.value;
		if (selectedValue == 'Sales Executive') {
			$("#seid").css("display", "block");
			$("#role").css("display", "block");
		} else if ((selectedValue == 'Business Head') || (selectedValue == 'MIS') || (selectedValue == 'Admin')) {
			$("#role").css("display", "none");
			$("#seid").css("display", "none");
		} else {

			$("#seid").css("display", "none");
			$("#role").css("display", "block");

		}
	}

	function validateform() {
		var number = document.getElementById("phone").value;
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
		}
	}
</script>
</head>
<body>
	<c:url value="saveuser" var="saveuser" />

	<form:form id="loginForm1" modelAttribute="userDetails"  action="${saveuser}"
		onsubmit="return validateform()">
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">Add New User</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-5">
								<h5 style="color: red">${msg}</h5>
								<%--  ${success} --%>

								<div class="form-group" style="margin-bottom: 0px">
									<label>User ID</label>
									<form:input path="userId" class="form-control" value=""></form:input>
								</div>
								<div class="form-group" style="margin-bottom: 0px">
									<label>User Name</label>
									<form:input path="name" id="name" class="form-control"></form:input>
								</div>
								<div class="form-group" style="margin-bottom: 0px">
									<label>Email</label>
									<form:input path="email" id="email" class="form-control" />
								</div>
								<div class="form-group" style="margin-bottom: 0px">
									<label>Phone Number</label>
									<form:input path="phone" id="phone" maxlength="10"
										class="form-control" />
								</div>
								<div class="form-group" style="margin-bottom: 0px">
									<label>Select User Role</label><br>
									<form:select id="select" path="roleName" style="width:200px"
										onchange="getSelectedTextValue(this)">
										<form:option value="-" label="--Select Role--" />
										<form:options items="${rolesMap}" />
									</form:select>
								</div>
								
								<c:if test="${role=='Sales Executive'}">
								
								<div id="seid" class="form-group"
									 margin-bottom: 0px">
									<label>Sales Executive Code</label>
									<form:input path="salesExecode" class="form-control" />
								</div>
								<div id="role" class="form-group"
									 margin-bottom: 0px; margin-bottom: 0px">
									<label>Manager ID</label>
									<form:input path="managerID" class="form-control" />
								</div>
								</c:if>
								
								<c:if test="${role=='Area Head'}">
									<div id="role" class="form-group"
									 margin-bottom: 0px; margin-bottom: 0px">
									<label>Manager ID</label>
									<form:input path="managerID" class="form-control" />
								</div>
								</c:if>
								<c:if test="${role=='ROB Head'}">
									<div id="role" class="form-group"
									 margin-bottom: 0px; margin-bottom: 0px">
									<label>Manager ID</label>
									<form:input path="managerID" class="form-control" />
								</div>
								</c:if>
								<c:if test="${role=='Bengal Head'}">
									<div id="role" class="form-group"
									 margin-bottom: 0px; margin-bottom: 0px">
									<label>Manager ID</label>
									<form:input path="managerID" class="form-control" />
								</div>
								</c:if>
								<div id="seid" class="form-group"
									style="display: none; margin-bottom: 0px">
									<label>Sales Executive Code</label>
									<form:input path="salesExecode" class="form-control" />
								</div>
								<div id="role" class="form-group"
									style="display: none; margin-bottom: 0px; margin-bottom: 0px">
									<label>Manager ID</label>
									<form:input path="managerID" class="form-control" />
								</div>
								<div class="form-group" style="margin-bottom: 0px">
									<label>User Description</label>
									<form:input path="description" class="form-control" />
								</div>
								<br></br>

									<button type="Submit" name='action'  value='Save'	class="btn btn-success">Submit</button> &nbsp &nbsp &nbsp
											<button type="Submit"  name='action' value='cancel' class="btn btn-success">Cancel</button></td> 
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form:form>
</body>

