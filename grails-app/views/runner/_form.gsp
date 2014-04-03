<%@ page import="racetrack.Runner" %>



<div class="fieldcontain ${hasErrors(bean: runnerInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="runner.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${runnerInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: runnerInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="runner.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${runnerInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: runnerInstance, field: 'dateOfBirth', 'error')} required">
	<label for="dateOfBirth">
		<g:message code="runner.dateOfBirth.label" default="Date Of Birth" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateOfBirth" precision="day"  value="${runnerInstance?.dateOfBirth}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: runnerInstance, field: 'gender', 'error')} ">
	<label for="gender">
		<g:message code="runner.gender.label" default="Gender" />
		
	</label>
	<g:select name="gender" from="${runnerInstance.constraints.gender.inList}" value="${runnerInstance?.gender}" valueMessagePrefix="runner.gender" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: runnerInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="runner.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${runnerInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: runnerInstance, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="runner.city.label" default="City" />
		
	</label>
	<g:textField name="city" value="${runnerInstance?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: runnerInstance, field: 'state', 'error')} ">
	<label for="state">
		<g:message code="runner.state.label" default="State" />
		
	</label>
	<g:textField name="state" value="${runnerInstance?.state}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: runnerInstance, field: 'zipcode', 'error')} ">
	<label for="zipcode">
		<g:message code="runner.zipcode.label" default="Zipcode" />
		
	</label>
	<g:textField name="zipcode" value="${runnerInstance?.zipcode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: runnerInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="runner.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${runnerInstance?.email}"/>
</div>
<%--<div class="fieldcontain ${hasErrors(bean: registrationInstance, field: 'race', 'error')} required">
	<label for="race">
		<g:message code="registration.race.label" default="Race" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="race" name="race.id" from="${racetrack.Race.list()}" optionKey="id" optionValue="name" required="" value="${registrationInstance?.race?.id}" class="many-to-one"/>
</div>

 

--%>