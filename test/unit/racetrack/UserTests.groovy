package racetrack

import grails.test.GrailsUnitTestCase
import grails.test.mixin.TestFor




 
class UserTests extends GrailsUnitTestCase 
{void testSimpleConstraints() 
	{
		mockForConstraintsTests(User)
		def user = new User(login:"someone",
							password:"blah",
							role:"SuperUser")
assertFalse user.validate()
assertEquals "inList", user.errors["role"]
}
	
}