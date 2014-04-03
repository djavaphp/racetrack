<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  	<meta name="layout" content="main" />
	<g:javascript src="countries.js" />
</head>
<body>
			Select Country:   <select id="country" name ="country"></select>
 			<script language="javascript">print_country("country")</script>

			<div>
				amount:			<g:textField name="amount" required=""/>
			</div>
			<g:form action="save" >
			<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
			</fieldset>
			</g:form>
</body>
</html>