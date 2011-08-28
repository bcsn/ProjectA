package inventorysystem

class Company {

	String companyName
	
	static hasMany = [employees: User, products: Product, purchaseOrders: PurchaseOrder]
	
    static constraints = {		
		companyName	(nullable:false, blank:false)
    }
	
	String toString(){
		return "$companyName"
	}
}
