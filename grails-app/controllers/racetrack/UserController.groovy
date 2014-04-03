package racetrack

import org.apache.jasper.compiler.Node.ParamsAction;

import com.cygnet.autotest.mate4j.TM;

class UserController {
	static allowedMethods = [save: "POST",
							 update: "POST",
							 delete: "POST"]
	
	

    def index = {redirect(controller:"runner",action:"list",params: params)}
	
	def login = {
		return [ username: params.username, rememberMe: (params.rememberMe != null), targetUri: params.targetUri ]
	}
	
	def uservalidate = {
		
		String k1 = params.randomstring
		String k2 = params.randomposition
		String k3 = params.position1
		String i = k1.charAt(Integer.parseInt(k2.charAt(0).toString()))
		String j = k1.charAt(Integer.parseInt(k2.charAt(1).toString()))
		String k = k1.charAt(Integer.parseInt(k2.charAt(2).toString()))
		String k4 = i + j + k
		println k2
		println k3
		println k4
		if(k4.equals(k3)){
		redirect(controller:"runner", action:"create")
		return
		}
		else{
			println "sorry"
			redirect(action:"login")
		}
	}
	
	def list = {
		params.max = Math.min(params.max ?
		params.int('max') : 10, 100)
		[userInstanceList: User.list(params),
		userInstanceTotal: User.count()]
		}
		def create = {
		def userInstance = new User()
		userInstance.properties = params
		return [userInstance: userInstance]
	}
	
		def randomstring = getRandomString()
		
		def randomposition = getRandomPosition()
		
		def authenticate = {
			
			String i = randomstring.charAt(Integer.parseInt(randomposition.charAt(0).toString()))
			String j = randomstring.charAt(Integer.parseInt(randomposition.charAt(1).toString()))
			String k = randomstring.charAt(Integer.parseInt(randomposition.charAt(2).toString()))
			String k4 = i + j + k
			TM.sendInput("position1", k4)
			println "authenticate.."
			//String str = "${randomposition}"
			//String s = str.replaceAll("\\B", " ")
			
				def user =
				User.findByLoginAndPassword(params.login,
				params.password)
				if(user){
				session.user = user
				flash.message = "Hello ${user.login}!"
				
				def displayRandomPosition = Integer.toString(Integer.parseInt(randomposition) + 111);

				render(view:"validation" , model:[randomstring: randomstring , randomposition: displayRandomPosition])
				return
				
				}else{
				flash.message =
				"Sorry, ${params.login}. Please try again."
				redirect(action:"login")
				}
		}
		
		def logout = {
			//user = $(session?.user)
				flash.message = "GoodBye ${session?.user?.login}!"
			//session.user = null
			redirect(action:"login")
	}
		
		def getRandomString() {
			def string = ""
			def pool = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
			def rand = new Random(System.currentTimeMillis())
			
			for(i in 0..7)
				   string += pool[rand.nextInt(pool.length())]
				   return string
			}
		
		def getRandomPosition(){
			def string = ""
			def pool = "01234567"
			def rand = new Random(System.currentTimeMillis())
			
			for(i in 0..2)
			string += pool[rand.nextInt(pool.length())]
			return string
		}
	
	}
