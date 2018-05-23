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
			<div class="panel-heading">Adhoc Percentage</div>
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
					<a href="${url}/${add}">${addNewRow}</a>


					<spring:message code="percentage.min.text" var="minPercenatage" />
					<form:form id="loginForm1" action="${url}/savePercentage"
						modelAttribute="percentage">
						<h5 style="color: red">${msg}</h5>
								<table style="overflow: scroll; width: 400px"
									class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<spring:message code="percentage.min.text"
												var="minPercenatage" />
											<th>${minPercenatage}</th>
											<spring:message code="percentage.max.text"
												var="maxPercenatage" />
											<th>${maxPercenatage}</th>
											<spring:message code="percentage.classification.text"
												var="classification" />
											<th>${classification}</th>
											<spring:message code="percentage.role.text" var="role" />
											<th>${role}</th>
											<spring:message code="percentage.edit.text" var="edit" />
											<th>Action</th>
											<spring:message code="percentage.save.text" var="save" />
											<!-- <th>Action</th> -->
										</tr>
									</thead>
									<c:forEach items="${percentageList}" var="percentage">
										<c:if test="${percentage.editble == true}">
										<tr>
											<td><input style="width: 50px" type="text" name="min"
												id="min" value="${percentage.min}" /></td>
											<td><input style="width: 60px" type="text" name="max"
												id="max" value="${percentage.max}" /></td>
											<td><form:select id="classification"
													path="classification" style="width:70px">
													<form:options items="${classifications}" />
												</form:select></td>
											<td><form:select id="roleName" path="roleName"
													style="width:180px">
													<form:options items="${rolesMap}" />
												</form:select></td>
											<td><button type="submit" name='action'  value='Save'	class="btn btn-success">Submit</button><br></br>
											<button type="submit"  name='action' value='Cancel' class="btn btn-success">Cancel</button></td> 


                                               </tr>

											<!-- <td>	<button type="submit" class="btn btn-success">Submit</button></td> -->
										</c:if>
										<c:if test="${percentage.editble == false}">
										<tr>
											<td>${percentage.min}</td>
											<td>${percentage.max}</td>
											<td>${percentage.classification}</td>
											<td>${percentage.roleName}</td>
											<td><a href="${url}/editPercentage?id=${percentage.id}">Edit</a>
												| <a href="${url}/deletePercentage?id=${percentage.id}"
												onclick="return confirm('Are you sure to delate?')">Delete</a>

											</td>
											
											
											<!-- <button type="submit" value='Save' disabled	class="btn btn-success">Submit</button><br></br>
											<button type="submit" value='Cancel'  disabled class="btn btn-success">Cancel</button></td>  -->
											</tr>
											
										</c:if>																		
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


