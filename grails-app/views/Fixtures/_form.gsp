<%@ page import="racetrack.Fixtures" %>



<div class="fieldcontain ${hasErrors(bean: fixturesInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="fixtures.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day"  value="${fixturesInstance?.startDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: fixturesInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="fixtures.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endDate" precision="day"  value="${fixturesInstance?.endDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: fixturesInstance, field: 'fixtureTitle', 'error')} ">
	<label for="fixtureTitle">
		<g:message code="fixtures.fixtureTitle.label" default="Fixture Title" />
		
	</label>
	<g:select name="fixtureTitle" from="${fixturesInstance.constraints.fixtureTitle.inList}" value="${fixturesInstance?.fixtureTitle}" valueMessagePrefix="fixtures.fixtureTitle" noSelection="['': '']"/>
</div>


<%--<div class="fieldcontain ${hasErrors(bean: fixturesInstance, field: 'fixtureTitle', 'error')} ">
	<label for="fixtureTitle">
		<g:message code="fixtures.fixtureTitle.label" default="Fixture Title" />
		
	</label>
	<g:textField name="fixtureTitle" value="${fixturesInstance?.fixtureTitle}"/>
</div>

--%>