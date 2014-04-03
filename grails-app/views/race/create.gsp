<%@ page import="racetrack.Race" %>

<%@ page import="nl.captcha.Captcha" %>
<%@ page import="com.cygnet.autotest.mate4j.TM" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'race.label', default: 'Race')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		
	</head>
	<body>
		<a href="#create-race" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link controller="auth" action="signOut">Sign out</g:link></li>
			</ul>
		</div>
		<div id="create-race" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${raceInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${raceInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<jcaptcha:jpeg name="image"/><br>
				<g:hiddenField name="captchaImage" />
				<br>
				<g:textField name="response1" value="" /><br>
				<br>
				<%
				Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
				String answer = request.getParameter("answer");
				try
				{
					TM.sendInput("answer", captcha.getAnswer());
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
		
				 %>
				
				<fieldset class="btn btn-danger buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
	 

</html>

