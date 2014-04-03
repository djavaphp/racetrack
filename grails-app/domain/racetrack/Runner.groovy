package racetrack
import com.cygnet.ShiroUser
import com.cygnet.ShiroRole

class Runner {
	
	static constraints = {
		firstName(blank:false,nullable: false,unique: true)
		lastName(blank:false)
		dateOfBirth()
		gender(inList : (["M","F"]))
		address(blank:false)
		city(blank:false)
		state()
		zipcode()
		email(email:true)
		filename(nullable:true,blank:false)
		
	}
	static hasMany = [registrations : Registration]
	//static belongsTo = [user : ShiroUser]
	
	String firstName
	String lastName
	Date dateOfBirth
	String gender
	String address
	String city
	String state
	String zipcode
	String email
	Date dateCreated
	Date lastUpdated
	String filename
	
	String toString(){
		"${lastName} ${firstName}"
	}
		
}
