<html>
	<head>
		<meta name="layout" content="mobileMain"/>
		<title>Race track</title>
	</head>
	<body>
		<div class="homeContainer">
			<div class="homeButtonBoxLeft">
				<g:link controller="race" action="index" class="noUnderline">
					<g:img file="race.png" dir="images" width="135" height="110" class="homeBtnBorder"/>
					<div class="homeBtnText" style="text-decoration: none">Race</div>
				</g:link>
				<div class="bottommargin"></div>
				<g:link controller="registration" action="index" class="noUnderline">
					<g:img file="BlueRegisterIcon.png" dir="images" width="140" height="100" class="homeBtnBorder"/>
					<div class="homeBtnText rightMarg10">Registration</div>
				</g:link>
			</div>
			<div class="homeButtonBoxRight">
				<g:link controller="runner" action="list" class="noUnderline">
					<g:img file="runner.png" dir="images" width="170" height="110" class="homeBtnBorder"/>
					<div class="homeBtnText">Runner</div>
				</g:link>
				<div class="bottommargin"></div>
				<g:link controller="fixtures" action="list" class="noUnderline">
					<g:img file="schedule.jpg" dir="images" width="145" height="100" class="homeBtnBorder"/>
					<div class="homeBtnText">Fixtures</div>
				</g:link>
			</div>
		</div>
	</body>
</html>
