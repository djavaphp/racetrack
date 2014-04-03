package racetrack

class Currency {
	
	String country
	Integer amount

    static constraints = {
		country(blank:false)
		amount(blank:false) 
	}
	
	String toString(){
		
	}
}
