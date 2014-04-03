class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller: "auth", action: "home")
		"500"(view:'/error')
		name changePassword: "/changePassword"(view:'/changePassword')
		name currency: "/race/currency"(view:'/race/currency')
		name validate: "/user/validation"(view:'/user/validation')
		
	}
}
