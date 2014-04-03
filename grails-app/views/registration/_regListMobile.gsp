<table class="Tablelist">
<tbody>
<g:if test="${registrationInstanceList?.size() > 0}">
	<g:each in="${registrationInstanceList}" status="i"
		var="registrationInstance">
		<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

			<td>
				<span class="blueColorText">${fieldValue(bean: registrationInstance.race, field: "name")}</span>
				<g:link action="show" id="${registrationInstance.id}">
					<g:img dir="images" file="arrow4.png" width="20" height="20" style="float:right"/>
				</g:link></td>
			</tr>
	</g:each>
	</g:if>
	<g:else>
		<tr>
			<td>
				<g:message code="default.recordNotFound" />
			</td>
		</tr>
</g:else>
</tbody>
</table>