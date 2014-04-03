package com.cygnet
import racetrack.Runner

class ShiroUser {	
    String username
    String passwordHash
	//String password
	
    
    static hasMany = [roles: ShiroRole, permissions: String]
	
    static constraints = {
        username(nullable: false, blank: false, unique: true)
		passwordHash()
		
    }
}
