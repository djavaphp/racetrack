<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>Login</title>
<script type="text/javascript">

	function check(x) {
		var level = 0;
		var p1 = /[a-z]/;
		var p2 = /[A-Z]/;
		var p3 = /[0-9]/;
		var p4 = /[\!\@\#\$\%\^\&\*\(\)\-\_\=\+\[\{\]\}\|\\\;\:\'\"\,\<\.\>\/\?\`\~]/;
		if (x.length >= 8)
			level++;
		if (p1.test(x))
			level++;
		if (p2.test(x))
			level++;
		if (p3.test(x))
			level++;
		if (p4.test(x))
			level++;
		prog_bar(level, 0, 5, 200, 5, "#0066FF", "#99FFFF");
	}

	function prog_bar(cur_val, min_val, max_val, width, height, border, fill) {
		var str = "", res = 0;
		if (cur_val >= min_val && cur_val <= max_val) {
			if (min_val < max_val) {
				res = ((cur_val - min_val) / (max_val - min_val)) * 100;
				res = Math.floor(res);
			} else {
				res = 0;
			}
		} else {
			res = 0;
		}
		if (res <= 40)
			fill = "#FF0000";
		else if (res <= 80)
			fill = "#FFFF00";
		else
			fill = "#00FF00";
		str = str
				+ "<div style=\"border:"+border+" solid thin; width:"+width+"px; height:"+height+"px;\">";
		str = str + "<div style=\"background-color:" + fill + "; width:" + res
				+ "%; height:" + height + "px;\">";
		str = str + "</div></div>";
		if (res <= 40)
			str = str + "Weak";
		else if (res <= 60)
			str = str + "Good";
		else if (res <= 80)
			str = str + "Strong";
		else
			str = str + "Excellent";
		document.getElementById("prog_bar").innerHTML = str;
	}
</script>

</head>
<body>
	<div class="body">
		<h1>Login</h1>
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<g:form action="authenticate" method="post" controller="user">
			<div class="dialog">
				<table>
					<tbody>
						<tr class="prop">
							<td valign="top" class="name"><label for="login">Login:</label>
							</td>
							<td valign="top"><input type="text" id="login" name="login" />
							</td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name"><label for="password">Password:</label>
							</td>
							<td valign="top"><input type="password" id="password"
								name="password" onkeyup="check(this.value)"/></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="buttons">
				<span class="button"> <input type="submit" value="Login" />
				</span>
			</div>
		</g:form>
	</div>
	<div id="prog_bar"></div>
</body>
</html>

