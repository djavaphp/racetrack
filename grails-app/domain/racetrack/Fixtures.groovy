package racetrack

import javax.management.modelmbean.RequiredModelMBean;

class Fixtures {
	
	Date startDate
	Date endDate
	String fixtureTitle

	static constraints = {
		startDate()
		endDate()
		fixtureTitle()
	}
	
	String toString(){
		
	}
}
