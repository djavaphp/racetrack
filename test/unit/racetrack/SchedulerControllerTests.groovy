package racetrack



import org.junit.*
import grails.test.mixin.*

@TestFor(SchedulerController)
@Mock(Scheduler)
class SchedulerControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/scheduler/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.schedulerInstanceList.size() == 0
        assert model.schedulerInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.schedulerInstance != null
    }

    void testSave() {
        controller.save()

        assert model.schedulerInstance != null
        assert view == '/scheduler/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/scheduler/show/1'
        assert controller.flash.message != null
        assert Scheduler.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/scheduler/list'

        populateValidParams(params)
        def scheduler = new Scheduler(params)

        assert scheduler.save() != null

        params.id = scheduler.id

        def model = controller.show()

        assert model.schedulerInstance == scheduler
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/scheduler/list'

        populateValidParams(params)
        def scheduler = new Scheduler(params)

        assert scheduler.save() != null

        params.id = scheduler.id

        def model = controller.edit()

        assert model.schedulerInstance == scheduler
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/scheduler/list'

        response.reset()

        populateValidParams(params)
        def scheduler = new Scheduler(params)

        assert scheduler.save() != null

        // test invalid parameters in update
        params.id = scheduler.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/scheduler/edit"
        assert model.schedulerInstance != null

        scheduler.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/scheduler/show/$scheduler.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        scheduler.clearErrors()

        populateValidParams(params)
        params.id = scheduler.id
        params.version = -1
        controller.update()

        assert view == "/scheduler/edit"
        assert model.schedulerInstance != null
        assert model.schedulerInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/scheduler/list'

        response.reset()

        populateValidParams(params)
        def scheduler = new Scheduler(params)

        assert scheduler.save() != null
        assert Scheduler.count() == 1

        params.id = scheduler.id

        controller.delete()

        assert Scheduler.count() == 0
        assert Scheduler.get(scheduler.id) == null
        assert response.redirectedUrl == '/scheduler/list'
    }
}
