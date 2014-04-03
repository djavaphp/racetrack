package com.cygnet

import org.apache.shiro.SecurityUtils
import org.apache.shiro.authc.AuthenticationException
import org.apache.shiro.authc.UsernamePasswordToken
import org.apache.shiro.web.util.SavedRequest
import org.apache.shiro.web.util.WebUtils
import org.apache.shiro.grails.ConfigUtils
import com.cygnet.ShiroUser

class AuthController {
    def shiroSecurityManager

    def index = { redirect(action: "login", params: params) }

    def login = {
        return [ username: params.username, rememberMe: (params.rememberMe != null), targetUri: params.targetUri ]
    }
	
    def signIn = {

        def authToken = new UsernamePasswordToken(params.username , params.password as String)
		
        // Support for "remember me"
        if (params.rememberMe) {
            authToken.rememberMe = true
        }
        
        // If a controller redirected to this page, redirect back
        // to it. Otherwise redirect to the root URI.
       def targetUri = params.targetUri ?: "/"
		  
        // Handle requests saved by Shiro filters.
        def savedRequest = WebUtils.getSavedRequest(request)
        if (savedRequest) {
            targetUri = savedRequest.requestURI - request.contextPath
            if (savedRequest.queryString) targetUri = targetUri + '?' + savedRequest.queryString
        }
        
        try{
            // Perform the actual login. An AuthenticationException
            // will be thrown if the username is unrecognised or the
            // password is incorrect.
            SecurityUtils.subject.login(authToken)
			//boolean captchaValid = simpleCaptchaService.validateCaptcha(params.captcha)

            log.info "Redirecting to '${targetUri}'."
            redirect(uri: targetUri)
        }
        catch(AuthenticationException ex){
            // Authentication failed, so display the appropriate message
            // on the login page.
            log.info "Authentication failure for user '${params.username}'."
            flash.message = message(code: "login.failed")

            // Keep the username and "remember me" setting so that the
            // user doesn't have to enter them again.
            def m = [ username: params.username ]
            if (params.rememberMe) {
                m["rememberMe"] = true
            }

            // Remember the target URI too.
            if (params.targetUri) {
                m["targetUri"] = params.targetUri
            }

            // Now redirect back to the login page.
            redirect(action: "login", params: m)
        }
    }

    def signOut = {
        // Log the user out of the application.
        def principal = SecurityUtils.subject?.principal
        SecurityUtils.subject?.logout()
        // For now, redirect back to the home page.
        if (ConfigUtils.getCasEnable() && ConfigUtils.isFromCas(principal)) {
            redirect(uri:ConfigUtils.getLogoutUrl())
        }else {
            redirect(uri: "/")
        }
        ConfigUtils.removePrincipal(principal)
    }

    def unauthorized = {
        //render "You do not have permission to access this page."
		render(view:"accessDenied")
    }
	
	def home = {
		println "in home action..."
		def mobileRequest = false
		withMobileDevice {def device ->
			println device
			mobileRequest = true
			println "in home from mobile...." + mobileRequest
			return mobileRequest
		}
		if(mobileRequest) {
			render (view:"/indexMobile")
			return
		}
		render(view:"/index")
		//render (view:"/indexMobile")
	}
	
	def editUserPassword() {
		[user: ShiroUser.get(params.shirouserid)]
	 }
	
	def updatePassword = {
		String username = session['SPRING_SECURITY_LAST_USERNAME']
		if (!username) {
		   flash.message = 'Sorry, an error has occurred'
		   redirect controller: 'login', action: 'auth'
		   return
		}
		
		String oldPassword = params.oldPassword
		String newPassword = params.newPassword
		String confirmPassword = params.confirmPassword
		
		if (!oldPassword || !newPassword || !confirmPassword || newPassword != confirmPassword) {
		   flash.message = 'Please enter your current password and a valid new password'
		   render view: 'passwordExpired', model: [username: session['SPRING_SECURITY_LAST_USERNAME']]
		   return
		}
		else{
			params.password = newPassword
		}
		
	}
}
