package racetrack
import java.util.Map;

import com.cygnet.ShiroRole
import com.cygnet.ShiroUser

import grails.plugin.mail.MailService

import org.apache.shiro.crypto.hash.Sha256Hash
import org.springframework.dao.DataIntegrityViolationException



class RunnerController {
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def index() {
        redirect(action: "list")
    }
   
	def list() {
		println "Runner @ list"
		def runnerInstanceList = []
		def mobileRequest = false
		def xhrRequest = false
		
		def f = new File( grailsApplication.config.images.location.toString() )
		if( f.exists() ){
			f.eachFile(){ file->
			if( !file.isDirectory() )
				runnerInstanceList.add( file.name )
			}
		}
		params.max = params.max ?:5
		withMobileDevice {def device ->
			println device //The toString() shows a lot of information about the device
			mobileRequest = true
			if(request.xhr){
				println "xhr request...."
				xhrRequest = true
				runnerInstanceList = getRunnerSearchList(params)
				println "runnerList :::::" + runnerInstanceList
			}
			return mobileRequest 
	   }
		if(mobileRequest ) {
			if(xhrRequest) {
				println "render from if..."
				render (template : 'runnerListMobile', model : [runnerInstanceList: runnerInstanceList, runnerInstanceTotal: runnerInstanceList.size()])
				return
			} else {
				println"render from else"
				render (view:"runnerlist", model: [runnerInstanceList: Runner.list(params), runnerInstanceTotal: Runner.count()])
				return
			}
		}
		println "Request from desktop...!!!!"
        [runnerInstanceList: Runner.list(params), runnerInstanceTotal: Runner.count()]
		//render (view:"runnerlist", model: [runnerInstanceList: Runner.list(params), runnerInstanceTotal: Runner.count()])
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
			render (view:"createMobile", model: [runnerInstance: new Runner(params)] )
			return
		}
		println "THIS SHOULD NOT BE PRINTED IN CASE OF MOBILE...."
        [runnerInstance: new Runner(params)]
		//render (view:"create" , model:[runnerInstance: new Runner(params)])
    }
	
	def RunnerService
	
    def save() {
        def runnerInstance = new Runner(params)
		def mobileRequest = false
		def user = new ShiroUser()
		
		def f = request.getFile('fileUpload')
		if(!f.empty)
		{
			println "Class: ${f.class}"
			println "Name: ${f.name}"
			println "OriginalFileName: ${f.originalFilename}"
			println "Size: ${f.size}"
			println "ContentType: ${f.contentType}"
			
			flash.message = 'Your file has been uploaded'
			new File( grailsApplication.config.images.location.toString() ).mkdirs()
			f.transferTo( new File(grailsApplication.config.images.location+ File.separatorChar + f.getOriginalFilename() ))
			runnerInstance.filename = f.getOriginalFilename()
		}
		
		withMobileDevice {def device ->
			println device
			mobileRequest = true
			println "in save from mobile...." + mobileRequest
			return mobileRequest
		}
        if (!runnerInstance.save(flush: true)){
			if(mobileRequest) {
				render (view:"createMobile", model: [runnerInstance: runnerInstance] )
				return
			}
            render(view: "create", model: [runnerInstance: runnerInstance])
			return
        }
		println "runner saved."
		try{
			runnerInstance=RunnerService.saveRunner(params)
		}
		catch(Exception e)
		{
			log.error "Problem saving runner $e.message"
		}
		flash.message = "Confirmation email sent to ${runnerInstance.email}"
        flash.message = g.message(code: 'default.created.message', args: [message(code: 'runner.label', default: 'Runner')])
        redirect(action: "list", id: runnerInstance.id)
    }

    def show(Long id) {
        def runnerInstance = Runner.get(id)
		def mobileRequest = false
		withMobileDevice {def device ->
			println device
			mobileRequest = true
			println "in save from mobile...." + mobileRequest
			return mobileRequest
		}
        if (!runnerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'runner.label', default: 'Runner'), id])
            redirect(action: "list")
            return
        }
		if(mobileRequest) {
			render (view:"showMobile", model: [runnerInstance: runnerInstance])
			return
		}
		render(view: "show", model:  [runnerInstance: runnerInstance])
		return
		//flash.message = message(code: 'runner.updated.message', args: [message(code: 'runner.label', default: 'Runner')])
    }

   def edit(Long id) {
        def runnerInstance = Runner.get(id)
		def mobileRequest = false
		withMobileDevice {def device ->
			mobileRequest = true
			println "in edit from mobile...." + mobileRequest
			return mobileRequest
		}
        if (!runnerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'runner.label', default: 'Runner'), id])
            redirect(action: "list")
            return
        }
		
		if(mobileRequest) {
			render (view:"editMobile", model: [runnerInstance: runnerInstance] )
			return
		}

        [runnerInstance: runnerInstance]
    }
   
   def update(Long id, Long version) {
	   def runnerInstance = Runner.get(id)
	   def mobileRequest = false
	   if (!runnerInstance) {
		   flash.message = message(code: 'default.not.found.message', args: [message(code: 'runner.label', default: 'Runner'), id])
		   redirect(action: "list")
		   return
	   }

	   withMobileDevice {def device ->
		   mobileRequest = true
		   return mobileRequest
	   }
	   if (version != null) {
		   if (runnerInstance.version > version) {
			   runnerInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						 [message(code: 'runner.label', default: 'Runner')] as Object[],
						 "Another user has updated this Runner while you were editing")
			   render(view: "edit", model: [runnerInstance: runnerInstance])
			   return
		   }
	   }

	   runnerInstance.properties = params

	   if (!runnerInstance.save(flush: true)) {
		   if(mobileRequest) {
			   render(view: "editMobile", model: [runnerInstance: runnerInstance])
			   return
		   } else {
			   render(view: "edit", model: [runnerInstance: runnerInstance])
			   return
		   }
	   }
	   flash.message = message(code: 'default.updated.message', args: [message(code: 'runner.label', default: 'Runner')])
	   redirect(action: "show", id: runnerInstance.id)
   }

        def delete(Long id) {
        def runnerInstance = Runner.get(id)
        if (!runnerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'runner.label', default: 'Runner'), id])
            redirect(action: "list")
            return
        }

        try {
            runnerInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'runner.label', default: 'Runner'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'runner.label', default: 'Runner'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def getRunnerSearchList(params) {
		println "params?.searchString :::: " + params?.searchString
		def runners = Runner.createCriteria()
		def runnerList = runners.list {
			like("firstName", "%" +params?.searchString+"%")
		}
		return  runnerList
	}
		
}
