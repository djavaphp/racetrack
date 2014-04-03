package racetrack



import org.junit.*
import grails.test.mixin.*

@TestFor(ParticipantsController)
@Mock(Participants)
class ParticipantsControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/participants/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.participantsInstanceList.size() == 0
        assert model.participantsInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.participantsInstance != null
    }

    void testSave() {
        controller.save()

        assert model.participantsInstance != null
        assert view == '/participants/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/participants/show/1'
        assert controller.flash.message != null
        assert Participants.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/participants/list'

        populateValidParams(params)
        def participants = new Participants(params)

        assert participants.save() != null

        params.id = participants.id

        def model = controller.show()

        assert model.participantsInstance == participants
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/participants/list'

        populateValidParams(params)
        def participants = new Participants(params)

        assert participants.save() != null

        params.id = participants.id

        def model = controller.edit()

        assert model.participantsInstance == participants
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/participants/list'

        response.reset()

        populateValidParams(params)
        def participants = new Participants(params)

        assert participants.save() != null

        // test invalid parameters in update
        params.id = participants.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/participants/edit"
        assert model.participantsInstance != null

        participants.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/participants/show/$participants.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        participants.clearErrors()

        populateValidParams(params)
        params.id = participants.id
        params.version = -1
        controller.update()

        assert view == "/participants/edit"
        assert model.participantsInstance != null
        assert model.participantsInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/participants/list'

        response.reset()

        populateValidParams(params)
        def participants = new Participants(params)

        assert participants.save() != null
        assert Participants.count() == 1

        params.id = participants.id

        controller.delete()

        assert Participants.count() == 0
        assert Participants.get(participants.id) == null
        assert response.redirectedUrl == '/participants/list'
    }
}
