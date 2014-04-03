<head>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">
	</head>
		<div class="header">
			<%--<g:link id="logo" controller="auth" action="home"><img src="images/logo.png" alt="logo"></g:link>
			--%><%--<a href="#" id="logo"><img src="../images/logo.png" alt="logo"></a>
			--%><a href="#" id="logo"><g:img dir="images" file="logo.png" alt="logo"/></a>
			<ul>
				<li>
					<g:link controller="race">Race</g:link>
				</li>
				<li>
					<g:link controller="runner">Runner</g:link>
				</li>
				<li>
					<g:link controller="registration">Registration</g:link>
				</li>
				<li>
					<g:link controller="Participants" action="generate">Generate</g:link> 
				</li>
				<li>
					<g:link controller="Currency">Country</g:link> 
				</li>
			</ul>
		</div>
	
