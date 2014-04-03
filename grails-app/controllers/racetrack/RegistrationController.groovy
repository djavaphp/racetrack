
package racetrack

import org.springframework.dao.DataIntegrityViolationException

class RegistrationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
		
		def mobileRequest = false
		def xhrRequest = false
		def registrationInstanceList = null
		params.max = params.max ?:5
		withMobileDevice {def device ->
			mobileRequest = true
			if(request.xhr){
				println "xhr request...."
				xhrRequest = true
				registrationInstanceList = getRegistrationSearchList(params)
				println "registrationInstanceList :::::" + registrationInstanceList
			}
			 return mobileRequest

	   }
		
		if(mobileRequest ) {
			if(xhrRequest) {
				println "render from if..."
				render (template : 'regListMobile', model : [registrationInstanceList: registrationInstanceList, registrationInstanceTotal: registrationInstanceList.size()])
				return
			} else {
				println"render from else"
				render (view:"regList", model: [registrationInstanceList: Registration.list(params), registrationInstanceTotal: Registration.count()])
				return
			}
		}
		
		print "Without mobile device..."
		//flash.message = "This is desktop page."
		[registrationInstanceList: Registration.list(params), registrationInstanceTotal: Registration.count()]
    }


    def create() {
		
		def mobileRequest = false
		println "in runner create..."
		withMobileDevice {def device ->
			println device
			mobileRequest = true
			println "in create from mobile...." + mobileRequest
			return mobileRequest
		}
		if(mobileRequest) {
			render (view:"regCreate", model: [registrationInstance: new Registration(params)] )
			return
		}
		println "THIS SHOULD NOT BE PRINTED IN CASE OF MOBILE...."
		[registrationInstance: new Registration(params)]
        
    }

    def save() {
        def registrationInstance = new Registration(params)
		def mobileRequest = false
		withMobileDevice {def device ->
			println device
			mobileRequest = true
			println "in save from mobile...." + mobileRequest
			return mobileRequest
		}
        if (!registrationInstance.save(flush: true)) {
			if(mobileRequest) {
				render (view:"regCreate", model: [registrationInstance: registrationInstance])
				return
			}
            render(view: "create", model: [registrationInstance: registrationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'registration.label', default: 'Registration')])
        redirect(action: "show", id: registrationInstance.id)
    }

    def show(Long id) {
        def registrationInstance = Registration.get(id)
		def mobileRequest = false
		withMobileDevice {def device ->
			println device
			mobileRequest = true
			println "in save from mobile...." + mobileRequest
			return mobileRequest
		}
        if (!registrationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'registration.label', default: 'Registration'), id])
            redirect(action: "list")
            return
        }
		if(mobileRequest) {
			render (view:"regShow", model: [registrationInstance: registrationInstance] )
			return
		}
		render(view: "show", model: [registrationInstance: registrationInstance])
		return
    }

    def edit(Long id) {
        def registrationInstance = Registration.get(id)
		def mobileRequest = false
		withMobileDevice {def device ->
			mobileRequest = true
			println "in edit from mobile...." + mobileRequest
			return mobileRequest
		}
        if (!registrationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'registration.label', default: 'Registration'), id])
            redirect(action: "list")
            return
        }
		
		if(mobileRequest) {
			render (view:"regEdit", model: [registrationInstance: registrationInstance] )
			return
		}

        [registrationInstance: registrationInstance]
    }

    def update(Long id, Long version) {
	   def registrationInstance = Registration.get(id)
	   def mobileRequest = false
	   if (!registrationInstance) {
		   flash.message = message(code: 'default.not.found.message', args: [message(code: 'registration.label', default: 'Registration'), id])
		   redirect(action: "list")
		   return
	   }

	   withMobileDevice {def device ->
		   mobileRequest = true
		   return mobileRequest
	   }
	   if (version != null) {
		   if (registrationInstance.version > version) {
			   registrationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						 [message(code: 'registration.label', default: 'Registration')] as Object[],
						 "Another user has updated this Runner while you were editing")
			   render(view: "edit", model: [registrationInstance: registrationInstance])
			   return
		   }
	   }

	   registrationInstance.properties = params

	   if (!registrationInstance.save(flush: true)) {
		   if(mobileRequest) {
			   render(view: "regEdit", model: [registrationInstance: registrationInstance])
			   return
		   } else {
			   render(view: "edit", model: [registrationInstance: registrationInstance])
			   return
		   }
	   }

	   flash.message = message(code: 'default.updated.message', args: [message(code: 'registration.label', default: 'Registration')])
	   redirect(action: "show", id: registrationInstance.id)
   }

    def delete(Long id) {
        def registrationInstance = Registration.get(id)
        if (!registrationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'registration.label', default: 'Registration'), id])
            redirect(action: "list")
            return
        }

        try {
            registrationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'registration.label', default: 'Registration'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'registration.label', default: 'Registration'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def getRegistrationSearchList(params) {
		println "params?.searchString :::: " + params?.searchString
		def registrations = Registration.createCriteria()
		def registrationList = registrations.list {
			like("name", "%" +params?.searchString+"%")
		}
		return  registrationList
	}
}
