<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>validation</title>
</head>
<body>
	<div class="body">
		<h1>validation</h1>
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<g:form>
			<div class="dialog">
				<table>
					<tbody>
					<strong>${randomstring}</strong><br>
					<br> 
			
					Enter ${randomposition} characters:  <g:textField name="position1" value="${position1}"/>
					
						<g:hiddenField name="randomstring" value="${randomstring}"/>
						<g:hiddenField name="randomposition" value="${randomposition}"/>
					
						</tbody>
				</table>
			</div>
			<div class="buttons">
				<span class="button"> <input type="submit" value="Submit" />
				</span>
			</div>
		</g:form>
	</div>
</body>
</html>
<script type="text/javascript">
(function(){
		var string = ""
		var pool = "01234567"
		var rand = new Random(System.currentTimeMillis())
		
		for(i in 0..2)
		string += pool[rand.nextInt(pool.length())]
		return string
	
})
</script>

