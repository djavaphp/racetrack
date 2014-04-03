
<%@ page import="racetrack.Participants" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'participants.label', default: 'Participants')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-participants" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<g:if test="${session?.user?.admin}">
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		</g:if>
		<div id="list-participants" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'participants.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'participants.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'participants.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="zipcode" title="${message(code: 'participants.zipcode.label', default: 'Zipcode')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${participantsInstanceList}" status="i" var="participantsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${participantsInstance.id}">${fieldValue(bean: participantsInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: participantsInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: participantsInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: participantsInstance, field: "zipcode")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${participantsInstanceTotal}" />
			</div>
			
		</div>
	</body>
</html>
