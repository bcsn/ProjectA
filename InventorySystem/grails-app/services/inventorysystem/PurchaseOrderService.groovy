package inventorysystem

class PurchaseOrderService {
	
	
	void processCreation(purchaseorder) {
		
		println "---enter"
		def activityLog = new ActivityLog (
			description: purchaseorder.poDescription,
			employeeName: "test").save(failOnError:true)
	}

}
