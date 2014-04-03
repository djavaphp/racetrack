<table class="listTable">
	<tbody>
	<g:if test="${runnerInstanceList?.size() > 0}">
	<g:each in="${runnerInstanceList}" status="i" var="runnerInstance">
		<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
			<td>
				<span class="blueColorText">${fieldValue(bean: runnerInstance, field: "firstName")}</span>
				<g:link action="show" id="${runnerInstance.id}">
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