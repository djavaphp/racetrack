package racetrack


class Registration {
	
	static constraints = {
		race()
		runner()
	}
	
	static belongsTo = [race:Race,runner:Runner]
	
/*	String name
	Date dateOfBirth
	String gender
	String address
	String city
	String state
	String zipcode
	String email*/
	//Date dateCreated
	//Date lastUpdated
	
	
	static mapping = {
		autoTimestamp false
	}
	
}
