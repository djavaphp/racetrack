
<%@ page import="racetrack.Fixtures" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="mobileMain">
		<g:set var="entityName" value="${message(code: 'fixtures.label', default: 'Fixtures')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>

	</head>
	<body>
	<div style="margin-left: 10px;">
			<g:link controller="auth" action="home" style="float:left"><g:img dir="images" file="homeButton.png"/> </g:link>
		</div>
	<select class="fixturesSelect bottommargin martop fr" onchange="${remoteFunction(action: 'getFixtures',controller:'fixtures',
                       update: 'fixturesInstanceList',
                       params: '\'fixtureTitle=\' + this.value')}">
        <option>-- Select --</option>
    	<option>Australian Grand Prix</option>
		<option>Malaysian Grand Prix</option>
		<option>Candian Grand Prix</option>
		<option>Indian Grand Prix</option>
</select>

	 <div id="fixturesInstanceList">
			<g:render template="fixtureList"></g:render>
		</div>
	
	<%--<div style="margin-left: 10px;">
			<g:link controller="auth" action="home" style="float:left"><g:img dir="images" file="homeButton.png"/> </g:link>
			<div class="labelStripe">Race List</div>
			<g:link controller="auth" action="home" class="backBtn"><g:img dir="images" file="backBtn.png"/> </g:link>
		
			<g:link controller="race" action="create" class="backBtn"><g:img dir="images" file="add.png"/> </g:link>
		</div>
		<g:if test="${raceList?.size() > 0}">
		<div>
			<g:textField class="search-icon-input" value="" name="searchString" placeholder="Search" onkeyup="${remoteFunction(action: 'list',controller:'fixtures',
                       update: 'fixtureList',
                       params: '\'searchString=\' + encodeURIComponent(this.value)')}"/>
         </div>
        
        <div id="fixtureList">
			<g:render template="fixtureList"></g:render>
		</div>
	
		<a href="#list-fixtures" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<g:if test="${session?.user?.admin}">
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		</g:if>
		<div id="list-fixtures" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="startDate" title="${message(code: 'fixtures.startDate.label', default: 'Start Date')}" />
					
						<g:sortableColumn property="endDate" title="${message(code: 'fixtures.endDate.label', default: 'End Date')}" />
					
						<g:sortableColumn property="fixtureTitle" title="${message(code: 'fixtures.fixtureTitle.label', default: 'Fixture Title')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${fixturesInstanceList}" status="i" var="fixturesInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${fixturesInstance.id}">${fieldValue(bean: fixturesInstance, field: "startDate")}</g:link></td>
					
						<td><g:formatDate date="${fixturesInstance.endDate}" /></td>
					
						<td>${fieldValue(bean: fixturesInstance, field: "fixtureTitle")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			
			<div class="pagination">
				<g:paginate total="${fixturesInstanceTotal}" />
			</div>
		</div>
	--%></body>
</html>
