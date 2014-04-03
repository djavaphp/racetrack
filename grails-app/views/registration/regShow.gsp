
<%@ page import="racetrack.Registration" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="mobileMain">
		<g:set var="entityName" value="${message(code: 'registration.label', default: 'Registration')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	<div style="margin-left: 10px;">
			<g:link controller="auth" action="home" style="float:left"><g:img dir="images" file="homeButton.png"/> </g:link>
			<div class="labelStripe marleft125">Show Registration</div>
			<g:link controller="registration" action="list" class="backBtn"><g:img dir="images" file="backBtn.png"/> </g:link>
		</div>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
		<ol class="property-list registration">
			
			<g:if test="${registrationInstance?.race}">
				<div>
					<div style="width: 0%; float: left; text-align: right;">
						<label for="race"> <span class="required-indicator"></span>
							<g:message code="registration.race.label" default="Race" />
						</label>
					</div>
					<div
						class=" ${hasErrors(bean: registrationInstance, field: '"race"', 'error')} required"
						style="width: 75%; float: right; text-align: right; color:white;padding-top:15px;">
						<g:fieldValue bean="${registrationInstance.race}" field="name" />
					</div>
					<div class="clearfix"></div>
				</div>
			</g:if>
			
			<g:if test="${registrationInstance?.runner}">
			<div class="clearfix"></div>
				<div>
					<div style="width: 0%; float: left; text-align: right;">
						<label for="runner"> <span class="required-indicator"></span>
							<g:message code="registration.runner.label" default="Runner" />
						</label>
					</div>
					<div
						class=" ${hasErrors(bean: registrationInstance, field: '"runner"', 'error')} required"
						style="width: 75%; float: right; text-align: right; color:white;padding-top:15px;">
						<g:fieldValue bean="${registrationInstance}" field="runner" />
					</div>
					<div class="clearfix"></div>
				</div>
			</g:if>			
			</ol>
			<g:form>
				<div class="updateDelete">
					<g:hiddenField name="id" value="${registrationInstance?.id}" />
					<g:link class="" action="edit" id="${registrationInstance?.id}"><g:img dir="images" file="edit.png" style="padding-left:275px;width:75px"/></g:link>
					<g:actionSubmit class="mobileBtn fr" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</div>
			</g:form>
			</div>
	</body>
</html>
