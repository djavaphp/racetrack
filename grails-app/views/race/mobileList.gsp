<%@ page import="racetrack.Race" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="mobileMain">
		<g:set var="entityName" value="${message(code: 'race.label', default: 'Race')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<div style="margin-left: 10px;">
			<g:link controller="auth" action="home" style="float:left"><g:img dir="images" file="homeButton.png"/> </g:link>
			<div class="labelStripe">Race List</div>
			<%--<g:link controller="auth" action="home" class="backBtn"><g:img dir="images" file="backBtn.png"/> </g:link>
		--%>
			<g:link controller="race" action="create" class="backBtn"><g:img dir="images" file="add.png"/> </g:link>
		</div>
		<%--<g:if test="${raceList?.size() > 0}">
		--%><div>
			<g:textField class="search-icon-input" value="" name="searchString" placeholder="Search" onkeyup="${remoteFunction(action: 'list',controller:'race',
                       update: 'raceList',
                       params: '\'searchString=\' + encodeURIComponent(this.value)')}"/>
         </div>
        
        <div id="raceList">
			<g:render template="raceListMobile"></g:render>
		</div>
		<%--<a href="#list-race" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<g:if test="${session?.user?.admin}">
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		</g:if>
		<div id="list-race" class="content scaffold-list" role="main">
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
				<g:paginate total="${raceInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
