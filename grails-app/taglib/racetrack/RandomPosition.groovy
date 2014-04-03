package racetrack

class RandomPosition {
	
	def position = {attrs, body->
		out << attrs."${randomposition}" + suffix(attrs.number)
		
	}

	def suffix(number){
		if(number==1)
		{
			return "st"
		}
	}
}
