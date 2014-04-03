
import com.cygnet.ShiroRole
import com.cygnet.ShiroUser
import org.apache.shiro.crypto.hash.Sha256Hash
//import org.apache.shiro.crypto.hash.Sha512Hash
import racetrack.Participants
import racetrack.Race
import racetrack.Registration
import racetrack.Runner
import racetrack.GenerationService
import racetrack.User
import racetrack.Fixtures

class BootStrap {
	def init = { servletContext ->
		
		def adminRole = new ShiroRole(name: "Administrator")
        adminRole.addToPermissions("*:*")
        adminRole.save()
		
		def admin = new ShiroUser(username: "admin", passwordHash:new Sha256Hash("wordpass").toHex())
        admin.addToRoles(adminRole)
        admin.save()
		
		def user = new User(login:"admin",password:"admin")
		user.save()
		if(user.hasErrors()){
			println admin.errors
		}
		
		def Date1 = new Date().clearTime()
		def Date2 = (Date1 + 30).clearTime()
		def Date3 = (Date2 + 30).clearTime()
		def Date4 = (Date3 + 30).clearTime()
		def Date5 =	(Date4 + 30).clearTime()
		def Date6 = (Date5 + 30).clearTime()
		def Date7 = (Date6 + 30).clearTime()
		def Date8 = (Date7 + 30).clearTime()
		def Date9 = (Date8 + 30).clearTime()
		def Date10 = (Date9 + 30).clearTime()
		def Date11 = (Date10 + 30).clearTime()
		def Date12 = (Date11 + 30).clearTime()
		def Date13 = (Date12 + 30).clearTime()
		def Date14 = (Date13 + 30).clearTime()
		def Date15 = (Date14 + 30).clearTime()
		def Date16 = (Date15 + 30).clearTime()
		def Date17 = (Date16 + 30).clearTime()
		def Date18 = (Date17 + 30).clearTime()
		def Date19 = (Date18 + 30).clearTime()
		def Date20 = (Date19 + 30).clearTime()


		def fix1 = new Fixtures(startDate:Date1,
		endDate:Date2,
		fixtureTitle:"Australian Grand Prix 1")
		fix1.save()
		if(fix1.hasErrors()){
			println fix1.errors
		}

		def fix2 = new Fixtures(startDate:Date3,
		endDate:Date4,
		fixtureTitle:"Australian Grand Prix 2")
		fix2.save()
		if(fix2.hasErrors()){
			println fix2.errors
		}

		def fix3 = new Fixtures(startDate:Date5,
		endDate:Date6,
		fixtureTitle:"Malaysian Grand Prix 1")
		fix3.save()
		if(fix3.hasErrors()){
			println fix3.errors
		}

		def fix4 = new Fixtures(startDate:Date7,
		endDate:Date8,
		fixtureTitle:"Malaysian Grand Prix 2")
		fix4.save()
		if(fix4.hasErrors()){
			println fix4.errors
		}
		def fix5 = new Fixtures(startDate:Date9,
		endDate:Date10,
		fixtureTitle:"Candian Grand Prix 1")
		fix5.save()
		if(fix5.hasErrors()){
			println fix5.errors
		}
		def fix6 = new Fixtures(startDate:Date11,
		endDate:Date12,
		fixtureTitle:"Candian Grand Prix 2")
		fix6.save()
		if(fix6.hasErrors()){
			println fix6.errors
		}
		def fix7 = new Fixtures(startDate:Date13,
		endDate:Date14,
		fixtureTitle:"Candian Grand Prix 3")
		fix7.save()
		if(fix7.hasErrors()){
			println fix7.errors
		}
		def fix8 = new Fixtures(startDate:Date15,
		endDate:Date16,
		fixtureTitle:"Indian Grand Prix 1")
		fix8.save()
		if(fix8.hasErrors()){
			println fix8.errors
		}
		def fix9 = new Fixtures(startDate:Date17,
		endDate:Date18,
		fixtureTitle:"Indian Grand Prix 2")
		fix9.save()
		if(fix9.hasErrors()){
			println fix9.errors
		}
		def fix10 = new Fixtures(startDate:Date19,
		endDate:Date20,
		fixtureTitle:"Indian Grand Prix 3")
		fix10.save()
		if(fix10.hasErrors()){
			println fix10.errors
		}

	}
	def destroy = {}
}


