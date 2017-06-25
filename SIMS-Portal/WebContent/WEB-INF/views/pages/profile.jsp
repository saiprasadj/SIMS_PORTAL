
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="html" tagdir="/WEB-INF/tags/html"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<body>
<c:if test="${!empty updateUserdetails}">
		<form:form id="profile" action="profile" modelAttribute="userDetails">
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">Profile</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-6">
									<form role="form">

										<div class="form-group"  style="margin-bottom:0px">
											<label>User Id</label> <input type="text" name="userId"
												id="userId" value="${updateUserdetails.userId}"
												readonly="true" disabled="disabled" class="form-control">
										</div>
										<div class="form-group"  style="margin-bottom:0px">
											<label>User Name</label> <input type="text" name="name"
												id="name" value="${updateUserdetails.name}"
												class="form-control" readonly="true" disabled="disabled">
										</div>
										<div class="form-group"  style="margin-bottom:0px">
											<label>Email</label> <input type="text" name="email"
												id="email" value="${updateUserdetails.email}"
												class="form-control" readonly="true" disabled="disabled"
												placeholder="Please Enter Email">
										</div>
										<div class="form-group"  style="margin-bottom:0px">
											<label>Phone</label><input type="text" name="phone"
												id="phone" value="${updateUserdetails.phone}"
												class="form-control" readonly="true" disabled="disabled">
										</div>
											<c:if test="${updateUserdetails.salesExecode!=''}">
										<div class="form-group"  style="margin-bottom:0px">
											<label>Sales Executive Code</label><input type="text"
												name="salesExecode"
												value="${updateUserdetails.salesExecode}" id="salesExecode"
												readonly="true" disabled="disabled" class="form-control">
										</div>
										</c:if>
										<c:if test="${updateUserdetails.managerID!=0}">

										<div class="form-group"  style="margin-bottom:0px">
											<label>Manager ID</label><input type="text" name="managerID" min="1" max="5"
												value="${updateUserdetails.managerID}" id="managerID"
												readonly="true" disabled="disabled" class="form-control">
										</div>
										</c:if>
										<div class="form-group"  style="margin-bottom:0px">
											<label>Role Name</label><input type="text" name="roleName"
												value="${updateUserdetails.roleName}" id="roleName"
												readonly="true" disabled="disabled" class="form-control">
										</div>

										<div class="form-group"  style="margin-bottom:0px">
											<label>Description</label><input type="text"
												name="description" value="${updateUserdetails.description}"
												id="description" readonly="true" disabled="disabled"
												class="form-control">
										</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form:form>
	</c:if>
	</div>
</body>

