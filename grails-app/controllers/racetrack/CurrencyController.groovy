package racetrack

import org.springframework.dao.DataIntegrityViolationException

class CurrencyController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [currencyInstanceList: Currency.list(params), currencyInstanceTotal: Currency.count()]
    }

    def create() {
        [currencyInstance: new Currency(params)]
    }

    def save() {
        def currencyInstance = new Currency(params)
        if (!currencyInstance.save(flush: true)) {
            render(view: "create", model: [currencyInstance: currencyInstance])
            return
        }
        flash.message = message(code: 'default.created.message', args: [message(code: 'currency.label', default: 'Currency'), currencyInstance.id])
       // redirect(action: "show", id: currencyInstance.id)
		render(view:"symbol")
    }

    def show(Long id) {
        def currencyInstance = Currency.get(id)
        if (!currencyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'currency.label', default: 'Currency'), id])
            redirect(action: "list")
            return
        }

        [currencyInstance: currencyInstance]
    }

    def edit(Long id) {
        def currencyInstance = Currency.get(id)
        if (!currencyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'currency.label', default: 'Currency'), id])
            redirect(action: "list")
            return
        }

        [currencyInstance: currencyInstance]
    }

    def update(Long id, Long version) {
        def currencyInstance = Currency.get(id)
        if (!currencyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'currency.label', default: 'Currency'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (currencyInstance.version > version) {
                currencyInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'currency.label', default: 'Currency')] as Object[],
                          "Another user has updated this Currency while you were editing")
                render(view: "edit", model: [currencyInstance: currencyInstance])
                return
            }
        }

        currencyInstance.properties = params

        if (!currencyInstance.save(flush: true)) {
            render(view: "edit", model: [currencyInstance: currencyInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'currency.label', default: 'Currency'), currencyInstance.id])
        redirect(action: "show", id: currencyInstance.id)
    }

    def delete(Long id) {
        def currencyInstance = Currency.get(id)
        if (!currencyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'currency.label', default: 'Currency'), id])
            redirect(action: "list")
            return
        }

        try {
            currencyInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'currency.label', default: 'Currency'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'currency.label', default: 'Currency'), id])
            redirect(action: "show", id: id)
        }
    }
}
