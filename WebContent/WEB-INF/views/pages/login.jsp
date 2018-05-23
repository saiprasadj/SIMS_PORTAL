<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="html" tagdir="/WEB-INF/tags/html"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<div class="login-body">
	<article class="container-login center-block">
		<section>
			<ul id="top-bar" class="nav nav-tabs nav-justified">
				<li class="active"><a data-toggle="tab" href="#login-access">
						<h5 class="hidden-sm-up">
							<i class="fa fa-sign-in"></i>
						</h5>
						<h6 class="form-header hidden-xs-down">
							<i class="fa fa-sign-in"></i>&nbsp;
							<spring:message code="login.heading.text" />
						</h6>
						<h6>${msg}</h6>
				</a></li>
				<li><a data-toggle="tab" href="#forgot-password">
						<h5 class="hidden-sm-up">
							<i class="fa fa-key"></i>
						</h5>
						<h6 class="form-header hidden-xs-down">
							<i class="fa fa-key"></i>&nbsp;
							<spring:message code="forgot.password.heading.text" />
						</h6>
				</a></li>
			</ul>
			<div
				class="tab-content tabs-login col-lg-12 col-md-12 col-sm-12 cols-xs-12">
				<div id="login-access" class="tab-pane fade active in">
					<c:url value="processLogin" var="loginURL" />
					<%-- ===========${loginURL}================== --%>
					<html:form modelAttribute="LoginForm" id="login-form"
						formUrl="${loginURL}" ajaxValidation="true"
						ajaxValidationUrl="login/validate" cssClass="form-horizontal">
						<div class="global-errors">${error}</div>
						<div class="global-errors">${email}</div>
						<spring:message code="login.username.text" var="usernameText" />
						<html:inputText name="username" placeholder="${usernameText}"
							cssClass="form-control" />
						<spring:message code="login.password.text" var="passwordText" />
						<html:inputPassword name="password" placeholder="${passwordText}"
							cssClass="form-control" />
						<div class="form-group ">
							<button type="submit" class="btn btn-lg btn-primary">
								<spring:message code="login.submit.button.text" />
							</button>
						</div>
					</html:form>
				</div>
				<div id="forgot-password" class="tab-pane fade">
					<!-- <h6 class="form-header-xs hidden-sm-up">Forgot Password</h6> -->
					<c:url value="login/forgotpassword" var="loginforgotpassowrURL" />
					<html:form modelAttribute="LoginForm" id="login-form"
						formUrl="${loginforgotpassowrURL}" cssClass="form-horizontal">
						<div class="form-group ">
							<label for="email" class="sr-only">EnterUserID</label>
							<%-- <html:inputText name="username" placeholder="${usernameText}"
								cssClass="form-control" style="width:200px"/> --%>
								<label for="username" class="sr-only">EnterUserID</label> <input
								type="text" class="form-control" name=username id="email_value"
								placeholder="${usernameText}" tabindex="1" value="" /><br>
							<label for="email" class="sr-only">Email</label> <input
								type="text" class="form-control" name="email" id="email_value"
								placeholder="Email" tabindex="1" value="" />
						</div>
						<br />
						<div class="form-group ">
							<button type="submit" tabindex="5" class="btn btn-lg btn-primary">
								<spring:message code="forgot.password.submit.button.text" />
							</button>
						</div>
					</html:form>
				</div>
			</div>


			<%-- <html:form  modelAttribute="LoginForm" cssClass="form-horizontal">
				<div class="form-group ">
					<label for="email" class="sr-only">EnterUserID</label>
					<html:inputText name="username" placeholder="${usernameText}"
						cssClass="form-control" />
					<label for="email" class="sr-only">Email</label> <input type="text"
						class="form-control" name="email" id="email_value"
						placeholder="Email" tabindex="1" value="" />
				</div>
				<br />
				<div class="form-group ">
					<button type="submit" tabindex="5" class="btn btn-lg btn-primary">
						<spring:message code="forgot.password.submit.button.text" />
					</button>
				</div>
			</html:form>
 --%>


		</section>
	</article>
</div>