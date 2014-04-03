<%@ page import="racetrack.Race" %>

<div class="fieldcontain ${hasErrors(bean: raceInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="race.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${raceInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: raceInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="race.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day"  value="${raceInstance?.startDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: raceInstance, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="race.city.label" default="City" />
		
	</label>
	<g:textField class="input-xlarge" name="city" value="${raceInstance?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: raceInstance, field: 'state', 'error')} ">
	<label for="state">
		<g:message code="race.state.label" default="State" />
		
	</label>
	<g:select name="state" from="${raceInstance.constraints.state.inList}" value="${raceInstance?.state}" valueMessagePrefix="race.state" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: raceInstance, field: 'distance', 'error')} required">
	<label for="distance">
		<g:message code="race.distance.label" default="Distance" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="distance" value="${fieldValue(bean: raceInstance, field: 'distance')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: raceInstance, field: 'cost', 'error')} required">
	<label for="cost">
		<g:message code="race.cost.label" default="Cost" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cost" value="${fieldValue(bean: raceInstance, field: 'cost')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: raceInstance, field: 'maxRunners', 'error')} required">
	<label for="maxRunners">
		<g:message code="race.maxRunners.label" default="Max Runners" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="maxRunners" type="number" min="0" max="100000" value="${raceInstance.maxRunners}" required=""/>
</div>

