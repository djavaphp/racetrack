
<%@ page import="racetrack.Runner" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="mobileMain">
		<g:set var="entityName" value="${message(code: 'runner.label', default: 'Runner')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div style="margin-left: 10px;">
			<g:link controller="auth" action="home" style="float:left"><g:img dir="images" file="homeButton.png"/> </g:link>
			<div class="labelStripe">Show Runner</div>
			<g:link controller="runner" action="list" class="backBtn"><g:img dir="images" file="backBtn.png"/> </g:link>
		</div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list runner">
			
			<g:if test="${runnerInstance?.firstName}">
				<div>
					<div style="width: 0%; float: left; text-align: right;">
						<label for="firstName"> <span class="required-indicator"></span>
							<g:message code="runner.firstName.label" default="firstName: " />
						</label>
					</div>
					<div
						class=" ${hasErrors(bean: raceInstance, field: 'firstName', 'error')} required"
						style="width: 75%; float: right; text-align: right; color:white; padding-top:15px;">
						<g:fieldValue bean="${runnerInstance}" field="firstName" />
					</div>
					<div class="clearfix"></div>
				</div>
			</g:if>
			
			
			<g:if test="${runnerInstance?.lastName}">
			<div class="clearfix"></div>
				<div>
					<div style="width: 0%; float: left; text-align: right;">
						<label for="lastName"> <span class="required-indicator"></span>
							<g:message code="runner.lastName.label" default="lastName: " />
						</label>
					</div>
					<div
						class=" ${hasErrors(bean: raceInstance, field: 'lastName', 'error')} required"
						style="width: 75%; float: right; text-align: right; color:white; padding-top:15px;">
						<g:fieldValue bean="${runnerInstance}" field="lastName" />
					</div>
					<div class="clearfix"></div>
				</div>
			</g:if>
			
			<g:if test="${runnerInstance?.gender}">
			<div class="clearfix"></div>
				<div>
					<div style="width: 0%; float: left; text-align: right;">
						<label for="gender"> <span class="required-indicator"></span>
							<g:message code="runner.gender.label" default="gender: " />
						</label>
					</div>
					<div
						class=" ${hasErrors(bean: raceInstance, field: 'gender', 'error')} required"
						style="width: 75%; float: right; text-align: right; color:white; padding-top:15px;">
						<g:fieldValue bean="${runnerInstance}" field="gender" />
					</div>
					<div class="clearfix"></div>
				</div>
			</g:if>
			
			<g:if test="${runnerInstance?.address}">
			<div class="clearfix"></div>
				<div>
					<div style="width: 0%; float: left; text-align: right;">
						<label for="address"> <span class="required-indicator"></span>
							<g:message code="runner.address.label" default="address: " />
						</label>
					</div>
					<div
						class=" ${hasErrors(bean: raceInstance, field: 'address', 'error')} required"
						style="width: 75%; float: right; text-align: right; color:white; padding-top:15px;">
						<g:fieldValue bean="${runnerInstance}" field="address" />
					</div>
					<div class="clearfix"></div>
				</div>
			</g:if>
			
			<g:if test="${runnerInstance?.city}">
			<div class="clearfix"></div>
				<div>
					<div style="width: 0%; float: left; text-align: right;">
						<label for="city"> <span class="required-indicator"></span>
							<g:message code="runner.city.label" default="city: " />
						</label>
					</div>
					<div
						class=" ${hasErrors(bean: raceInstance, field: 'city', 'error')} required"
						style="width: 75%; float: right; text-align: right; color:white; padding-top:15px;">
						<g:fieldValue bean="${runnerInstance}" field="city" />
					</div>
					<div class="clearfix"></div>
				</div>
			</g:if>
			
			<g:if test="${runnerInstance?.state}">
			<div class="clearfix"></div>
				<div>
					<div style="width: 0%; float: left; text-align: right;">
						<label for="state"> <span class="required-indicator"></span>
							<g:message code="runner.state.label" default="state: " />
						</label>
					</div>
					<div
						class=" ${hasErrors(bean: raceInstance, field: 'state', 'error')} required"
						style="width: 75%; float: right; text-align: right; color:white; padding-top:15px;">
						<g:fieldValue bean="${runnerInstance}" field="state" />
					</div>
					<div class="clearfix"></div>
				</div>
			</g:if>
		</ol>
			<g:form>
				<div class="updateDelete">
					<g:hiddenField name="id" value="${runnerInstance?.id}" />
					<g:link class="" action="edit" id="${runnerInstance?.id}"><g:img dir="images" file="edit.png" style="padding-left:275px;width:75px"/></g:link>
					<g:actionSubmit class="mobileBtn fr" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</div>
			</g:form>
	</body>
</html>
