
<%@ page import="racetrack.Runner" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="mobileMain">
		<g:set var="entityName" value="${message(code: 'runner.label', default: 'Runner')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div style="margin-left: 10px;">
			<g:link controller="auth" action="home" style="float:left"><g:img dir="images" file="homeButton.png"/> </g:link>
			<div class="labelStripe">Runner List</div>
			<%--<g:link controller="auth" action="home" class="backBtn"><g:img dir="images" file="backBtn.png"/> </g:link>
		--%>
			<g:link controller="runner" action="create" class="backBtn"><g:img dir="images" file="add.png"/> </g:link>
		</div>
		<div>
			<g:textField class="search-icon-input" value="" name="searchString" placeholder="Search" onkeyup="${remoteFunction(action: 'list',controller:'runner',
                       update: 'runnerList',
                       params: '\'searchString=\' + encodeURIComponent(this.value)')}"/>
            
            
		</div>
		<div id="runnerList">
			<g:render template="runnerListMobile"></g:render>
		</div>
			
			
			<div class="pagination">
				<g:paginate total="${runnerInstanceTotal}" />
			</div>
	</body>
</html>
