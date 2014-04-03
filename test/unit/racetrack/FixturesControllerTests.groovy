package racetrack



import org.junit.*
import grails.test.mixin.*

@TestFor(FixturesController)
@Mock(Fixtures)
class FixturesControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/fixtures/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.fixturesInstanceList.size() == 0
        assert model.fixturesInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.fixturesInstance != null
    }

    void testSave() {
        controller.save()

        assert model.fixturesInstance != null
        assert view == '/fixtures/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/fixtures/show/1'
        assert controller.flash.message != null
        assert Fixtures.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/fixtures/list'

        populateValidParams(params)
        def fixtures = new Fixtures(params)

        assert fixtures.save() != null

        params.id = fixtures.id

        def model = controller.show()

        assert model.fixturesInstance == fixtures
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/fixtures/list'

        populateValidParams(params)
        def fixtures = new Fixtures(params)

        assert fixtures.save() != null

        params.id = fixtures.id

        def model = controller.edit()

        assert model.fixturesInstance == fixtures
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/fixtures/list'

        response.reset()

        populateValidParams(params)
        def fixtures = new Fixtures(params)

        assert fixtures.save() != null

        // test invalid parameters in update
        params.id = fixtures.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/fixtures/edit"
        assert model.fixturesInstance != null

        fixtures.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/fixtures/show/$fixtures.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        fixtures.clearErrors()

        populateValidParams(params)
        params.id = fixtures.id
        params.version = -1
        controller.update()

        assert view == "/fixtures/edit"
        assert model.fixturesInstance != null
        assert model.fixturesInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/fixtures/list'

        response.reset()

        populateValidParams(params)
        def fixtures = new Fixtures(params)

        assert fixtures.save() != null
        assert Fixtures.count() == 1

        params.id = fixtures.id

        controller.delete()

        assert Fixtures.count() == 0
        assert Fixtures.get(fixtures.id) == null
        assert response.redirectedUrl == '/fixtures/list'
    }
}
