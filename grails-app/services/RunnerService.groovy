import grails.gsp.PageRenderer
import grails.plugin.mail.MailService;
import com.cygnet.ShiroRole
import com.cygnet.ShiroUser
import org.apache.shiro.crypto.hash.Sha256Hash
import racetrack.Runner

class RunnerService {
	MailService mailService
	
	PageRenderer groovyPageRenderer
	
	static transactional = true
	
	def saveRunner(params)
	{
		def password = getRandomPassword()
		def newrunner = new Runner(params)
		def shirouser = new ShiroUser(username:newrunner.email,passwordHash:new Sha256Hash(password.toString()).toHex())
		def userRole = new ShiroRole(name: "UserRole")
		userRole.addToPermissions("runner:*")
		userRole.save(flush:true, failOnError:true)
		shirouser.addToRoles(userRole)
		shirouser.save()
		try
		{
			println "inside try of mail"
			mailService.sendMail {
			
			to      "${newrunner.email}"
			subject "Authentication of user"
			html groovyPageRenderer.render(template:'/email/mailsentConfirmation', model:[runner:newrunner, password: password])
			//flash.message = "Confirmation email sent to ${runnerInstance.email}"
			}
		}
		catch(Exception e)
		{
			log.error "Problem sending email $e.message", e
			flash.message = "Confirmation email NOT sent"
		}
		return newrunner
	}

	def getRandomPassword() {
		def passwd = ""
		def pool = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_"
		def rand = new Random(System.currentTimeMillis())
		
		for(i in 0..10)
			   passwd += pool[rand.nextInt(pool.length())]
			   return passwd
		}
}
