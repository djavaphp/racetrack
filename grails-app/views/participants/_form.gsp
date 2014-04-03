<%@ page import="racetrack.Participants" %>



<div class="fieldcontain ${hasErrors(bean: participantsInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="participants.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${participantsInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: participantsInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="participants.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="email" required="" value="${participantsInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: participantsInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="participants.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${participantsInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: participantsInstance, field: 'zipcode', 'error')} required">
	<label for="zipcode">
		<g:message code="participants.zipcode.label" default="Zipcode" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="zipcode" required="" value="${participantsInstance?.zipcode}"/>
</div>

