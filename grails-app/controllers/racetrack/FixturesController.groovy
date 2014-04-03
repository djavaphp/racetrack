package racetrack
import grails.converters.JSON

import java.text.SimpleDateFormat

import com.mysql.jdbc.Constants


import org.springframework.dao.DataIntegrityViolationException

class FixturesController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
		def mobileRequest = false
		params.max = params.max ?:8
		withMobileDevice {def device ->
			mobileRequest = true
			 return mobileRequest
	   }
		if(mobileRequest) {
			params.max = Math.min(max ?: 10, 100)
			render (view:"list", model: [fixturesInstanceList: Fixtures.list(params), fixturesInstanceTotal: Fixtures.count()] )
			return
		}else {
			redirect(controller:"auth", action:"home")
		}
		
       /* params.max = Math.min(max ?: 10, 100)
        [fixturesInstanceList: Fixtures.list(params), fixturesInstanceTotal: Fixtures.count(), titleList : ["Australian Grand Prix","Malaysian Grand Prix"]]*/
    }

    def create() {
        [fixturesInstance: new Fixtures(params)]
    }

    def save() {
        def fixturesInstance = new Fixtures(params)
        if (!fixturesInstance.save(flush: true)) {
            render(view: "create", model: [fixturesInstance: fixturesInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'fixtures.label', default: 'Fixtures'), fixturesInstance.id])
        redirect(action: "show", id: fixturesInstance.id)
    }

    def show(Long id) {
        def fixturesInstance = Fixtures.get(id)
        if (!fixturesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fixtures.label', default: 'Fixtures'), id])
            redirect(action: "list")
            return
        }

        [fixturesInstance: fixturesInstance]
    }

    def edit(Long id) {
        def fixturesInstance = Fixtures.get(id)
        if (!fixturesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fixtures.label', default: 'Fixtures'), id])
            redirect(action: "list")
            return
        }

        [fixturesInstance: fixturesInstance]
    }

    def update(Long id, Long version) {
        def fixturesInstance = Fixtures.get(id)
        if (!fixturesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fixtures.label', default: 'Fixtures'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (fixturesInstance.version > version) {
                fixturesInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'fixtures.label', default: 'Fixtures')] as Object[],
                          "Another user has updated this Fixtures while you were editing")
                render(view: "edit", model: [fixturesInstance: fixturesInstance])
                return
            }
        }

        fixturesInstance.properties = params

        if (!fixturesInstance.save(flush: true)) {
            render(view: "edit", model: [fixturesInstance: fixturesInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'fixtures.label', default: 'Fixtures'), fixturesInstance.id])
        redirect(action: "show", id: fixturesInstance.id)
    }

    def delete(Long id) {
        def fixturesInstance = Fixtures.get(id)
        if (!fixturesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fixtures.label', default: 'Fixtures'), id])
            redirect(action: "list")
            return
        }

        try {
            fixturesInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'fixtures.label', default: 'Fixtures'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'fixtures.label', default: 'Fixtures'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def getFixtures(){
		println params
		def listSize=0
		def isCriteria = false
		def fixturesInstanceList
		if(params.fixtureTitle.equals("-- Select --")) {
			fixturesInstanceList = Fixtures.list()
		}else {
			fixturesInstanceList = Fixtures.findAllByFixtureTitleLike("%"+params.fixtureTitle+"%")
		}
//		render fixturesInstanceList // as JSON
		render(template:"fixtureList", model:[fixturesInstanceList : fixturesInstanceList])
	}
}
