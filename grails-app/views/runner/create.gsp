<%@ page import="racetrack.Runner" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'runner.label', default: 'Runner')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-runner" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li class="active"><a class="home" href="${createLink(uri: '/')}"><i class="icon-home icon-white"></i><g:message code="default.home.label"/></a></li>
				<shiro:hasPermission permission="runner:create">
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				</shiro:hasPermission>
			</ul>
		</div>
		<div id="create-runner" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${runnerInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${runnerInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<%--<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
			--%>
			<g:uploadForm controller="runner" action="save" method="post" enctype="multipart/form-data">
			<fieldset class="form">
					<g:render template="form"/>
			</fieldset>
			<tr class="prop">
    		<td valign="top" class="name">
     	 		<label for="payload">File:</label>
    		</td>
    		<td valign="top">
      			<input type="file" id="fileUpload" name="fileUpload"/>
    		</td>
  			</tr>
  			<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
			</fieldset>
			</g:uploadForm>
		</div>
	</body>
</html>
