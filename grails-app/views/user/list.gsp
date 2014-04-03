<g:each in="${userInstanceList}" status="i" var="userInstance">
	<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
		<td><g:link action="show" id="${userInstance.id}">
				${fieldValue(bean:userInstance, field:'id')}
			</g:link></td>
		<td>
			${fieldValue(bean:userInstance,
field:'login')}
		</td>
		<td>
			${fieldValue(bean:userInstance,
field:'password')}
		</td>
		<td>
			${fieldValue(bean:userInstance,
field:'role')}
		</td>
	</tr>
</g:each>

