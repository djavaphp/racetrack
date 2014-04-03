
<%@ page import="racetrack.Race"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="mobileMain">
<g:set var="entityName"
	value="${message(code: 'race.label', default: 'Race')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<div style="margin-left: 10px;">
			<g:link controller="auth" action="home" style="float:left"><g:img dir="images" file="homeButton.png"/> </g:link>
			<div class="labelStripe">Show Race</div>
			<g:link controller="race" action="list" class="backBtn"><g:img dir="images" file="backBtn.png"/> </g:link>
		</div>
		<g:if test="${flash.message}">
			<div class="message" role="status"><g:message code="flash.message" /></div>
			</g:if>
	<ol class="property-list race">
			<g:if test="${raceInstance?.name}">
				<div>
					<div style="width: 0%; float: left; text-align: right;">
						<label for="name"> <span class="required-indicator"></span>
							<g:message code="race.name.label" default="name: " />
						</label>
					</div>
					<div
						class=" ${hasErrors(bean: raceInstance, field: 'name', 'error')} required"
						style="width: 75%; float: right; text-align: right; color:white; padding-top:15px;">
						<g:fieldValue bean="${raceInstance}" field="name" />
					</div>
					<div class="clearfix"></div>
				</div>
			</g:if>
						
			<g:if test="${raceInstance?.city}">
			<div class="clearfix"></div>
				<div>
					<div style="width: 0%; float: left; text-align: right; color:red">
						<label for="city"> <span class="required-indicator"></span>
							<g:message code="race.city.label" default="city: " />
						</label>
					</div>
					<div
						class=" ${hasErrors(bean: raceInstance, field: 'city', 'error')} required"
						style="width: 75%; float: right; text-align: right; color:white; padding-top:15px;">
						<g:fieldValue bean="${raceInstance}" field="city" />
					</div>
					<div class="clearfix"></div>
				</div>
			</g:if>
			
			<g:if test="${raceInstance?.state}">
			<div class="clearfix"></div>
				<div>
					<div style="width: 0%; float: left; text-align: right; color:red">
						<label for="state"> <span class="required-indicator"></span>
							<g:message code="race.state.label" default="state: " />
						</label>
					</div>
					<div
						class=" ${hasErrors(bean: raceInstance, field: 'state', 'error')} required"
						style="width: 75%; float: right; text-align: right; color:white; padding-top:15px;">
						<g:fieldValue bean="${raceInstance}" field="state" />
					</div>
					<div class="clearfix"></div>
				</div>
			</g:if>
			
			<g:if test="${raceInstance?.distance}">
			<div class="clearfix"></div>
				<div>
					<div style="width: 0%; float: left; text-align: right; color:red">
						<label for="distance"> <span class="required-indicator"></span>
							<g:message code="race.distance.label" default="distance: " />
						</label>
					</div>
					<div class="clearfix"></div>
					<div
						class=" ${hasErrors(bean: raceInstance, field: 'distance', 'error')} required"
						style="width: 75%; float: right; text-align: right; color:white; padding-top:15px;">
						<g:fieldValue bean="${raceInstance}" field="distance" />
					</div>
					<div class="clearfix"></div>
				</div>
			</g:if>
			
			<g:if test="${raceInstance?.cost}">
			<div class="clearfix"></div>
				<div>
					<div style="width: 0%; float: left; text-align: right; color:red">
						<label for="cost"> <span class="required-indicator"></span>
							<g:message code="race.cost.label" default="cost: " />
						</label>
					</div>
					<div
						class=" ${hasErrors(bean: raceInstance, field: 'cost', 'error')} required"
						style="width: 75%; float: right; text-align: right; color:white; padding-top:15px;">
						<g:fieldValue bean="${raceInstance}" field="cost" />
					</div>
					<div class="clearfix"></div>
				</div>
			</g:if>
			
			<g:if test="${raceInstance?.maxRunners}">
			<div class="clearfix"></div>
				<div>
					<div style="width: 0%; float: left; text-align: right; color:red">
						<label for="maxRunners"> <span class="required-indicator"></span>
							<g:message code="race.maxRunners.label" default="maxRunners: " />
						</label>
					</div>
					<div
						class=" ${hasErrors(bean: raceInstance, field: 'maxRunners', 'error')} required"
						style="width: 75%; float: right; text-align: right; color:white; padding-top:15px;">
						<g:fieldValue bean="${raceInstance}" field="maxRunners" />
					</div>
					<div class="clearfix"></div>
				</div>
			</g:if>
			
			<%--<g:if test="${raceInstance?.registrations}">
			<div class="clearfix"></div>
				<div>
					<div style="width: 0%; float: left; text-align: right; color:red">
						<label for="registrations"> <span class="required-indicator"></span>
							<g:message code="race.registrations.label" default="registrations: " />
						</label>
					</div>
					<div
						class=" ${hasErrors(bean: raceInstance, field: 'registrations', 'error')} required"
						style="width: 50%; float: right; text-align: right; color:white; padding-top:15px;">
						<g:fieldValue bean="${raceInstance}" field="registrations" />
					</div>
					<div class="clearfix"></div>
				</div>
			</g:if>

			--%></ol>
			<g:form>
				<div class="updateDelete">
					<g:hiddenField name="id" value="${raceInstance?.id}" />
					<g:link class="" action="edit" id="${raceInstance?.id}"><g:img dir="images" file="edit.png" style="padding-left:275px;width:75px"/></g:link>
					<g:actionSubmit class="mobileBtn fr" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</div>
			</g:form>
		</div>
</body>
</html>
