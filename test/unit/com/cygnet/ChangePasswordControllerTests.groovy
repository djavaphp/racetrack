package com.cygnet



import org.junit.*
import grails.test.mixin.*

@TestFor(ChangePasswordController)
@Mock(ChangePassword)
class ChangePasswordControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/changePassword/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.changePasswordInstanceList.size() == 0
        assert model.changePasswordInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.changePasswordInstance != null
    }

    void testSave() {
        controller.save()

        assert model.changePasswordInstance != null
        assert view == '/changePassword/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/changePassword/show/1'
        assert controller.flash.message != null
        assert ChangePassword.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/changePassword/list'

        populateValidParams(params)
        def changePassword = new ChangePassword(params)

        assert changePassword.save() != null

        params.id = changePassword.id

        def model = controller.show()

        assert model.changePasswordInstance == changePassword
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/changePassword/list'

        populateValidParams(params)
        def changePassword = new ChangePassword(params)

        assert changePassword.save() != null

        params.id = changePassword.id

        def model = controller.edit()

        assert model.changePasswordInstance == changePassword
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/changePassword/list'

        response.reset()

        populateValidParams(params)
        def changePassword = new ChangePassword(params)

        assert changePassword.save() != null

        // test invalid parameters in update
        params.id = changePassword.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/changePassword/edit"
        assert model.changePasswordInstance != null

        changePassword.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/changePassword/show/$changePassword.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        changePassword.clearErrors()

        populateValidParams(params)
        params.id = changePassword.id
        params.version = -1
        controller.update()

        assert view == "/changePassword/edit"
        assert model.changePasswordInstance != null
        assert model.changePasswordInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/changePassword/list'

        response.reset()

        populateValidParams(params)
        def changePassword = new ChangePassword(params)

        assert changePassword.save() != null
        assert ChangePassword.count() == 1

        params.id = changePassword.id

        controller.delete()

        assert ChangePassword.count() == 0
        assert ChangePassword.get(changePassword.id) == null
        assert response.redirectedUrl == '/changePassword/list'
    }
}
