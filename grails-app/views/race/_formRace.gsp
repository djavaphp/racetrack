<div>
	<div style="width: 30%;float: left;text-align: right;">
		<label for="name">
			<span class="required-indicator">*</span>
			<g:message code="race.name.label" default="Name" />
		</label>
	</div>
	<div class="${hasErrors(bean: raceInstance, field: 'name', 'error')} required" style="width: 69%;float: right;text-align: left;">
		<g:textField name="name" required="" value="${raceInstance?.name}"/>
	</div>
	<div class="clearfix"></div>
</div>
<div class="clearfix"></div>

<div>
	<div style="width: 30%;float: left;text-align: right;">
		<label for="startDate">
			<span class="required-indicator">*</span>
			<g:message code="race.startDate.label" default="Start Date" />
		</label>
	</div>
	<div class=" ${hasErrors(bean: raceInstance, field: 'startDate', 'error')} required" style="width: 69%;float: right;text-align: left;">
		<g:datePicker name="startDate" precision="day"  value="${raceInstance?.startDate}"  />
	</div>
	<div class="clearfix"></div>
</div>
<div class="clearfix"></div>
<div>
	<div style="width: 30%;float: left;text-align: right;">
		<label for="city">
			<span class="required-indicator">*</span>
			<g:message code="race.city.label" default="City" />
		</label>
	</div>
	<div class=" ${hasErrors(bean: raceInstance, field: 'city', 'error')} required" style="width: 69%;float: right;text-align: left;">
		<g:textField name="city" required="" value="${raceInstance?.city}"/>
	</div>
	<div class="clearfix"></div>
</div>
<div class="clearfix"></div>
<div>
	<div style="width: 30%;float: left;text-align: right;">
		<label for="state">
			<g:message code="race.state.label" default="State" />
		</label>
	</div>
	<div class=" ${hasErrors(bean: runnerInstance, field: 'state', 'error')} " style="width: 69%;float: right;text-align: left;">
		<g:select name="state" from="${raceInstance.constraints.state.inList}" value="${raceInstance?.state}" valueMessagePrefix="race.state" noSelection="['': '']"/>
	</div>
	<div class="clearfix"></div>
</div>
<div class="clearfix"></div>
<div >
	<div style="width: 30%;float: left;text-align: right;">
		<label for="distance">
			<g:message code="race.distance.label" default="Distance" />
		</label>
	</div>
	<div class=" ${hasErrors(bean: runnerInstance, field: 'distance', 'error')} " style="width: 69%;float: right;text-align: left;">
		<g:textField name="distance" value="${fieldValue(bean: raceInstance, field: 'distance')}"/>
	</div>
	<div class="clearfix"></div>
</div>
<div class="clearfix"></div>
<div>
	<div style="width: 30%;float: left;text-align: right;">
		<label for="cost">
			<g:message code="race.cost.label" default="Cost" />
			
		</label>
	</div>
	<div class=" ${hasErrors(bean: runnerInstance, field: 'cost', 'error')} " style="width: 69%;float: right;text-align: left;">
		<g:textField name="cost" value="${fieldValue(bean: raceInstance, field: 'cost')}"/>
	</div>
	<div class="clearfix"></div>
</div>
<div class="clearfix"></div>
<div>
	<div style="width: 30%;float: left;text-align: right;">
		<label for="maxRunners">
			<g:message code="race.maxRunners.label" default="Max Runners" />
			
		</label>
	</div>
	<div class=" ${hasErrors(bean: runnerInstance, field: 'maxRunners', 'error')} " style="width: 69%;float: right;text-align: left;">
		<g:textField name="maxRunners" value="${raceInstance.maxRunners}"/>
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
<g:each in="${raceInstance?.registrations?}" var="r">
    <li><g:link controller="registration" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="registration" action="create" params="['runner.id': runnerInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'registration.label', default: 'Registration')])}</g:link>
</li>
</ul>
</div>
</div>
<div class="savecancel">
	<g:submitButton name="create" class="myButton Buttonpadding font16 height20" value="Save" />
</div>
			
--%>