<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="html" tagdir="/WEB-INF/tags/html"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

	<c:url value="saveuser" var="saveuser" />
	<div class="login-body">
	<form:form id="loginForm1" modelAttribute="changepasswrod" action="changepassword">
		<div class="row">
			<div class="col-lg-6" style="width: 500px">
				<div class="panel panel-default">
					<div class="panel-heading">ChangePassword</div>


					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="table-responsive">
							<h5 style="color: red">${msg}</h5>
						
								<label>Please Enter New Password</label>
							&nbsp&nbsp&nbsp&nbsp&nbsp	<input type='password' name='password'>
								<%-- <form:password path="password" class="form-control"></form:input> --%>

							
						
								<label>Please Re-Enter New Password</label>
							 <input type='password' name='changePassword'>
								<%-- <form:password  path="changePassword" id="name" class="form-control"></form:input> --%>

									<button type="submit" class="btn btn-success">Submit</button>
							
						</div>
					</div>
				</div>
			</div>
		</div>
		</form:form>
		</div>
		
		
		
	</