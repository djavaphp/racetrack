package racetrack

import nl.captcha.Captcha;

import org.springframework.dao.DataIntegrityViolationException
import com.cygnet.autotest.mate4j.TM;

class RaceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
       redirect(action:"list")
    }
	def jcaptchaService 
	
	def login = {
		println "login @ race"
        return [ username: params.username, rememberMe: (params.rememberMe != null), targetUri: params.targetUri ]
    }
    def list() {
		def mobileRequest = false
		def xhrRequest = false
		def raceInstanceList = null
		params.max = params.max ?:5
		
		withMobileDevice {def device ->

			mobileRequest = true
			if(request.xhr){
				println "xhr request...."
				xhrRequest = true
				raceInstanceList = getRaceSearchList(params)
				println "raceInstanceList :::::" + raceInstanceList
			}
			 return mobileRequest

	   }
		
		if(mobileRequest ) {
			if(xhrRequest) {
				println "render from if..."
				render (template : 'raceListMobile', model : [raceInstanceList: raceInstanceList, raceInstanceTotal: raceInstanceList.size()])
				return
			} else {
				println"render from else"
				render (view:"mobileList", model: [raceInstanceList: Race.list(params), raceInstanceTotal: Race.count()])
				return
			}
		}
		
		print "Without mobile device..."
		//flash.message = "This is desktop page."
		[raceInstanceList: Race.list(params), raceInstanceTotal: Race.count()]
    }
	
    def create() {
		println "params ::: " +params
		//TM.sendInput("response1", link())
		def mobileRequest = false
		println "in race create..."
		withMobileDevice {def device ->
			println device
			mobileRequest = true
			println "in create from mobile...." + mobileRequest
			return mobileRequest
		}
		if(mobileRequest) {
			render (view:"mobileCreate", model: [raceInstance: new Race(params)] )
			return
		}
		[raceInstance: new Race(params)]
        
    }
	
     def save() {  
		if (params.create) flash.message = (jcaptchaService.validateResponse("image", session.id, params.response)) ? "Text matches" : "Text doesn't match"
        def raceInstance = new Race(params)
		def mobileRequest = false
		withMobileDevice {def device ->
			println device
			mobileRequest = true
			println "in save from mobile...." + mobileRequest
			return mobileRequest
		}
		println "before save..."
		println request.getLocale()
        if (!raceInstance.save(flush: true)) {
			println "not saved.."
			if(mobileRequest) {
				println "in mobile request.."
				render (view:"mobileCreate", model: [raceInstance: raceInstance] )
				return
			}
            render(view: "create", model: [raceInstance: raceInstance])
            return
        }
        redirect(action: "show", id: raceInstance.id)
    }
 
    def show(Long id) {
		def raceInstance = Race.get(id)
		def mobileRequest = false
		withMobileDevice {def device ->
			println device
			mobileRequest = true
			println "in save from mobile...." + mobileRequest
			return mobileRequest
		}
		if (!raceInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'race.label', default: 'Race'), id])
			redirect(action: "list")
			return
		}
		
		if(mobileRequest) {
			render (view:"mobileShow", model: [raceInstance: raceInstance] )
			return
		}
		render(view: "show", model: [raceInstance: raceInstance])
		return
    }		
		
	//	flash.message = message(code: 'default.created.message', args: [message(code: 'race.label', default: 'Race'), raceInstance.id])
//		redirect(action: "show", id: raceInstance.id)
//	[raceInstance : raceInstance]

    
    def edit(Long id) {
        def raceInstance = Race.get(id)
		def mobileRequest = false
		withMobileDevice {def device ->
			mobileRequest = true
			println "in edit from mobile...." + mobileRequest
			return mobileRequest
		}
        if (!raceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'race.label', default: 'Race'), id])
            redirect(action: "list")
            return
        }
		
		if(mobileRequest) {
			render (view:"mobileEdit", model: [raceInstance: raceInstance] )
			return
		}

        [raceInstance: raceInstance]
    }

    def update(Long id, Long version) {
	   def raceInstance = Race.get(id)
	   def mobileRequest = false
	   if (!raceInstance) {
		   flash.message = message(code: 'default.not.found.message', args: [message(code: 'race.label', default: 'Race'), id])
		   redirect(action: "list")
		   return
	   }

	   withMobileDevice {def device ->
		   mobileRequest = true
		   return mobileRequest
	   }
	   if (version != null) {
		   if (raceInstance.version > version) {
			   raceInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						 [message(code: 'race.label', default: 'Race')] as Object[],
						 "Another user has updated this Runner while you were editing")
			   render(view: "edit", model: [raceInstance: raceInstance])
			   return
		   }
	   }

	   raceInstance.properties = params

	   if (!raceInstance.save(flush: true)) {
		   if(mobileRequest) {
			   render(view: "mobileEdit", model: [raceInstance: raceInstance])
			   return
		   } else {
			   render(view: "edit", model: [raceInstance: raceInstance])
			   return
		   }
	   }
	   println "flash message..."
	   flash.message = message(code: 'default.updated.message', args: [message(code: 'race.label', default: 'Race')])
	   redirect(action: "show", id: raceInstance.id)
   }

    def delete(Long id) {
        def raceInstance = Race.get(id)
        if (!raceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'race.label', default: 'Race'), id])
            redirect(action: "list")
            return
        }

        try {
            raceInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'race.label', default: 'Race')])
            redirect(action: "list")
        } 
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'race.label', default: 'Race'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def getRaceSearchList(params) {
		println "params?.searchString :::: " + params?.searchString
		def races = Race.createCriteria()
		def raceList = races.list {
			like("name", "%" +params?.searchString+"%")
		}
		return  raceList
	}

}
