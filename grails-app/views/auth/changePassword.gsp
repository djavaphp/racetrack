<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="layout" content="main" />
  <title>Change Password</title>
</head>
<body>
<g:form>
	<table>
      <tbody>
        <tr>
          <td>Old Password:</td>
          <td><input type="password" name="oldPassword" value="${oldPassword}" /></td>
        </tr>
        <tr>
          <td>New Password:</td>
          <td><input type="password" name="newPassword" value="${newPassword}" /></td>
        </tr>
        <tr>
          <td>Confirm Password:</td>
          <td><input type="password" name="confirmPassword" value="${confirmPassword}" /></td>
        </tr>
        </tbody>
       </table>
       <input type="submit" value="updatePassword" />
       </g:form>
 </body>

</html>