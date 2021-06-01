<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="html" tagdir="/WEB-INF/tags/html"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<form:form id="loginForm1" action="saveclassification"
	modelAttribute="classificationBean">
	<div class="row">
		<div class="col-lg-6" style="width: 100%">
			<div class="panel panel-default">
				<div class="panel-heading">Agent Classification</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<div class="table-responsive">
						<spring:message code="classification.addNewRow.text" var="add" />
						<spring:message code="test.adminUrl" var="url" />
						<c:forEach begin="1" end="${maxpages}" varStatus="loop">
							<a href="${url}/classification/${loop.current}">${loop.current}</a>
						</c:forEach>

						<br> <br> <a href="${url}/addClassification">${add}</a><br>
						<br>

						<h5 style="color: red; size: 10px">${message}</h5>
						<table style="overflow: scroll; width: 400px"
							class="table table-striped table-bordered table-hover"
							id="dataTables-example">
							<thead>
								<tr>
									<spring:message code="classification.pub.text"
										var="publication" />
									<th>${publication}</th>
									<spring:message code="classification.min.text" var="min" />
									<th>${min}</th>
									<spring:message code="classification.max.text" var="max" />
									<th>${max}</th>
									<spring:message code="classification.classification.text"
										var="edit" />
									<th>${edit}</th>
									<spring:message code="classification.edit.text" var="edit" />
									<th>Action</th>
									<%-- <spring:message code="classification.save.text" var="save" />
									<th>Action</th> --%>

								</tr>
							</thead>

							<c:forEach items="${classification}" var="cls">

								<c:if test="${cls.editble == true}">
									<tr class="odd gradeX">
										<td><form:select id="publicationName"
												path="publicationName" style="width:70px">
												<form:options items="${publications}" />
											</form:select></td>

										<td><input style="width: 50px" type="text" name="min"
											id="min" value="${cls.min}" /></td>
										<td><input style="width: 50px" type="text" name="max"
											id="max" value="${cls.max}" /></td>
										<td><form:select id="classification"
												path="classification" style="width:50px">
												<form:options items="${classifications}" />
											</form:select></td>
																			
										<td><button type="submit" name='action' value='Save'
												class="btn btn-success">Submit</button>
											<br></br>
											<button type="submit" name='action' value='Cancel'
												class="btn btn-success">Cancel</button></td>


									</tr>
								</c:if>
								<c:if test="${cls.editble == false}">
									<tr class="odd gradeX">
										<td>${cls.publicationName}</td>
										<td>${cls.min}
										
										<td>${cls.max}</td>
										<td>${cls.classification}</td>
										<td><a href="${url}/classificationEdit?id=${cls.id}">Edit</a>
											|| <a href="${url}/deleteclassification?id=${cls.id}" onclick="return confirm('Are you sure to delate?')">Delete</a></td>
										<!-- <td>
											<button type="submit" value='Save' disabled	class="btn btn-success">Submit</button><br></br>
											<button type="submit" value='Cancel'  disabled class="btn btn-success">Cancel</button></td> 
										</td> -->
									</tr>
								</c:if>

							</c:forEach>
							</tbody>
						</table>
						<%-- 	<button type="submit" class="btn btn-success">Submit</button> --%>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
</form:form>
