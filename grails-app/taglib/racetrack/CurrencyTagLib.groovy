package racetrack

class CurrencyTagLib {

	def currency = {attrs, body->
		out << attrs.country + " - "
		out << attrs.amount + "" + symbol(attrs.country)
		
		
	}
	
	def symbol(countryName)
	{
		if(countryName == "USA"){
			return "&#36"
		}
		if(countryName == "India"){
			return "&#8377"
		}
		if(countryName == "Åland Island"){
			return "&#128"
		}
		if(countryName == "Andorra"){
			return "&#128"
		}
		if(countryName == "Belgium"){
			return "&#128"
		}
		if(countryName == "Estonia"){
			return "&#128"
		}
		if(countryName == "Finland"){
			return "&#128"
		}
		if(countryName == "France"){
			return "&#128"
		}
		if(countryName == "Germany"){
			return "&#128"
		}
		if(countryName == "Greece"){
			return "&#128"
		}
		if(countryName == "Ireland"){
			return "&#128"
		}
		if(countryName == "Italy"){
			return "&#128"
		}
		if(countryName == "Kosovo"){
			return "&#128"
		}
		if(countryName == "Luxembourg"){
			return "&#128"
		}
		if(countryName == "Malta"){
			return "&#128"
		}
		if(countryName == "Monaco"){
			return "&#128"
		}
		if(countryName == "Montenegro"){
			return "&#128"
		}
		if(countryName == "Netherlands"){
			return "&#128"
		}
		if(countryName == "Portugal"){
			return "&#128"
		}
		if(countryName == "San Marino"){
			return "&#128"
		}
		if(countryName == "Slovakia"){
			return "&#128"
		}
		if(countryName == "Slovenia"){
			return "&#128"
		}
		if(countryName == "Spain"){
			return "&#128"
		}
		if(countryName == "Vatican City"){
			return "&#128"
		}
		if(countryName == "Switzerland"){
			return "Fr"
		}
		if(countryName == "Liechtenstein"){
			return "Fr"
		}
		if(countryName == "United Kingdom"){
			return "&#163"
		}
		
		
	}
	
}
