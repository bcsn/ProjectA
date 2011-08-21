package inventorysystem

class ActivityLogController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [activityLogInstanceList: ActivityLog.list(params), activityLogInstanceTotal: ActivityLog.count()]
    }

    def create = {
        def activityLogInstance = new ActivityLog()
        activityLogInstance.properties = params
        return [activityLogInstance: activityLogInstance]
    }

    def save = {
        def activityLogInstance = new ActivityLog(params)
        if (activityLogInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'activityLog.label', default: 'ActivityLog'), activityLogInstance.id])}"
            redirect(action: "show", id: activityLogInstance.id)
        }
        else {
            render(view: "create", model: [activityLogInstance: activityLogInstance])
        }
    }

    def show = {
        def activityLogInstance = ActivityLog.get(params.id)
        if (!activityLogInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'activityLog.label', default: 'ActivityLog'), params.id])}"
            redirect(action: "list")
        }
        else {
            [activityLogInstance: activityLogInstance]
        }
    }

    def edit = {
        def activityLogInstance = ActivityLog.get(params.id)
        if (!activityLogInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'activityLog.label', default: 'ActivityLog'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [activityLogInstance: activityLogInstance]
        }
    }

    def update = {
        def activityLogInstance = ActivityLog.get(params.id)
        if (activityLogInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (activityLogInstance.version > version) {
                    
                    activityLogInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'activityLog.label', default: 'ActivityLog')] as Object[], "Another user has updated this ActivityLog while you were editing")
                    render(view: "edit", model: [activityLogInstance: activityLogInstance])
                    return
                }
            }
            activityLogInstance.properties = params
            if (!activityLogInstance.hasErrors() && activityLogInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'activityLog.label', default: 'ActivityLog'), activityLogInstance.id])}"
                redirect(action: "show", id: activityLogInstance.id)
            }
            else {
                render(view: "edit", model: [activityLogInstance: activityLogInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'activityLog.label', default: 'ActivityLog'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def activityLogInstance = ActivityLog.get(params.id)
        if (activityLogInstance) {
            try {
                activityLogInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'activityLog.label', default: 'ActivityLog'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'activityLog.label', default: 'ActivityLog'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'activityLog.label', default: 'ActivityLog'), params.id])}"
            redirect(action: "list")
        }
    }
}
