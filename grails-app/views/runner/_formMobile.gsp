<div>
	<div style="width: 30%;float: left;text-align: right;">
		<label for="firstName">
			<span class="required-indicator">*</span>
			<g:message code="runner.firstName.label" default="First Name: " />
		</label>
	</div>
	<div class="${hasErrors(bean: runnerInstance, field: 'firstName', 'error')} required" style="width: 69%;float: right;text-align: left;">
		<g:textField name="firstName" value="${runnerInstance?.firstName}"/>
	</div>
	<div class="clearfix"></div>
</div>
<div class="clearfix"></div>

<div>
	<div style="width: 30%;float: left;text-align: right;">
		<label for="lastName">
			<span class="required-indicator">*</span>
			<g:message code="runner.lastName.label" default="Last Name: " />
		</label>
	</div>
	<div class=" ${hasErrors(bean: runnerInstance, field: 'lastName', 'error')} required" style="width: 69%;float: right;text-align: left;">
		<g:textField name="lastName" value="${runnerInstance?.lastName}"/>
	</div>
	<div class="clearfix"></div>
</div>
<div class="clearfix"></div>
<div>
	<div style="width: 30%;float: left;text-align: right;">
		<label for="dateOfBirth">
			<span class="required-indicator">*</span>
			<g:message code="runner.dateOfBirth.label" default="Date Of Birth: " />
		</label>
	</div>
	<div class=" ${hasErrors(bean: runnerInstance, field: 'dateOfBirth', 'error')} required" style="width: 69%;float: right;text-align: left;">
		<g:datePicker name="dateOfBirth" precision="day"  value="${runnerInstance?.dateOfBirth}"  />
	</div>
	<div class="clearfix"></div>
</div>
<div class="clearfix"></div>
<div>
	<div style="width: 30%;float: left;text-align: right;">
		<label for="gender">
			<g:message code="runner.gender.label" default="Gender: " />
		</label>
	</div>
	<div class=" ${hasErrors(bean: runnerInstance, field: 'gender', 'error')} " style="width: 69%;float: right;text-align: left;">
		<g:select name="gender" from="${runnerInstance.constraints.gender.inList}" value="${runnerInstance?.gender}" valueMessagePrefix="runner.gender" noSelection="['': '']"/>
	</div>
	<div class="clearfix"></div>
</div>
<div class="clearfix"></div>
<div >
	<div style="width: 30%;float: left;text-align: right;">
		<label for="address">
			<g:message code="runner.address.label" default="Address: " />
		</label>
	</div>
	<div class=" ${hasErrors(bean: runnerInstance, field: 'address', 'error')} " style="width: 69%;float: right;text-align: left;">
		<g:textField name="address" value="${runnerInstance?.address}"/>
	</div>
	<div class="clearfix"></div>
</div>
<div class="clearfix"></div>
<div>
	<div style="width: 30%;float: left;text-align: right;">
		<label for="city">
			<g:message code="runner.city.label" default="City: " />
			
		</label>
	</div>
	<div class=" ${hasErrors(bean: runnerInstance, field: 'city', 'error')} " style="width: 69%;float: right;text-align: left;">
		<g:textField name="city" value="${runnerInstance?.city}"/>
	</div>
	<div class="clearfix"></div>
</div>
<div class="clearfix"></div>
<div>
	<div style="width: 30%;float: left;text-align: right;">
		<label for="state">
			<g:message code="runner.state.label" default="State: " />
			
		</label>
	</div>
	<div class=" ${hasErrors(bean: runnerInstance, field: 'state', 'error')} " style="width: 69%;float: right;text-align: left;">
		<g:textField name="state" value="${runnerInstance?.state}"/>
	</div>
	<div class="clearfix"></div>
</div>
<div class="clearfix"></div>
<div>
	<div style="width: 30%;float: left;text-align: right;">
		<label for="zipcode">
			<g:message code="runner.zipcode.label" default="Zipcode: " />
		</label>
	</div>
	<div class=" ${hasErrors(bean: runnerInstance, field: 'zipcode', 'error')} "  style="width: 69%;float: right;text-align: left;">
		<g:textField name="zipcode" value="${runnerInstance?.zipcode}"/>
	</div>
	<div class="clearfix"></div>
</div>
<div class="clearfix"></div>
<div class=" ${hasErrors(bean: runnerInstance, field: 'email', 'error')} ">
	<div style="width: 30%;float: left;text-align: right;">
		<label for="email">
			<g:message code="runner.email.label" default="Email: " />
		</label>
	</div>
	<div  style="width: 69%;float: right;text-align: left;">
		<g:field type="email" name="email" value="${runnerInstance?.email}"/>
	</div>
	<div class="clearfix"></div>
</div>
<div class="clearfix"></div>
<%--<div class=" ${hasErrors(bean: runnerInstance, field: 'registrations', 'error')} ">
	<div style="width: 30%;float: left;text-align: right;">
		<label for="registrations">
			<g:message code="runner.registrations.label" default="Registrations: " />
			
		</label>
		</div>
<div style="width: 69%;float: right;text-align: left;">	
<ul class="one-to-many">
<g:each in="${runnerInstance?.registrations?}" var="r">
    <li><g:link controller="registration" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="registration" action="create" params="['runner.id': runnerInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'registration.label', default: 'Registration')])}</g:link>
</li>
</ul>
</div>
</div>--%>

			
