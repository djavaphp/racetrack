
<%@ page import="racetrack.Registration" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="mobileMain">
		<g:set var="entityName" value="${message(code: 'registration.label', default: 'Registration')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	
	<div style="margin-left: 10px;">
			<g:link controller="auth" action="home" style="float:left"><g:img dir="images" file="homeButton.png"/> </g:link>
			<div class="labelStripe">Registration List</div>
			<%--<g:link controller="auth" action="home" class="backBtn"><g:img dir="images" file="backBtn.png"/> </g:link>
			--%><g:link controller="registration" action="create" class="backBtn"><g:img dir="images" file="add.png"/> </g:link>
		</div>
		<div>
			<g:textField class="search-icon-input" value="" name="searchString" placeholder="Search" onkeyup="${remoteFunction(action: 'list',controller:'registration',
                       update: 'registrationList',
                       params: '\'searchString=\' + encodeURIComponent(this.value)')}"/>
            
            
		</div>
		<div id="registrationList">
			<g:render template="regListMobile"></g:render>
		</div>
		<%--<a href="#list-registration" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<g:if test="${session?.user?.admin}">
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		</g:if>
		<div id="list-registration" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'race.name.label', default: 'Name')}" style="float:left"/>
					
					
					</tr>
				</thead>
			</table>
			
			--%><div class="pagination">
				<g:paginate total="${registrationInstanceTotal}" />
			</div>
	</body>
</html>
