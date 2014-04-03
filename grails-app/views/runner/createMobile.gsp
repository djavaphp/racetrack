<%@ page import="racetrack.Runner" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="mobileMain">
		<title>Create Runner</title>
	</head>
	<body>
		<div style="margin-left: 10px;">
			<g:link controller="auth" action="home" style="float:left"><g:img dir="images" file="homeButton.png"/> </g:link>
			<div class="labelStripe">Add Runner</div>
			<g:link controller="runner" action="list" class="backBtn"><g:img dir="images" file="backBtn.png"/> </g:link>
		</div>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${runnerInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${runnerInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" action="save" controller="runner">
				<div class="formContainer">
					<g:render template="formMobile"/>
				</div>
				<div class="savecancel">
					<g:submitButton name="create" class="mobileBtn" value="Save" />
					<%--<g:link controller="runner" action="save" class="Buttonpadding"><g:img dir="images" file="save.png"/> </g:link>
				--%></div>
			</g:form>
	</body>
</html>