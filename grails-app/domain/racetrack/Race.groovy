package racetrack

class Race {
	static searchable = true
	static hasMany = [registrations:Registration]
	
	/*String toString()
	{
		return "${name},${startDate.format('MM/DD/YYYY')}"
	}*/
	static constraints = {
		name(blank:false,maxsize:50)
		startDate(validator:{return(it>new Date())})
		city()
		state(inList:(["GA","SC","SA","DF"]))
		distance(min:0.0)
		cost(min:0.0,max:100.0)
		maxRunners(min:0,max:100000)
	}
	String name
	Date startDate
	String city
	String state
	BigDecimal distance
	BigDecimal cost
	Integer maxRunners = 100000
	
	BigDecimal inMiles()
	{
		return distance*0.6214
	}
	static mapping = {
		sort "startDate"
	}
	
	
}
