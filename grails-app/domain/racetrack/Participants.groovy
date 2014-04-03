package racetrack

class Participants {
	
	String name
	String email
	String address
	String zipcode

    static constraints = {
		name(blank:false)
		email(blank:false)
		address(blank:false)
		zipcode(unique:true,blank:false)
    }
	
	String toString(){
		
	}
}
