package com.cygnet

class ChangePassword {
	String OldPassword
	String NewPassword
	String ConfirmPassword
	
    static constraints = {
		OldPassword()
		NewPassword()
		ConfirmPassword()
    }
	
	String toString(){
		
	}
}
