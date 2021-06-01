<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="html" tagdir="/WEB-INF/tags/html"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<div class="row">
	<div class="col-lg-6" style="width: 100%">
		<div class="panel panel-default">
			<div class="panel-heading">Unsold Assign</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="table-responsive">
					<spring:message code="test.adminUrl" var="url" />


					<c:forEach begin="1" end="${maxpages}" varStatus="loop">
						<a href="${url}/percentage/${loop.current}">${loop.current}</a>
					</c:forEach>
					<br> <br>
					<spring:message code="percentage.addnewrow.text" var="addNewRow" />
					<c:url value="add" var="add" />
					<a href="${url}/addUnsoldRolw">Add New Row</a>


					<spring:message code="percentage.min.text" var="minPercenatage" />
					<form:form id="loginForm1" action="${url}/saveUnsoleAssign"
						modelAttribute="unsoldAssing">
						<h5 style="color: red">${message}<h5>
								<table style="overflow: scroll; width: 400px"
									class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th>Role Name</th>
											<th>Diff-Month</th>
											<th>Description</th>
											<spring:message code="percentage.edit.text" var="edit" />
											<th>${edit}</th>
											<spring:message code="percentage.save.text" var="save" />
											<th>${save}</th>
										</tr>
									</thead>
									<c:forEach items="${unsoldAssing}" var="unsoldAssing">
										<c:if test="${unsoldAssing.editble == true}">
											<td>
												<%--  <input style="width: 200px" type="text" name="role_name"
													id="min" value="${unsoldAssing.role_name}" />  --%>
													  <form:select id="select" path="role_name"
													style="width:200px">
													<form:option value="-" label="--Select Role--" />
													<form:options items="${rolesMap}" />
												</form:select>
										</td>

											<td><input style="width: 100px" type="text"
												name="diff_month" id="max"
												value="${unsoldAssing.diff_month}" /></td>
											<td><input style="width: 100px" type="text" name="des"
												id="des" value="${unsoldAssing.des}" /></td>
											<td><a href="editUnsoldAssign?id=${unsoldAssing.id}">Edit</a>
												| <a href="deleteUnsoldAssign?id=${unsoldAssing.id}">Delete</a>

											</td>
											</td>
											<!-- <td>	<button type="submit" class="btn btn-success">Submit</button></td> -->
										</c:if>
										<c:if test="${unsoldAssing.editble == false}">
											<td style="width: 200px">${unsoldAssing.role_name}</td>
											<td style="width: 200px">${unsoldAssing.diff_month}</td>
											<td style="width: 200px">${unsoldAssing.des}</td>
											<td style="width: 200px"><a
												href="editUnsoldAssign?id=${unsoldAssing.id}">Edit</a> | <a
												href="deleteUnsoldAssign?id=${unsoldAssing.id}">Delete</a></td>
										</c:if>
										<td>
											<button type="submit" class="btn btn-success">Submit</button>
										</td>

										</tr>
									</c:forEach>
									</tbody>
								</table>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>
</div>


