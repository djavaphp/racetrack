<%@ page import="racetrack.Registration" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="mobileMain">
		<g:set var="entityName" value="${message(code: 'registration.label', default: 'Registration')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
	<div style="margin-left: 10px;">
			<g:link controller="auth" action="home" style="float:left"><g:img dir="images" file="homeButton.png"/> </g:link>
			<div class="labelStripe marleft125">Create Registration</div>
			<g:link controller="registration" action="list" class="backBtn"><g:img dir="images" file="backBtn.png"/> </g:link>
		</div>
		<a href="#create-registration" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
			<g:hasErrors bean="${registrationInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${registrationInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" action="save" controller="registration">
				<div class="formContainer">
					<g:render template="regForm"/>
				</div>
				<div class="savecancel">
					<g:submitButton name="create" class="mobileBtn" value="Save" />
					<%--<g:link controller="runner" action="save" class="Buttonpadding"><g:img dir="images" file="save.png"/> </g:link>
				--%></div>
			</g:form>
			<%--<g:form action="save" >
				<div class="formContainer">
					<g:render template="regForm"/>
				</div>
				
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		--%></div>
	</body>
</html>
