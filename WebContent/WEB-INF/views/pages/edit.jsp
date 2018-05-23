
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
			$("#managerId").css("display", "none");
			$("#salesExecode").css("display", "none");

		} else if ((selectedValue == 'Business Head')
				|| (selectedValue == 'MIS') || (selectedValue == 'Admin')) {
			$("#role").css("display", "none");
			$("#seid").css("display", "none");
			$("#salesExecode").css("display", "none");

		} else if ((selectedValue == 'ROB Head')
				|| (selectedValue == 'Bengal Head')
				|| (selectedValue == 'Area Head')) {
			$("#role").css("display", "block");
			$("#seid").css("display", "none");
			$("#managerId").css("display", "none");
			$("#salesExecode").css("display", "none");
		} else {

			$("#seid").css("display", "none");
			$("#role").css("display", "block");
			$("#managerId").css("display", "none");

		}
	}
</script>
</head>
<body>
	<form:form id="loginForm2" action="search" modelAttribute="userDetails">
		<div class="input-group custom-search-form">
			<table>
				<tr>
					<td><input type="text" name="userId" id="userId"
						style="width: 200px" class="form-control"
						placeholder="Please Enter User id"></td>
					<td>&nbsp&nbsp <input type="submit" value="Search" /></td>
				</tr>
			</table>

		</div>
	</form:form>
	
	<div class="row">
		<c:if test="${!empty userdetails}">
			<div class="col-lg-6" style="width: 100%">
				<div class="panel panel-default">
					<div class="panel-heading">Edit or Delete User</div>
					<!-- /.panel-heading -->
					<h5 style="color: red">${msg}</h5>
					<div class="panel-body">
						<div class="table-responsive">
							<spring:message code="test.adminUrl" var="url" />
							<c:forEach begin="1" end="${maxpages}" varStatus="loop">
								<a href="${url}/edit/${loop.current}">${loop.current}</a>
							</c:forEach>

							<table style="overflow: scroll; width: 400px"
								class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<thead>
									<tr>
										<spring:message code="edit.userid" var="userid" />
										<th>${userid}</th>
										<spring:message code="edit.userName" var="userName" />
										<th>${userName}</th>
										<spring:message code="edit.email" var="email" />
										<th>${email}</th>
										<spring:message code="edit.ph" var="ph" />
										<th>${ph}</th>
										<spring:message code="edit.se" var="se" />
										<th>${se}</th>
										<spring:message code="edit.des" var="des" />
										<th>${des}</th>
										<spring:message code="edit.roleNm" var="roleNm" />
										<th>${roleNm}</th>
										<spring:message code="edit.managerId" var="managerId" />
										<th>${managerId}</th>
										<spring:message code="edit.alternativie" var="alternativie" />
										<th>${alternativie}</th>
										<spring:message code="edit.activeflag" var="activeflag" />
										<th>${activeflag}</th>
										<spring:message code="edit.action" var="action" />
										<th>${action}</th>
										<!-- <th>UserID</th>
										<th>UserName</th>
										<th>Email</th>
										<th>PhoneNumber</th>
										<th>SalesExecode</th>
										<th>Description</th>
										<th>RoleName</th>
										<th>ManagerID</th>
										<th>alternativeEmp</th>
										<th>activeFlag</th>
										<th>Action</th> -->
									</tr>
								</thead>
								<c:forEach items="${userdetails}" var="userdetails">

									<tr class="odd gradeX">
										<td>${userdetails.userId}</td>
										<td>${userdetails.name}</td>
										<td>${userdetails.email}</td>
										<td>${userdetails.phone}</td>
										<td>${userdetails.salesExecode}</td>
										<td>${userdetails.description}</td>
										<td>${userdetails.roleName}</td>
										<td>${userdetails.managerID}</td>
										<td>${userdetails.alternativeEmp}</td>
										<td>${userdetails.activeFlag}</td>
										<td align="center">
											<%-- <href="/AbpProject/manager/adhocRequest/approve?requestId=${requestBean.requestId}">Approve</a> --%>
											<a href="${url}/editUserdetails?userId=${userdetails.userId}">Edit</a>
											| <a href="${url}/delete?userId=${userdetails.userId}"
											onclick="javascript:return confirm('Are you sure to delate?')">Delete</a>|
											<c:if test="${userdetails.alternativeEmp==0}">
												<a
													href="${url}/assignedAlternative?userId=${userdetails.userId}">AssignedAlternative</a>
											</c:if> <c:if test="${userdetails.alternativeEmp!=0}">
												<a
													href="${url}/unassinedAlternative?userId=${userdetails.userId}">UnAssignAlternative</a>
											</c:if>

										</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
							<a href="edit">Show All </a>
							</li>
		</c:if>
		<c:if test="${!empty updateUserdetails}">
			<form:form id="editForm" action="update"
				modelAttribute="updateUserdetails">
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">Please Enter User Details</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-6">
										<form role="form">
											${success}
											<div class="form-group">
												<spring:message code="edit.employeId" var="employeId" />
												<label>${employeId}</label> <input type="text" name="userId"
													id="userId" value="${updateUserdetails.userId}"
													readonly="true" class="form-control">
											</div>
											<div class="form-group">
												<spring:message code="edit.emplyename" var="employename" />
												<label> ${employename}</label> <input type="text"
													name="name" id="name" value="${updateUserdetails.name}"
													class="form-control" placeholder="Please Enter User Name">
											</div>
											<div class="form-group">
												<spring:message code="edit.emailID" var="emailID" />
												<label>${emailID}</label> <input type="text" name="email"
													id="email" value="${updateUserdetails.email}"
													class="form-control" placeholder="Please Enter Email">
											</div>
											<div class="form-group">
												<spring:message code="edit.ph" var="ph" />

												<label>${ph} </label><input type="text" name="phone" maxlength="10"
													id="phone" value="${updateUserdetails.phone}"
													class="form-control" placeholder="Please Enter PhoneNumber">
											</div>
											
											<div class="form-group">
												<label>User Role </label><br>
												<form:select path="roleName" style="width:180px"
													onchange="getSelectedTextValue(this)">
													<form:options items="${rolesMap}" />
												</form:select>
											</div>

											<c:if
												test="${(updateUserdetails.salesExecode!='')&&(updateUserdetails.roleName != 'Bengal Head')&&(updateUserdetails.roleName != 'Area Head')&&(updateUserdetails.roleName != 'ROB Head')}">
												<div id="salesExecode" class="form-group" maxlength="3"
													style="display: block;">
													<label>Sales Executive Code </label>
													<form:input path="salesExecode" class="form-control" />
													<form:errors path="description" cssClass="error" />
												</div>
											</c:if>
											<c:if test="${updateUserdetails.managerID!=0}">
												<div id="managerId" class="form-group"
													style="margin-bottom: 0px; display: block">
													<spring:message code="edit.managerId" var="managerId" />
													<label>${managerId} </label>
													<form:input path="managerID" class="form-control" />
													<form:errors path="managerID" cssClass="error" />
												</div>
											</c:if>
											<div id="seid" class="form-group"
												style="display: none; margin-bottom: 0px">
												<label>Sales Execute Code</label>
												<input type="text"  name="salesExecode" value="${updateUserdetails.salesExecode}" class="form-control" />
												<form:errors path="description" cssClass="error" />
											</div>
											<div id="role" class="form-group"
												style="margin-bottom: 0px; display: none;">
												<label>Manager ID</label>
												<form:input path="managerID" class="form-control" />
											</div>
											<div class="form-group">
												<spring:message code="edit.description" var="description" />
												<label>Description </label>
												<form:input path="description" class="form-control" />
												<form:errors path="description" cssClass="error" />
											</div>											
											<td><button type="submit" name='action'  value='Save'	class="btn btn-success">Submit</button>
											<button type="submit"  name='action' value='Cancel' class="btn btn-success">Cancel</button></td> 
			</form:form>
		</c:if>
		<c:if test="${assign=='assign'}">
			<form:form
				action="./modifyuser?${_csrf.parameterName}=${_csrf.token}"
				modelAttribute="userDetails">
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">Assign Alternative User</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-6">
										<form role="form">
											${success}
											<div class="form-group">
												<label>User ID</label> <input type="text" name="userId"
													id="userId" value="${assigndetails.userId}"
													class="form-control">
											</div>
											<div class="form-group">
												<label>Alternavtive User ID</label> <input type="text"
													name="alternativeEmp" id="alternativeEmp"
													value="${assigndetails.alternativeEmp}"
													class="form-control" placeholder="Please Enter User Name">
											</div>
										</form>
									<td><button type="submit" name='action'  value='Save'	class="btn btn-success">Submit</button>
											<button type="submit"  name='action' value='Cancel' class="btn btn-success">Cancel</button></td>
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



