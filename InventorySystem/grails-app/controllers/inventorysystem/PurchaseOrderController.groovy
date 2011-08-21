package inventorysystem

class PurchaseOrderController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def purchaseOrderService
	
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [purchaseOrderInstanceList: PurchaseOrder.list(params), purchaseOrderInstanceTotal: PurchaseOrder.count()]
    }

    def create = {
        def purchaseOrderInstance = new PurchaseOrder()
        purchaseOrderInstance.properties = params
        return [purchaseOrderInstance: purchaseOrderInstance]
    }

    def save = {
        def purchaseOrderInstance = new PurchaseOrder(params)
		
        if (purchaseOrderInstance.save(flush: true)) {
			
			purchaseOrderService.processCreation(purchaseOrderInstance)
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'purchaseOrder.label', default: 'PurchaseOrder'), purchaseOrderInstance.id])}"
			
            redirect(action: "show", id: purchaseOrderInstance.id)
        }
        else {
            render(view: "create", model: [purchaseOrderInstance: purchaseOrderInstance])
        }
    }

    def show = {
        def purchaseOrderInstance = PurchaseOrder.get(params.id)
		
        if (!purchaseOrderInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'purchaseOrder.label', default: 'PurchaseOrder'), params.id])}"
            redirect(action: "list")
        }
        else {
            [purchaseOrderInstance: purchaseOrderInstance]
        }
    }

    def edit = {
        def purchaseOrderInstance = PurchaseOrder.get(params.id)
        if (!purchaseOrderInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'purchaseOrder.label', default: 'PurchaseOrder'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [purchaseOrderInstance: purchaseOrderInstance]
        }
    }

    def update = {
        def purchaseOrderInstance = PurchaseOrder.get(params.id)
        if (purchaseOrderInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (purchaseOrderInstance.version > version) {
                    
                    purchaseOrderInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'purchaseOrder.label', default: 'PurchaseOrder')] as Object[], "Another user has updated this PurchaseOrder while you were editing")
                    render(view: "edit", model: [purchaseOrderInstance: purchaseOrderInstance])
                    return
                }
            }
            purchaseOrderInstance.properties = params
            if (!purchaseOrderInstance.hasErrors() && purchaseOrderInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'purchaseOrder.label', default: 'PurchaseOrder'), purchaseOrderInstance.id])}"
                redirect(action: "show", id: purchaseOrderInstance.id)
            }
            else {
                render(view: "edit", model: [purchaseOrderInstance: purchaseOrderInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'purchaseOrder.label', default: 'PurchaseOrder'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def purchaseOrderInstance = PurchaseOrder.get(params.id)
        if (purchaseOrderInstance) {
            try {
                purchaseOrderInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'purchaseOrder.label', default: 'PurchaseOrder'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'purchaseOrder.label', default: 'PurchaseOrder'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'purchaseOrder.label', default: 'PurchaseOrder'), params.id])}"
            redirect(action: "list")
        }
    }
}
