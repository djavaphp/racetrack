<div>
	<div style="width: 30%;float: left;text-align: right;">
		<label for="race">
			<span class="required-indicator">*</span>
			<g:message code="registration.race.label" default="Race" />
		</label>
	</div>
	<div class="${hasErrors(bean: raceInstance, field: 'race', 'error')} required" style="width: 69%;float: right;text-align: left;">
		<g:select id="race" name="race.id" from="${racetrack.Race.list()}" optionKey="id" optionValue="name" required="" value="${registrationInstance?.race?.id}" class="many-to-one"/>
	</div>
	<div class="clearfix"></div>
</div>
<div class="clearfix"></div>

<div>
	<div style="width: 30%;float: left;text-align: right;">
		<label for="runner">
			<span class="required-indicator">*</span>
			<g:message code="registration.runner.label" default="Runner" />
		</label>
	</div>
	<div class="${hasErrors(bean: raceInstance, field: 'runner', 'error')} required" style="width: 69%;float: right;text-align: left;">
		<g:select id="runner" name="runner.id" from="${racetrack.Runner.list()}" optionKey="id" required="" value="${registrationInstance?.runner?.id}" class="many-to-one"/>
	</div>
	<div class="clearfix"></div>
</div>
<div class="clearfix"></div>
