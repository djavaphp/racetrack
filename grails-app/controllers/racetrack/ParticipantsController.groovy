package racetrack

import org.springframework.dao.DataIntegrityViolationException

class ParticipantsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }
	
	def generate()
	{
		//flash.flagstatus="false"
		def participantsInstance = new Participants(params)
		println "Inside generate action"
		String fileName = /myfile.xls/
		ExcelImporter importer = new ExcelImporter(fileName);
	
		def participantsMapList = importer.getParticipants();
	
		 participantsMapList.each { Map participantParams ->
			
			def newParticipants = new Participants(participantParams)
			if (!newParticipants.save())
			{
				//flash.flagstatus="true"
				log.error " ${newParticipants.name} ${newParticipants.email} ${newParticipants.address} ${newParticipants.zipcode}"
			}
		}
		redirect(action: "list", params: params)
	}

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [participantsInstanceList: Participants.list(params), participantsInstanceTotal: Participants.count()]
    }

    def create() {
        [participantsInstance: new Participants(params)]
    }

    def save() {
        def participantsInstance = new Participants(params)
        if (!participantsInstance.save(flush: true)) {
            render(view: "create", model: [participantsInstance: participantsInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'participants.label', default: 'Participants'), participantsInstance.id])
        redirect(action: "show", id: participantsInstance.id)
    }

    def show(Long id) {
        def participantsInstance = Participants.get(id)
        if (!participantsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'participants.label', default: 'Participants'), id])
            redirect(action: "list")
            return
        }

        [participantsInstance: participantsInstance]
    }

    def edit(Long id) {
        def participantsInstance = Participants.get(id)
        if (!participantsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'participants.label', default: 'Participants'), id])
            redirect(action: "list")
            return
        }

        [participantsInstance: participantsInstance]
    }

    def update(Long id, Long version) {
        def participantsInstance = Participants.get(id)
        if (!participantsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'participants.label', default: 'Participants'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (participantsInstance.version > version) {
                participantsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'participants.label', default: 'Participants')] as Object[],
                          "Another user has updated this Participants while you were editing")
                render(view: "edit", model: [participantsInstance: participantsInstance])
                return
            }
        }

        participantsInstance.properties = params

        if (!participantsInstance.save(flush: true)) {
            render(view: "edit", model: [participantsInstance: participantsInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'participants.label', default: 'Participants'), participantsInstance.id])
        redirect(action: "show", id: participantsInstance.id)
    }

    def delete(Long id) {
        def participantsInstance = Participants.get(id)
        if (!participantsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'participants.label', default: 'Participants'), id])
            redirect(action: "list")
            return
        }

        try {
            participantsInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'participants.label', default: 'Participants'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'participants.label', default: 'Participants'), id])
            redirect(action: "show", id: id)
        }
    }
}
