<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'pageStyle.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<script src="${resource(dir:'js',file:'jquery-1.4.3.min.js')}" /></script><%--
    <script src="${resource(dir:'js',file:'jquery.mobile-1.0a1.min.js')}"></script>
		--%><g:layoutHead/>
		<r:layoutResources />
	</head>
	
	<body>
	<div class="page">
		<div class="header">
			<%--<g:link id="logo" controller="auth" action="home"><img src="images/logo.png" alt="logo"></g:link>
			--%><a href="#" id="logo"><img src="images/logo.png" alt="logo"></a>
			<ul>
				<li class="selected">
					<g:link controller="race">Race</g:link>
				</li>
				<li>
					<g:link controller="runner">Runner</g:link>
				</li>
				<li>
					<g:link controller="registration">Registration</g:link>
				</li>
			</ul>
		<g:render template="/layouts/header" />
		<g:layoutBody/>
		<g:render template="/layouts/footer" />
		
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
			<g:javascript library="application"/>
			<r:layoutResources />

		</div>
	</div>
	</body>
</html>