<%@ page import="racetrack.Registration" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="mobileMain">
		<title>Edit Registration</title>
	</head>
	<body>
		<div style="margin-left: 10px;">
			<g:link controller="auth" action="home" style="float:left"><g:img dir="images" file="homeButton.png"/> </g:link>
			<div class="labelStripe">Edit Runner</div>
			<g:link controller="registration" action="list" class="backBtn"><g:img dir="images" file="backBtn.png"/> </g:link>
		</div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${registrationInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${registrationInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${registrationInstance?.id}" />
				<g:hiddenField name="version" value="${registrationInstance?.version}" />
				<div class="formContainer">
					<g:render template="regForm"/>
				</div>
				<div class="clearfix"></div>
				<div class="updateDelete">
					<g:actionSubmit class="mobileBtn" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="mobileBtn fr" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</div>
			</g:form>
		</div>
	</body>
</html>
