<table class="Tablelist">
<thead>
	<tr>
		<th>Title </th>
	<th>Start Date </th>
	<th>End Date </th></tr>
	
</thead>
<tbody>
				<g:each in="${fixturesInstanceList}" status="i" var="fixturesInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td  class="blueColorText">${fieldValue(bean: fixturesInstance, field: "fixtureTitle")}</td>
						<td class="blueColorText">
							<g:formatDate date="${fixturesInstance.startDate}" format="dd/MM/yyyy"/>
						</td>
					
						<td class="blueColorText"><g:formatDate date="${fixturesInstance.endDate}" format="dd/MM/yyyy"/></td>
					</tr>
				</g:each>
				</tbody>
</table>
